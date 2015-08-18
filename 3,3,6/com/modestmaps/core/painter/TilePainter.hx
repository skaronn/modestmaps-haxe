package com.modestmaps.core.painter;

import haxe.ds.ObjectMap;
import haxe.ds.StringMap;
import haxe.macro.Type;

import openfl.display.Bitmap;
import openfl.display.Loader;
import openfl.display.LoaderInfo;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import openfl.events.IOErrorEvent;
import openfl.events.ProgressEvent;
import openfl.events.TimerEvent;
import openfl.net.URLRequest;
import openfl.system.LoaderContext;
//import flash.utils.Dictionary;
import openfl.utils.Object;
import openfl.utils.Timer;
import openfl.errors.Error;

import com.modestmaps.core.Coordinate;
import com.modestmaps.core.Tile;
import com.modestmaps.core.TileGrid;
import com.modestmaps.events.MapEvent;
import com.modestmaps.mapproviders.IMapProvider;

class TilePainter extends EventDispatcher implements ITilePainter
{
	private static inline var DEFAULT_CACHE_LOADERS:Bool = false;  // !!! only enable this if you have crossdomain permissions to access Loader content
	private static inline var DEFAULT_SMOOTH_CONTENT:Bool = false; // !!! only enable this if you have crossdomain permissions to access Loader content
	private static inline var DEFAULT_MAX_LOADER_CACHE_SIZE:Int = 0;  // !!! suggest 256 or so
	private static inline var DEFAULT_MAX_OPEN_REQUESTS:Int = 4;	  // TODO: should this be split into max-new-requests-per-frame, too?

	///////////// BEGIN OPTIONS

	/** set this to true to enable bitmap smoothing on tiles - requires crossdomain.xml permissions so won't work online with most providers */
	public static var smoothContent:Bool = DEFAULT_SMOOTH_CONTENT;

	/** how many Loaders are allowed to be open at once? */
	public static var maxOpenRequests:Int = DEFAULT_MAX_OPEN_REQUESTS;

	/** with tile providers that you have crossdomain.xml support for, 
	 *  it's possible to avoid extra requests by reusing bitmapdata. enable cacheLoaders to try and do that */
	public static var cacheLoaders:Bool = DEFAULT_CACHE_LOADERS;
	public static var maxLoaderCacheSize:Int = DEFAULT_MAX_LOADER_CACHE_SIZE;

	///////////// END OPTIONS

	private var provider:IMapProvider;	
	private var tileGrid:TileGrid;
	private var tileQueue:TileQueue;
	private var tileCache:TileCache;
	private var tilePool:TilePool;	
	private var queueFunction:Object;
	private var queueTimer:Timer;	

	// per-tile, the array of images we're going to load, which can be empty
	// TODO: document this in IMapProvider, so that provider implementers know
	// they are free to check the bounds of their overlays and don't have to serve
	// millions of 404s
	private var layersNeeded:ObjectMap<Object, Object> = new ObjectMap<Object, Object>();	
	private var loaderTiles:ObjectMap<Object, Object> = new ObjectMap<Object, Object>();

	// open requests
	private var openRequests:Array<Object> = [];

	// keeping track for dispatching MapEvent.ALL_TILES_LOADED and MapEvent.BEGIN_TILE_LOADING
	private var previousOpenRequests:Int = 0;

	// loader cache is shared across map instances, hence this is static for the time being	
	private static var loaderCache:ObjectMap<Object, Object>;
	private static var cachedUrls:Array<String> = [];

	/**
	 * 
	 * @param	tileGrid
	 * @param	provider
	 * @param	queueFunction
	 */
	public function new(tileGrid:TileGrid, provider:IMapProvider, queueFunction:Dynamic)
	{
		super(null);
		
		this.tileGrid = tileGrid;
		this.provider = provider;
		this.queueFunction = queueFunction;

		// TODO: pass all these into the constructor so they can be shared, swapped out or overridden
		this.tileQueue = new TileQueue();
		this.tilePool = new TilePool(Tile);
		this.tileCache = new TileCache(tilePool);
		queueTimer = new Timer(200);

		queueTimer.addEventListener(TimerEvent.TIMER, processQueue);	
		
		// TODO: this used to be called onAddedToStage, is this bad?
		queueTimer.start();
	}

	/** 
	* The classes themselves serve as factories!
	* 
	* @param tileClass e.g. Tile, TweenTile, etc.
	* 
	* @see http://norvig.com/design-patterns/img013.gif  
	*/ 
	public function setTileClass(tileClass:Class<Dynamic>):Void
	{
		// assign the new class, which creates a new pool array
		tilePool.setTileClass(tileClass);
	}

	/**
	* 
	* @param	provider
	*/
	public function setMapProvider(provider:IMapProvider):Void
	{
		this.provider = provider;
		// TODO: clear various things, no doubt?	
	}

	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function getTileFromCache(key:String):Tile
	{
		return tileCache.getTile(key);
	}

	/**
	 * 
	 * @param	recentlySeen
	 */
	public function retainKeysInCache(recentlySeen:Array<Dynamic>):Void
	{
		tileCache.retainKeys(recentlySeen); 		
	}

	/**
	 * 
	 * @param	coord
	 * @param	key
	 * @return
	 */
	public function createAndPopulateTile(coord:Coordinate, key:String):Tile
	{
		var tile:Tile = tilePool.getTile(Std.int(coord.column), Std.int(coord.row), Std.int(coord.zoom));
		tile.name = key;
		//flash.Lib.trace("TilePainter.hx - createAndPopulateTile - provider : " + provider);
		var urls:Array<Dynamic> = provider.getTileUrls(coord);
		//flash.Lib.trace("TilePainter.hx - createAndPopulateTile - urls : " + urls);
		//flash.Lib.trace("TilePainter.hx - createAndPopulateTile - layersNeeded : " + layersNeeded);
		if (urls != null && urls.length > 0) {
			// keep a local copy of the URLs so we don't have to call this twice:
			layersNeeded.set(tile.name, urls);
			tileQueue.push(tile);
		}
		else {
			// trace("no urls needed for that tile", tempCoord);
			tile.show();
		}
		return tile;		
	}

	/**
	 * 
	 * @param	tile
	 * @return
	 */
	public function isPainted(tile:Tile):Bool
	{
		//return layersNeeded.get(tile.name) == null;	
		return layersNeeded.get(tile.name) != null;	
	}

	/**
	 * 
	 * @param	tile
	 */
	public function cancelPainting(tile:Tile):Void
	{
		if (tileQueue.contains(tile)) {
			tileQueue.remove(tile);
		}
		
		for (i in openRequests.length - 1...0) {
			var loader:Loader = cast(openRequests[i], Loader);
			if (loader.name == tile.name) {
				loaderTiles.set(loader, null);
				loaderTiles.remove(loader);
			}
		}
		
		if (!tileCache.containsKey(tile.name)) {
			tilePool.returnTile(tile);
		}
		
		layersNeeded.remove(tile.name);
	}

	/**
	 * 
	 * @param	tile
	 * @return
	 */
	public function isPainting(tile:Tile):Bool
	{
		return layersNeeded.get(tile.name) == null;	
	}

	public function reset():Void
	{
		for (loader in openRequests)
		{
			var tile:Tile = cast(loaderTiles.get(loader), Tile);
			loaderTiles.set(loader, null);
			loaderTiles.remove(loader);
			if (!tileCache.containsKey(tile.name)) {
				tilePool.returnTile(tile);
			}
			try {
				// la la I can't hear you
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadEnd);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadError);
				loader.close();
			}
			catch (error:Error) {
				// close often doesn't work, no biggie
				error.getStackTrace();
			}
		}
		
		openRequests = [];
				
		//flash.Lib.trace("TilePainter.hx - reset - layersNeeded : " + layersNeeded);
		
		if (layersNeeded != null)
		{
			for (key in layersNeeded)
			{
				//trace("TilePainter.hx - reset - layersNeeded.get("+key+") : " + layersNeeded.get(key));
				layersNeeded.remove(key);
			}
		}		

		layersNeeded = new ObjectMap<Object, Object>();
		
		tileQueue.clear();
			
		tileCache.clear();			
	}

	/**
	 * 
	 * @param	tile
	 */
	private function loadNextURLForTile(tile:Tile):Void
	{
		// TODO: add urls to Tile?
		//flash.Lib.trace("TilePainter.hx - loadNextURLForTile - tile : " + tile);
		//flash.Lib.trace("TilePainter.hx - loadNextURLForTile - layersNeeded.get("+tile.name+") : "+ layersNeeded.get(tile.name));
		var urls:Array<Object> = cast(layersNeeded.get(tile.name), Array<Object>);
		//flash.Lib.trace("TilePainter.hx - loadNextURLForTile - urls : "+ urls);
		if (urls != null && urls.length > 0)
		{
			var url:Dynamic = urls.shift();
			if (cacheLoaders && Std.is(url, String) && loaderCache.get(url))
			{
				var original:Bitmap = cast(loaderCache.get(url), Bitmap);
				var bitmap:Bitmap = new Bitmap(original.bitmapData); 
				tile.addChild(bitmap);
				loadNextURLForTile(tile);
			}
			else {
				//trace("loadNextURLForTile - requesting : "+ url);
				var tileLoader:Loader = new Loader();
				//trace("loadNextURLForTile - loaderTiles : "+ loaderTiles);
				loaderTiles.set(tileLoader, tile);
				tileLoader.name = tile.name;
				try {
					if (cacheLoaders || smoothContent) {
						// check crossdomain permissions on tiles if we plan to access their bitmap content
						tileLoader.load(Std.is(url, URLRequest) ? url : new URLRequest(url), new LoaderContext(true));
					}
					else {
						var urlRequest:URLRequest = Std.is(url, URLRequest) ? url : new URLRequest(url);
						//trace("loadNextURLForTile - urlRequest.url : "+ urlRequest.url);
						tileLoader.load(urlRequest);
					}
					tileLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadEnd, false, 0, true);
					tileLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError, false, 0, true);
					openRequests.push(tileLoader);
				}
				catch(error:Error) {
					tile.paintError();
				}
			}
		}
		else if (urls != null && urls.length == 0) {
			tileGrid.tilePainted(tile);
			tileCache.putTile(tile);
			//untyped __delete__(layersNeeded, tile.name);
			layersNeeded.remove(tile.name);
		}		
	}	

	/**
	 * called by the onEnterFrame handler to manage the tileQueue
	 * usual operation is extremely quick, ~1ms or so 
	 * 
	 * @param	event
	 */
	private function processQueue(event:TimerEvent=null):Void
	{
		if (openRequests.length < maxOpenRequests && tileQueue.length > 0)
		{
			// prune queue for tiles that aren't visible
			var removedTiles:Array<Object> = tileQueue.retainAll(tileGrid.getVisibleTiles());
			
			// keep layersNeeded tidy:
			for (removedTile in removedTiles)
			{
				this.cancelPainting(removedTile);
			}
			
			// note that queue is not the same as visible tiles, because things 
			// that have already been loaded are also in visible tiles. if we
			// reuse visible tiles for the queue we'll be loading the same things over and over

			// sort queue by distance from 'center'
			tileQueue.sortTiles(queueFunction);

			// process the queue
			while (openRequests.length < maxOpenRequests && tileQueue.length > 0)
			{
				var tile:Tile = tileQueue.shift();
				// if it's still on the stage:
				if (tile.parent!=null) {
					loadNextURLForTile(tile);
				}
			}
		}

		// you might want to wait for tiles to load before displaying other data, interface elements, etc.
		// these events take care of that for you...
		if (previousOpenRequests == 0 && openRequests.length > 0) {
			dispatchEvent(new MapEvent(MapEvent.BEGIN_TILE_LOADING));
		}
		else if (previousOpenRequests > 0)
		{
			// TODO: a custom event for load progress rather than overloading bytesloaded?
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS, false, false, previousOpenRequests - openRequests.length, previousOpenRequests));

			// if we're finished...
			if (openRequests.length == 0)
			{
				dispatchEvent(new MapEvent(MapEvent.ALL_TILES_LOADED));
			}
		}
		
		previousOpenRequests = openRequests.length;
	}

	/**
	 * 
	 * @param	event
	 */
	private function onLoadEnd(event:Event):Void
	{
		var loader:Loader = cast(event.target, LoaderInfo).loader;
		
		if (cacheLoaders && !loaderCache.get(loader.contentLoaderInfo.url)) {
			trace("caching content for" + loader.contentLoaderInfo.url);
			try {
				var content:Bitmap = cast(loader.content, Bitmap);
				loaderCache.set(loader.contentLoaderInfo.url, content);
				cachedUrls.push(loader.contentLoaderInfo.url);
				if (cachedUrls.length > maxLoaderCacheSize) {
					loaderCache.remove(cachedUrls.shift());
				}
			}
			catch (error:Error) {
				error.getStackTrace();
			}
		}
			
		if (smoothContent) {
			try {
				var smoothContent:Bitmap = cast(loader.content, Bitmap);
				smoothContent.smoothing = true;
			}
			catch (error:Error) {
				error.getStackTrace();
			}
		}		

		// tidy up the request monitor
		var index:Int = openRequests.indexOf(loader);
		
		if (index >= 0) {
			openRequests.splice(index,1);
		}
		
		var tile:Tile = cast(loaderTiles.get(loader), Tile);
		
		if (tile != null){ 
			tile.addChild(loader);
			loadNextURLForTile(tile);
		}
		else {
		// we've loaded an image, but its parent tile has been removed
		// so we'll have to throw it away
		}
		
		loaderTiles.set(loader, null);
		loaderTiles.remove(loader);
	}

	/**
	 * 
	 * @param	event
	 */
	private function onLoadError(event:IOErrorEvent):Void
	{
		var loaderInfo:LoaderInfo = cast(event.target, LoaderInfo);
		for (i in openRequests.length - 1...0)
		{
			var loader:Loader = cast(openRequests[i], Loader);
			if (loader.contentLoaderInfo == loaderInfo)
			{
				openRequests.splice(i,1);
				layersNeeded.remove(loader.name);
				var tile:Tile = cast(loaderTiles.get(loader), Tile);
				if (tile != null)
				{
					tile.paintError(provider.tileWidth(), provider.tileHeight());
					tileGrid.tilePainted(tile);
					loaderTiles.set(loader, null);
					loaderTiles.remove(loader);
				}		
			}
		}
	}

	public function getLoaderCacheCount():Int
	{
		return cachedUrls.length;	
	}		

	public function getQueueCount():Int
	{
		return tileQueue.length;
	}

	public function getRequestCount():Int
	{
		return openRequests.length;
	}

	public function getCacheSize():Int
	{
		return tileCache.size;
	}	
}