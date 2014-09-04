package com.modestmaps.core;

import com.modestmaps.core.painter.ITilePainter;
import com.modestmaps.core.painter.ITilePainterOverride;
import com.modestmaps.core.painter.TilePainter;
import com.modestmaps.events.MapEvent;
import com.modestmaps.mapproviders.IMapProvider;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.ProgressEvent;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.utils.Timer;

class TileGrid extends Sprite
{
	// OPTIONS
	///////////////////////////////

	// TODO: split these out into a TileGridOptions class and allow mass setting/getting?

	private static inline var DEFAULT_MAX_PARENT_SEARCH:Int = 5;
	private static inline var DEFAULT_MAX_PARENT_LOAD:Int = 0; // enable this to load lower zoom tiles first
	private static inline var DEFAULT_MAX_CHILD_SEARCH:Int = 1;
	private static inline var DEFAULT_MAX_TILES_TO_KEEP:Int = 256; // 256*256*4bytes = 0.25MB ... so 256 tiles is 64MB of memory, minimum!
	private static inline var DEFAULT_TILE_BUFFER:Int = 1;
	private static inline var DEFAULT_ENFORCE_BOUNDS:Bool = true;
	private static inline var DEFAULT_ROUND_POSITIONS:Bool = true;
	private static inline var DEFAULT_ROUND_SCALES:Bool = true;

	/** if we don't have a tile at currentZoom, onRender will look for tiles up to 5 levels out.
	 *  set this to 0 if you only want the current zoom level's tiles
	 *  WARNING: tiles will get scaled up A LOT for this, but maybe it beats blank tiles? */ 
	public var maxParentSearch:Int = DEFAULT_MAX_PARENT_SEARCH;
	/** if we don't have a tile at currentZoom, onRender will look for tiles up to one levels further in.
	 *  set this to 0 if you only want the current zoom level's tiles
		 *  WARNING: bad, bad nasty recursion possibilities really soon if you go much above 1
	 *  - it works, but you probably don't want to change this number :) */
	public var maxChildSearch:Int = DEFAULT_MAX_CHILD_SEARCH;

	/** if maxParentSearch is enabled, setting maxParentLoad to between 1 and maxParentSearch
	 *   will make requests for lower zoom levels first */
	public var maxParentLoad:Int = DEFAULT_MAX_PARENT_LOAD;

	/** this is the maximum size of tileCache (visible tiles will also be kept in the cache) */	
	public var maxTilesToKeep:Int = DEFAULT_MAX_TILES_TO_KEEP;

	// 0 or 1, really: 2 will load *lots* of extra tiles
	public var tileBuffer:Int = DEFAULT_TILE_BUFFER;

	/** set this to true to enable enforcing of map bounds from the map provider's limits */
	public var enforceBoundsEnabled:Bool = DEFAULT_ENFORCE_BOUNDS;

	/** set this to false, along with roundScalesEnabled, if you need a map to stay 'fixed' in place as it changes size */
	public var roundPositionsEnabled:Bool = DEFAULT_ROUND_POSITIONS;

	/** set this to false, along with roundPositionsEnabled, if you need a map to stay 'fixed' in place as it changes size */
	public var roundScalesEnabled:Bool = DEFAULT_ROUND_SCALES;

	///////////////////////////////
	// END OPTIONS

	// TILE_WIDTH and TILE_HEIGHT are now tileWidth and tileHeight
	// this was needed for the NASA DailyPlanetProvider which has 512x512px tiles
	// public static inline var TILE_WIDTH:Float = 256;
	// public static inline var TILE_HEIGHT:Float = 256;	

	// read-only, kept up to date by calculateBounds()
	private var _minZoom:Float;
	private var _maxZoom:Float;

	private var minTx:Float;
	private var maxTx:Float;
	private var minTy:Float;
	private var maxTy:Float;

	// read-only, convenience for tileWidth/Height
	private var _tileWidth:Float;
	private var _tileHeight:Float;

	// pan and zoom etc are stored in here
	// NB: this matrix is never applied to a DisplayObject's transform
	//	 because it would require scaling tile positions to compensate.
	//	 Instead, we adapt its values such that the current zoom level
	//	 is approximately scale 1, and positions make sense in screen pixels
	private var worldMatrix:Matrix;

	// this turns screen points into coordinates
	private var _invertedMatrix:Matrix; // use lazy getter for this

	// the corners and center of the screen, in map coordinates
	// (these also have lazy getters)
	private var _topLeftCoordinate:Coordinate;
	private var _bottomRightCoordinate:Coordinate;
	private var _topRightCoordinate:Coordinate;
	private var _bottomLeftCoordinate:Coordinate;
	private var _centerCoordinate:Coordinate;

	// where the tiles live:
	private var well:Sprite;

	//private var provider:IMapProvider;
	private var tilePainter:ITilePainter;

	// coordinate bounds derived from IMapProviders
	private var limits:Array<Dynamic>;

	// keys we've recently seen
	private var recentlySeen:Array<Dynamic>;

	// currently visible tiles
	private var visibleTiles:Array<Dynamic>;
		
	// number of tiles we're failing to show
	private var blankCount:Int = 0;

	// a textfield with lots of stats
	public var debugField:DebugField;

	// what zoom level of tiles is 'correct'?
	private var _currentTileZoom:Int; 
	// so we know if we're going in or out
	private var previousTileZoom:Int;	

	// for sorting the queue:
	private var centerRow:Float;
	private var centerColumn:Float;

	// for pan events
	private var startPan:Coordinate;
	public var panning:Bool;

	// previous mouse position when dragging 
	private var pmouse:Point;

	// for zoom events
	private var startZoom:Float = -1;
	public var zooming:Bool;

	private var mapWidth:Float;
	private var mapHeight:Float;

	private var draggable:Bool;

	// setting this.dirty = true will request an Event.RENDER
	private var _dirty:Bool;

	// setting to true will dispatch a CHANGE event which Map will convert to an EXTENT_CHANGED for us
	private var matrixChanged:Bool = false;

	public function new(w:Float, h:Float, draggable:Bool, provider:IMapProvider)
	{
		doubleClickEnabled = true;
		
		//this.map = map;
		this.draggable = draggable;

		// don't call set map provider here, because it triggers a redraw and we're not ready for that
		//this.provider = provider;
		
		if (Std.is(provider, ITilePainterOverride)) {
			this.tilePainter = ITilePainterOverride(provider).getTilePainter();
		}
		else {
			this.tilePainter = new TilePainter(this, provider, maxParentLoad == 0 ? centerDistanceCompare : zoomThenCenterCompare);
		}
		tilePainter.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
		tilePainter.addEventListener(MapEvent.ALL_TILES_LOADED, onAllTilesLoaded, false, 0, true);
		tilePainter.addEventListener(MapEvent.BEGIN_TILE_LOADING, onBeginTileLoading, false, 0, true);
		
		this.limits = provider.outerLimits();
		
		// but do grab tile dimensions:
		_tileWidth = provider.tileWidth;
		_tileHeight = provider.tileHeight;

		// and calculate bounds from provider
		calculateBounds();
		
		this.mapWidth = w;
		this.mapHeight = h;
		scrollRect = new Rectangle(0, 0, mapWidth, mapHeight);

		debugField = new DebugField();
		debugField.x = mapWidth - debugField.width - 15; 
		debugField.y = mapHeight - debugField.height - 15;
		
		well = new Sprite();
		well.name = 'well';
		well.doubleClickEnabled = true;
		well.mouseEnabled = true;
		well.mouseChildren = false;
		addChild(well);

		worldMatrix = new Matrix();
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);		
	}

	/**
	 * Get the Tile instance that corresponds to a given coordinate.
	 */
	public function getCoordTile(coord:Coordinate):Tile
	{
		// these get floored when they're cast as ints in tileKey()
		var key:String = tileKey(coord.column, coord.row, coord.zoom);
		return cast(well.getChildByName(key), Tile);
	}

	private function onAddedToStage(event:Event):Void
	{
		if (draggable) {
			addEventListener(MouseEvent.MOUSE_DOWN, mousePressed, true);
		}
		addEventListener(Event.RENDER, onRender);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		dirty = true;
		// force an on-render in case we were added in a render handler
		onRender();
	}

	private function onRemovedFromStage(event:Event):Void
	{
		if (hasEventListener(MouseEvent.MOUSE_DOWN)) {
			removeEventListener(MouseEvent.MOUSE_DOWN, mousePressed, true);
		}
		removeEventListener(Event.RENDER, onRender);
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		// FIXME: should we still do this, in TilePainter?
		//queueTimer.stop();
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	/** The classes themselves serve as factories!
	 * 
	 * @param tileClass e.g. Tile, TweenTile, etc.
	 * 
	 * @see http://norvig.com/design-patterns/img013.gif  
	 */ 
	public function setTileClass(tileClass:Type):Void
	{
		// first get rid of everything, which passes tiles back to the pool
		clearEverything();
		// then assign the new class, which creates a new pool array
		tilePainter.setTileClass(tileClass);
	}

	/** processes the tileQueue and optionally outputs stats into debugField */
	private function onEnterFrame(event:Event=null):Void
	{
		if (debugField.parent) {
			debugField.update(this, blankCount, recentlySeen.length, tilePainter);
			debugField.x = mapWidth - debugField.width - 15; 
			debugField.y = mapHeight - debugField.height - 15;
		}
	}

	private function onRendered():Void
	{
		// listen out for this if you want to be sure map is in its final state before reprojecting markers etc.
		dispatchEvent(new MapEvent(MapEvent.RENDERED));
	}

	private function onPanned():Void
	{
		var pt:Point = coordinatePoint(startPan);
		dispatchEvent(new MapEvent(MapEvent.PANNED, pt.subtract(new Point(mapWidth/2, mapHeight/2))));		
	}

	private function onZoomed():Void
	{
		var zoomEvent:MapEvent = new MapEvent(MapEvent.ZOOMED_BY, zoomLevel-startZoom);
		// this might also be useful
		zoomEvent.zoomLevel = zoomLevel;
		dispatchEvent(zoomEvent);		
	}

	private function onChanged():Void
	{
		// doesn't bubble, unlike MapEvent
		// Map will pick this up and dispatch MapEvent.EXTENT_CHANGED for us
		dispatchEvent(new Event(Event.CHANGE, false, false));		
	}

	private function onBeginTileLoading(event:MapEvent):Void
	{
		dispatchEvent(event);		
	}

	private function onProgress(event:ProgressEvent):Void
	{
		// dispatch tile load progress
		dispatchEvent(event);		
	}

	private function onAllTilesLoaded(event:MapEvent):Void
	{
		dispatchEvent(event);
		// request redraw to take parent and child tiles off the stage if we haven't already
		dirty = true;		
	}

	/** 
	 * figures out from worldMatrix which tiles we should be showing, adds them to the stage, adds them to the tileQueue if needed, etc.
	 * 
	 * from my recent testing, TileGrid.onRender takes < 5ms most of the time, and rarely >10ms
	 * (Flash Player 9, Firefox, Macbook Pro)
	 *  
	 */
	private function onRender(event:Event=null):Void
	{
		var t:Float = getTimer();
		
		if (!dirty || !stage) {
			//trace(getTimer() - t, "ms in", provider);	
			onRendered();
			return;
		}

		var boundsEnforced:Bool = enforceBounds();
		
		if (zooming || panning) {
			if (panning) {
				onPanned();
			}	
			if (zooming) {
				onZoomed();
			}
		}
		else if (boundsEnforced) {
			onChanged();
		}
		else if (matrixChanged) {
			matrixChanged = false;
			onChanged();
		}
		
		// what zoom level of tiles should we be loading, taking into account min/max zoom?
		// (0 when scale == 1, 1 when scale == 2, 2 when scale == 4, etc.)
		var newZoom:Int = Math.min(maxZoom, Math.max(minZoom, Math.round(zoomLevel)));
		
		// see if the newZoom is different to currentZoom
		// so we know which way we're zooming, if any:
		if (currentTileZoom != newZoom) {
			previousTileZoom = currentTileZoom;
		}
		
		// this is the level of tiles we'll be loading:
		_currentTileZoom = newZoom;

		// find start and end columns for the visible tiles, at current tile zoom
		// we project all four corners to take account of potential rotation in worldMatrix
		var tlC:Coordinate = topLeftCoordinate.zoomTo(currentTileZoom);
		var brC:Coordinate = bottomRightCoordinate.zoomTo(currentTileZoom);
		var trC:Coordinate = topRightCoordinate.zoomTo(currentTileZoom);
		var blC:Coordinate = bottomLeftCoordinate.zoomTo(currentTileZoom);
		
		// optionally pad it out a little bit more with a tile buffer
		// TODO: investigate giving a directional bias to TILE_BUFFER when panning quickly
		// NB:- I'm pretty sure these calculations are accurate enough that using 
		//	  Math.ceil for the maxCols will load one column too many -- Tom
		var minCol:Int = Math.floor(Math.min(tlC.column,brC.column,trC.column,blC.column)) - tileBuffer;
		var maxCol:Int = Math.floor(Math.max(tlC.column,brC.column,trC.column,blC.column)) + tileBuffer;
		var minRow:Int = Math.floor(Math.min(tlC.row,brC.row,trC.row,blC.row)) - tileBuffer;
		var maxRow:Int = Math.floor(Math.max(tlC.row,brC.row,trC.row,blC.row)) + tileBuffer;

		// loop over all tiles and find parent or child tiles from cache to compensate for unloaded tiles:
		
		repopulateVisibleTiles(minCol, maxCol, minRow, maxRow);
		
		// move visible tiles to the end of recentlySeen if we're done loading them
		// the 'least recently seen' tiles will be removed from the tileCache below
		for (visibleTile in visibleTiles) {
			if (tilePainter.isPainted(visibleTile)) {
				var ri:Int = recentlySeen.indexOf(visibleTile.name); 
				if (ri >= 0) {
					recentlySeen.splice(ri, 1);
				}
				recentlySeen.push(visibleTile.name);
			}
		}

		// prune tiles from the well if they shouldn't be there (not currently in visibleTiles)
		// TODO: unless they're fading in or out?
		// (loop backwards so removal doesn't change i)
		//for (var i:Int = well.numChildren-1; i >= 0; i--) {
		for (i in well.numChildren-1...0) {
			var wellTile:Tile = cast(well.getChildAt(i), Tile);
			if (visibleTiles.indexOf(wellTile) < 0) {
				well.removeChild(wellTile);
				wellTile.hide();
				tilePainter.cancelPainting(wellTile);
			}
		}

		// position tiles such that currentZoom is approximately scale 1
		// and x and y make sense in pixels relative to tlC.column and tlC.row (topleft)
		positionTiles(tlC.column, tlC.row);

		// all the visible tiles will be at the end of recentlySeen
		// let's make sure we keep them around:
		var maxRecentlySeen:Int = Math.max(visibleTiles.length, maxTilesToKeep);
		
		// prune cache of already seen tiles if it's getting too big:
		if (recentlySeen.length > maxRecentlySeen) {
			// can we sort so that biggest zoom levels get removed first, without removing currently visible tiles?
			//var visibleKeys:Array = recentlySeen.slice(recentlySeen.length - visibleTiles.length, recentlySeen.length);

			// take a look at everything else
			recentlySeen = recentlySeen.slice(0, recentlySeen.length - visibleTiles.length);
			recentlySeen = recentlySeen.sort(Array.DESCENDING);
			recentlySeen = recentlySeen.concat(visibleKeys);
			
				// throw away keys at the beginning of recentlySeen
			recentlySeen = recentlySeen.slice(recentlySeen.length - maxRecentlySeen, recentlySeen.length);
			
			// loop over our internal tile cache 
			// and throw out tiles not in recentlySeen
			tilePainter.retainKeysInCache(recentlySeen);
		}
		
		// update centerRow and centerCol for sorting the tileQueue in processQueue()
		var center:Coordinate = centerCoordinate.zoomTo(currentTileZoom);
		centerRow = center.row;
		centerColumn = center.column;

		onRendered();

		dirty = false;
			
		//trace(getTimer() - t, "ms in", provider);		
	}
		
	/**
	 * loops over given cols and rows and adds tiles to visibleTiles array and the well
	 * using child or parent tiles to compensate for tiles not yet available in the tileCache
	 */
	private function repopulateVisibleTiles(minCol:Int, maxCol:Int, minRow:Int, maxRow:Int):Void
	{
		visibleTiles = []; 
		
		blankCount = 0; // keep count of how many tiles we missed?

		// for use in loops etc.
		var coord:Coordinate = new Coordinate(0,0,0);

		var searchedParentKeys:Object = {};

		// loop over currently visible tiles
		//for (var col:Int = minCol; col <= maxCol; col++)
		for (col in minCol...maxCol)
		{
			//for (var row:Int = minRow; row <= maxRow; row++)
			for (row in minRow...maxRow)
			{			
				// create a string key for this tile
				var key:String = tileKey(col, row, currentTileZoom);
				
				// see if we already have this tile
				var tile:Tile = cast(well.getChildByName(key), Tile);
						
				// create it if not, and add it to the load queue
				if (!tile) {
					tile = tilePainter.getTileFromCache(key);
					if (!tile) {
							coord.row = row;
						coord.column = col;
						coord.zoom = currentTileZoom;
						tile = tilePainter.createAndPopulateTile(coord, key); 
					}
					else {
						tile.show();
					}
						well.addChild(tile);
				}
				
				visibleTiles.push(tile);
				
				var tileReady:Bool = tile.isShowing() && !tilePainter.isPainting(tile);
				
				//
				// if the tile isn't ready yet, we're going to reuse a parent tile
				// if there isn't a parent tile, and we're zooming out, we'll reuse child tiles
				// if we don't get all 4 child tiles, we'll look at more parent levels
				//
				// yes, this is quite involved, but it should be fast enough because most of the loops
				// don't get hit most of the time
				//
				
				if (!tileReady) {
				
				var foundParent:Bool = false;
				var foundChildren:Int = 0;

				if (currentTileZoom > previousTileZoom) {
					
					// if it still doesn't have enough images yet, or it's fading in, try a double size parent instead
					if (maxParentSearch > 0 && currentTileZoom > minZoom) {
						var firstParentKey:String = parentKey(col, row, currentTileZoom, currentTileZoom-1);
						if (!searchedParentKeys[firstParentKey]) {
						searchedParentKeys[firstParentKey] = true;
						if (ensureVisible(firstParentKey)) {
						foundParent = true;
						}
						if (!foundParent && (currentTileZoom - 1 < maxParentLoad)) {
						//trace("requesting parent tile at zoom", pzoom);
						var firstParentCoord:Array = parentCoord(col, row, currentTileZoom, currentTileZoom-1);
						visibleTiles.push(requestLoad(firstParentCoord[0], firstParentCoord[1], currentTileZoom-1));
						}					
						}
					}
					
				}
				else {
					 
					// currentZoom <= previousZoom, so we're zooming out
					// and therefore we might want to reuse 'smaller' tiles
					
					// if it doesn't have an image yet, see if we can make it from smaller images
					if (!foundParent && maxChildSearch > 0 && currentTileZoom < maxZoom)
					{
						for (czoom in currentTileZoom + 1...Math.min(maxZoom, currentTileZoom + maxChildSearch))
						{
							var ckeys:Array = childKeys(col, row, currentTileZoom, czoom);
							for (ckey in ckeys)
							{
								if (ensureVisible(ckey))
								{
									foundChildren++;
								}
							} // ckeys
							if (foundChildren == ckeys.length)
							{
								break;
							} 
						} // czoom
					}
				}

				var stillNeedsAnImage:Bool = !foundParent && foundChildren < 4; 			

				// if it still doesn't have an image yet, try more parent zooms
					if (stillNeedsAnImage && maxParentSearch > 1 && currentTileZoom > minZoom) {

					var startZoomSearch:Int = currentTileZoom - 1;
					
					if (currentTileZoom > previousTileZoom) {
						// we already looked for parent level 1, and didn't find it, so:
						startZoomSearch -= 1;
					}
					
					var endZoomSearch:Int = Math.max(minZoom, currentTileZoom-maxParentSearch);
					
					//for (var pzoom:Int = startZoomSearch; pzoom >= endZoomSearch; pzoom--)
					for (pzoom in startZoomSearch...pzoom >= endZoomSearch)
					{
						var pkey:String = parentKey(col, row, currentTileZoom, pzoom);
						if (!searchedParentKeys[pkey]) {
							searchedParentKeys[pkey] = true;
							if (ensureVisible(pkey)) {				
								stillNeedsAnImage = false;
								break;
							}
							if (currentTileZoom - pzoom < maxParentLoad)
							{
								//trace("requesting parent tile at zoom", pzoom);
								var pcoord:Array = parentCoord(col, row, currentTileZoom, pzoom);
								visibleTiles.push(requestLoad(pcoord[0], pcoord[1], pzoom));
							}
						}
						else {
							break;
						}
					}
					
				}
							
				if (stillNeedsAnImage) {
					blankCount++;
				}

				} // if !tileReady
				
			} // for row
		} // for col
		
		// trace("zoomLevel", zoomLevel, "currentTileZoom", currentTileZoom, "blankCount", blankCount);
		
	} // repopulateVisibleTiles

	// TODO: do this with events instead?
	public function tilePainted(tile:Tile):Void
	{		
		if (currentTileZoom-tile.zoom <= maxParentLoad) {
		tile.show();
		}
		else {
		tile.showNow();
		}
	}

	/** 
	 * returns an array of all the tiles that are on the screen
	 * (including parent and child tiles currently visible until
	 * the current zoom level finishes loading)
	 * */
	public function getVisibleTiles():Array<Dynamic>
	{
		return visibleTiles;
	}

	private function positionTiles(realMinCol:Float, realMinRow:Float):Void
	{
		// sort children by difference from current zoom level
		// this means current is on top, +1 and -1 are next, then +2 and -2, etc.
		visibleTiles.sort(distanceFromCurrentZoomCompare, Array.DESCENDING);
		
		// for positioning tile according to current transform, based on current tile zoom
		var scaleFactors:Array = new Array(maxZoom+1);
		// scales to compensate for zoom differences between current grid zoom level		
		var tileScales:Array = new Array(maxZoom+1);
		
		//for (var z:Int = 0; z <= maxZoom; z++)
		for (z in 0...z <= maxZoom)
		{
			scaleFactors[z] = Math.pow(2.0, currentTileZoom - z);
			// round up to the nearest pixel to avoid seams between zoom levels
			if (roundScalesEnabled) {
				tileScales[z] = Math.ceil(Math.pow(2, zoomLevel-z) * tileWidth) / tileWidth; 
			}
			else {
				tileScales[z] = Math.pow(2, zoomLevel-z);
			}
		}
		
		// hugs http://www.senocular.com/flash/tutorials/transformmatrix/
		var px:Point = worldMatrix.deltaTransformPoint(new Point(0, 1));
		var tileAngleDegrees:Float = ((180/Math.PI) * Math.atan2(px.y, px.x) - 90);
		
		// apply the sorted depths, position all the tiles and also keep recentlySeen updated:
		for (tile in visibleTiles) 
		{	
			// if we set them all to numChildren-1, descending, they should end up correctly sorted
			well.setChildIndex(tile, well.numChildren-1);

			tile.scaleX = tile.scaleY = tileScales[tile.zoom];

			var pt:Point = coordinatePoint(new Coordinate(tile.row, tile.column, tile.zoom));
			tile.x = pt.x;
			tile.y = pt.y;
			
			tile.rotation = tileAngleDegrees;		
		}
	}

	private function zoomThenCenterCompare(t1:Tile, t2:Tile):Int
	{
		if (t1.zoom == t2.zoom) {
		return centerDistanceCompare(t1, t2);
		}
		return t1.zoom < t2.zoom ? -1 : t1.zoom > t2.zoom ? 1 : 0; 
	}

	// for sorting arrays of tiles by distance from center Coordinate	
	private function centerDistanceCompare(t1:Tile, t2:Tile):Int
	{
		if (t1.zoom == t2.zoom && t1.zoom == currentTileZoom && t2.zoom == currentTileZoom) {
		var d1:Int = Math.pow(t1.row+0.5-centerRow,2) + Math.pow(t1.column+0.5-centerColumn,2); 
		var d2:Int = Math.pow(t2.row+0.5-centerRow,2) + Math.pow(t2.column+0.5-centerColumn,2); 
		return d1 < d2 ? -1 : d1 > d2 ? 1 : 0; 
		}
		return Math.abs(t1.zoom-currentTileZoom) < Math.abs(t2.zoom-currentTileZoom) ? -1 : 1;
	}

	// for sorting arrays of tiles by distance from currentZoom	
	private function distanceFromCurrentZoomCompare(t1:Tile, t2:Tile):Int
	{
		var d1:Int = Math.abs(t1.zoom-currentTileZoom);
		var d2:Int = Math.abs(t2.zoom-currentTileZoom);
		return d1 < d2 ? -1 : d1 > d2 ? 1 : zoomCompare(t2, t1); // t2, t1 so that big tiles are on top of small 
	}

	// for when tiles have same difference in zoom in distanceFromCurrentZoomCompare	
	private static function zoomCompare(t1:Tile, t2:Tile):Int
	{
		return t1.zoom == t2.zoom ? 0 : t1.zoom > t2.zoom ? 1 : -1; 
	}

	// makes sure that if a tile with the given key exists in the cache
	// that it is added to the well and added to visibleTiles
	// returns null if tile does not exist in cache
	private function ensureVisible(key:String):Tile
	{
		var tile:Tile = tilePainter.getTileFromCache(key);
		if (tile) {
			if (!well.contains(tile)) {
				well.addChildAt(tile,0);
				tilePainted(tile);
			}
			if (visibleTiles.indexOf(tile) < 0) {
				visibleTiles.push(tile); // don't get rid of it yet!
			}
				return tile;
		}
		return null;
	}

	// for use in requestLoad
	private var tempCoord:Coordinate = new Coordinate(0,0,0);

	/** create a tile and add it to the queue - WARNING: this is buggy for the current zoom level, it's only used for parent zooms when maxParentLoad is > 0 */ 
	private function requestLoad(col:Int, row:Int, zoom:Int):Tile
	{
		var key:String = tileKey(col, row, zoom);		
		var tile:Tile = cast(well.getChildByName(key), Tile); 
		if (!tile) {
			tempCoord.row = row;
			tempCoord.column = col;
			tempCoord.zoom = zoom;
			tile = tilePainter.createAndPopulateTile(tempCoord, key);
			well.addChild(tile);
		}
		return tile;
	}

	private static inline var zoomLetter:Array<Dynamic> = "abcdefghijklmnopqrstuvwxyz".split('');
			
	/** zoom is translated into a letter so that keys can easily be sorted (alphanumerically) by zoom level */
	private function tileKey(col:Int, row:Int, zoom:Int):String
	{
		return zoomLetter[zoom]+":"+col+":"+row;
	}

	// TODO: check that this does the right thing with negative row/col?
	private function parentKey(col:Int, row:Int, zoom:Int, parentZoom:Int):String
	{
		var scaleFactor:Float = Math.pow(2.0, zoom-parentZoom);
		var pcol:Int = Math.floor(Float(col) / scaleFactor); 
		var prow:Int = Math.floor(Float(row) / scaleFactor);
		return tileKey(pcol,prow,parentZoom);		
	}

	// used when maxParentLoad is > 0
	// TODO: check that this does the right thing with negative row/col?
	private function parentCoord(col:Int, row:Int, zoom:Int, parentZoom:Int):Array<Dynamic>
	{
		var scaleFactor:Float = Math.pow(2.0, zoom-parentZoom);
		var pcol:Int = Math.floor(Float(col) / scaleFactor); 
		var prow:Int = Math.floor(Float(row) / scaleFactor);
		return [ pcol, prow ];		
	}	

	// TODO: check that this does the right thing with negative row/col?
	private function childKeys(col:Int, row:Int, zoom:Int, childZoom:Int):Array<Dynamic>
	{
			var scaleFactor:Float = Math.pow(2, zoom-childZoom); // one zoom in = 0.5
			var rowColSpan:Int = Math.pow(2, childZoom-zoom); // one zoom in = 2, two = 4
			var keys:Array<Dynamic>;
			//for (var ccol:Int = col/scaleFactor; ccol < (col/scaleFactor)+rowColSpan; ccol++) {
			for (ccol in col / scaleFactor...ccol < (col / scaleFactor) + rowColSpan)
			{
				//for (var crow:Int = row / scaleFactor; crow < (row / scaleFactor) + rowColSpan; crow++)
				for (crow in row / scaleFactor...crow < (row / scaleFactor) + rowColSpan)
				{
					keys.push(tileKey(ccol, crow, childZoom));
				}
			}
			return keys;
	}
			
	public function mousePressed(event:MouseEvent):Void
	{
		prepareForPanning(true);
		pmouse = new Point(event.stageX, event.stageY);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseDragged);
		stage.addEventListener(MouseEvent.MOUSE_UP, mouseReleased);
		stage.addEventListener(Event.MOUSE_LEAVE, mouseReleased);
	}

	public function mouseReleased(event:Event):Void
	{
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseDragged);
		stage.removeEventListener(MouseEvent.MOUSE_UP, mouseReleased);
		stage.removeEventListener(Event.MOUSE_LEAVE, mouseReleased);
		donePanning();
		dirty = true;
		if (Std.is(event, MouseEvent)) {
			MouseEvent(event).updateAfterEvent();
		}
		else if (event.type == Event.MOUSE_LEAVE) {
			onRender();
		}
	}

	public function mouseDragged(event:MouseEvent):Void
	{
		var mousePoint:Point = new Point(event.stageX, event.stageY);
		tx += mousePoint.x - pmouse.x;
		ty += mousePoint.y - pmouse.y;
		pmouse = mousePoint;
		dirty = true;
		event.updateAfterEvent();
	}	

	// today is all about lazy evaluation
	// this gets set to null by 'dirty = true'
	// and only calculated again if you need it
	private var invertedMatrix(getInvertedMatrix, setInvertedMatrix):Matrix;
	
	private function getInvertedMatrix():Matrix
	{
		if (!_invertedMatrix) {
		_invertedMatrix = worldMatrix.clone();
		_invertedMatrix.invert();
		_invertedMatrix.scale(scale/tileWidth, scale/tileHeight);
		}
		return _invertedMatrix;
	}

	/** derived from map provider by calculateBounds(), read-only here for convenience */
	public var minZoom(getMinZoom, setMinZoom):Float;
	
	private function getMinZoom():Float
	{
		return _minZoom;
	}
	/** derived from map provider by calculateBounds(), read-only here for convenience */
	public var maxZoom(getMaxZoom, setMaxZoom):Float;
	
	private function getMaxZoom():Float
	{
		return _maxZoom;
	}

	/** convenience method for tileWidth */
	public var tileWidth(getTileWidth, setTileWidth):Float;
	
	private function getTileWidth():Float
	{
		return _tileWidth;
	}
	/** convenience method for tileHeight */
	public var tileHeight(getTileHeight, setTileHeight):Float;
	
	private function getTileHeight():Float
	{
		return _tileHeight;
	}

	/** read-only, this is the level of tiles we'll be loading first */
	public var currentTileZoom(getCurrentTileZoom, setCurrentTileZoom):Float;
	
	private function getCurrentTileZoom():Float
	{
		return _currentTileZoom;
	}

	public var topLeftCoordinate(getTopLeftCoordinate, setTopLeftCoordinate):Coordinate;
	
	private function getTopLeftCoordinate():Coordinate
	{
		if (!_topLeftCoordinate) {
			var tl:Point = invertedMatrix.transformPoint(new Point());
			_topLeftCoordinate = new Coordinate(tl.y, tl.x, zoomLevel);		
		}
		return _topLeftCoordinate;
	}

	public var bottomRightCoordinate(getBottomRightCoordinate, setBottomRightCoordinate):Coordinate;
	
	private function getBottomRightCoordinate():Coordinate
	{
		if (!_bottomRightCoordinate) {
			var br:Point = invertedMatrix.transformPoint(new Point(mapWidth, mapHeight));
			_bottomRightCoordinate = new Coordinate(br.y, br.x, zoomLevel);		
		}
		return _bottomRightCoordinate;
	}

	public var topRightCoordinate(getTopRightCoordinate, setTopRightCoordinate):Coordinate;
	
	private function getTopRightCoordinate():Coordinate
	{
		if (!_topRightCoordinate) {
			var tr:Point = invertedMatrix.transformPoint(new Point(mapWidth,0));
			_topRightCoordinate = new Coordinate(tr.y, tr.x, zoomLevel);		
		}
		return _topRightCoordinate;
	}

	public var bottomLeftCoordinate(getBottomLeftCoordinate, setBottomLeftCoordinate):Coordinate;
	
	private function getBottomLeftCoordinate():Coordinate
	{
		if (!_bottomLeftCoordinate) {
			var bl:Point = invertedMatrix.transformPoint(new Point(0, mapHeight));
			_bottomLeftCoordinate = new Coordinate(bl.y, bl.x, zoomLevel);		
		}
		return _bottomLeftCoordinate;
	}
			
	public var centerCoordinate(getCenterCoordinate, setCenterCoordinate):Coordinate;
	
	private function getCenterCoordinate():Coordinate
	{
		if (!_centerCoordinate) {
			var c:Point = invertedMatrix.transformPoint(new Point(mapWidth/2, mapHeight/2));
			_centerCoordinate = new Coordinate(c.y, c.x, zoomLevel);
		} 
		return _centerCoordinate; 		
	}

	public function coordinatePoint(coord:Coordinate, context:DisplayObject=null):Point
	{
		// this is basically the same as coord.zoomTo, but doesn't make a new Coordinate:
		var zoomFactor:Float = Math.pow(2, zoomLevel - coord.zoom) * tileWidth/scale;
		var zoomedColumn:Float = coord.column * zoomFactor;
		var zoomedRow:Float = coord.row * zoomFactor;
			
		var screenPoint:Point = worldMatrix.transformPoint(new Point(zoomedColumn, zoomedRow));

		if (context!=null && context != this)
		{
			screenPoint = this.parent.localToGlobal(screenPoint);
			screenPoint = context.globalToLocal(screenPoint);
		}

		return screenPoint; 
	}

	public function pointCoordinate(point:Point, context:DisplayObject=null):Coordinate
	{		
		if (context!=null && context != this)
		{
			point = context.localToGlobal(point);
			point = this.globalToLocal(point);
		}
		
		var p:Point = invertedMatrix.transformPoint(point);
		return new Coordinate(p.y, p.x, zoomLevel);
	}

	public function prepareForPanning(dragging:Bool=false):Void
	{
		if (panning) {
			donePanning();
		}
		if (!dragging && draggable) {
			if (hasEventListener(MouseEvent.MOUSE_DOWN)) {
				removeEventListener(MouseEvent.MOUSE_DOWN, mousePressed, true);
			}
		}
		startPan = centerCoordinate.copy();
		panning = true;
		onStartPanning();
	}

	private function onStartPanning():Void
	{
		dispatchEvent(new MapEvent(MapEvent.START_PANNING));
	}

	public function donePanning():Void
	{
		if (draggable) {
			if (!hasEventListener(MouseEvent.MOUSE_DOWN)) {
				addEventListener(MouseEvent.MOUSE_DOWN, mousePressed, true);
			}
		}
		startPan = null;
		panning = false;
		onStopPanning();
	}

	private function onStopPanning():Void
	{
		dispatchEvent(new MapEvent(MapEvent.STOP_PANNING));
	}

	public function prepareForZooming():Void
	{
		if (startZoom >= 0) {
			doneZooming();
		}

		startZoom = zoomLevel;
		zooming = true;
		onStartZooming();
	}

	private function onStartZooming():Void
	{
		dispatchEvent(new MapEvent(MapEvent.START_ZOOMING, startZoom));
	}
			
	public function doneZooming():Void
	{
		onStopZooming();
		startZoom = -1;
		zooming = false;
	}

	private function onStopZooming():Void
	{
		var event:MapEvent = new MapEvent(MapEvent.STOP_ZOOMING, zoomLevel);
		event.zoomDelta = zoomLevel - startZoom;
		dispatchEvent(event);
	}

	public function resetTiles(coord:Coordinate):Void
	{
		var sc:Float = Math.pow(2, coord.zoom);

		worldMatrix.identity();
		worldMatrix.scale(sc, sc);
		worldMatrix.translate(mapWidth/2, mapHeight/2 );
		worldMatrix.translate(-tileWidth*coord.column, -tileHeight*coord.row);

		// reset the inverted matrix, request a redraw, etc.
		dirty = true;
	}

	public var zoomLevel(getZoomLevel, setZoomLevel):Float;
	
	private function getZoomLevel():Float
	{
		return Math.log(scale) / Math.LN2;
	}

	private function setZoomLevel(n:Float):Void
	{
		if (zoomLevel != n)
		{
			scale = Math.pow(2, n);			
		}
	}

	public var scale(getScale, setScale):Float;
	
	private function getScale():Float
	{
		return Math.sqrt(worldMatrix.a * worldMatrix.a + worldMatrix.b * worldMatrix.b);
	}

	private function setScale(n:Float):Void
	{
		if (scale != n) {
			
			var needsStop:Bool = false;
			if (!zooming) {
				prepareForZooming();
				needsStop = true;
			}
		
			var sc:Float = n / scale;
			worldMatrix.translate(-mapWidth/2, -mapHeight/2);
			worldMatrix.scale(sc, sc);
			worldMatrix.translate(mapWidth/2, mapHeight/2);
			
			dirty = true;	
			
			if (needsStop) {
				doneZooming();
			}
		}
	}
		
	public function resizeTo(p:Point):Void
	{
		if (mapWidth != p.x || mapHeight != p.y)
		{
		var dx:Float = p.x - mapWidth;
		var dy:Float = p.y - mapHeight;
		
		// maintain the center point:
		tx += dx/2;
		ty += dy/2;
		
		mapWidth = p.x;
		mapHeight = p.y;
		scrollRect = new Rectangle(0, 0, mapWidth, mapHeight);

		debugField.x = mapWidth - debugField.width - 15; 
		debugField.y = mapHeight - debugField.height - 15;
		
		dirty = true;

		// force this but only for onResize
		onRender();
		}

		// this makes sure the well is clickable even without tiles
		well.graphics.clear();
		well.graphics.beginFill(0x000000, 0);
		well.graphics.drawRect(0, 0, mapWidth, mapHeight);
		well.graphics.endFill();
	}

	public function setMapProvider(provider:IMapProvider):Void
	{
		if (Std.is(provider, ITilePainterOverride)) {
			this.tilePainter = ITilePainterOverride(provider).getTilePainter();
		}
		else {
			this.tilePainter = new TilePainter(this, provider, maxParentLoad == 0 ? centerDistanceCompare : zoomThenCenterCompare);
		}
		
		tilePainter.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
		tilePainter.addEventListener(MapEvent.ALL_TILES_LOADED, onAllTilesLoaded, false, 0, true);
		tilePainter.addEventListener(MapEvent.BEGIN_TILE_LOADING, onBeginTileLoading, false, 0, true);

		// TODO: set limits independently of provider
		this.limits = provider.outerLimits();

		_tileWidth = provider.tileWidth;
		_tileHeight = provider.tileHeight;
		
		calculateBounds();
		
		clearEverything();
	}

	private function clearEverything(event:Event=null):Void
	{
		while (well.numChildren > 0) {		
		well.removeChildAt(0);
		}

		tilePainter.reset();
			
		recentlySeen = [];
			
		dirty = true;
	}

	private function calculateBounds():Void
	{
		var tl:Coordinate = cast(limits[0], Coordinate);
		var br:Coordinate = cast(limits[1], Coordinate);

		_maxZoom = Math.max(tl.zoom, br.zoom);  
		_minZoom = Math.min(tl.zoom, br.zoom);
		
		tl = tl.zoomTo(0);
		br = br.zoomTo(0);

		minTx = tl.column * tileWidth;
		maxTx = br.column * tileWidth;
		minTy = tl.row * tileHeight;
		maxTy = br.row * tileHeight;
	}

	/** this may seem like a heavy function, but it only gets called once per render 
	 *  and it doesn't have any loops, so it flies by, really */
	public function enforceBoundsOnMatrix(matrix:Matrix):Bool
	{
		var touched:Bool = false;

		// first check that we're not zoomed in too close...
		
		var matrixScale:Float = Math.sqrt(matrix.a * matrix.a + matrix.b * matrix.b);
		var matrixZoomLevel:Float = Math.log(matrixScale) / Math.LN2;		

		if (matrixZoomLevel < minZoom || matrixZoomLevel > maxZoom) {
			var oldScale:Float = matrixScale; 
			matrixZoomLevel = Math.max(minZoom, Math.min(matrixZoomLevel, maxZoom));
			matrixScale = Math.pow(2, matrixZoomLevel);
			var scaleFactor:Float = matrixScale / oldScale;
			matrix.scale(scaleFactor, scaleFactor);
			touched = true;
		}

		// then make sure we haven't gone too far...
		
		var inverse:Matrix = matrix.clone();
		inverse.invert();
		inverse.scale(matrixScale/tileWidth, matrixScale/tileHeight);
		
		// zoom topLeft and bottomRight coords to 0
		// so that they can be compared against minTx etc.
		
		var topLeftPoint:Point = inverse.transformPoint(new Point());
		var topLeft:Coordinate = new Coordinate(topLeftPoint.y, topLeftPoint.x, matrixZoomLevel).zoomTo(0);

		var bottomRightPoint:Point = inverse.transformPoint(new Point(mapWidth, mapHeight));
		var bottomRight:Coordinate = new Coordinate(bottomRightPoint.y, bottomRightPoint.x, matrixZoomLevel).zoomTo(0);
		
		// apply horizontal constraints
		
		var leftX:Float = topLeft.column * tileWidth;
		var rightX:Float = bottomRight.column * tileWidth;
		
		if (rightX-leftX > maxTx-minTx) {
			// if we're wider than the map, center align 
			matrix.tx = (mapWidth-(minTx+maxTx)*matrixScale)/2;
			touched = true;
		}
		else if (leftX < minTx) {
			matrix.tx += (leftX-minTx)*matrixScale;
			touched = true;
		}
		else if (rightX > maxTx) {
			matrix.tx += (rightX-maxTx)*matrixScale;
			touched = true;
		}

		// apply vertical constraints

		var upY:Float = topLeft.row * tileHeight;
		var downY:Float = bottomRight.row * tileHeight;

		if (downY-upY > maxTy-minTy) {
			// if we're taller than the map, center align			
			matrix.ty = (mapHeight-(minTy+maxTy)*matrixScale)/2;
			touched = true;
		}
		else if (upY < minTy) {
			matrix.ty += (upY-minTy)*matrixScale;
			touched = true;
		}
		else if (downY > maxTy) {
			matrix.ty += (downY-maxTy)*matrixScale;
			touched = true;
		}

		return touched;		
	}

	/** called inside of onRender before events are fired
	 *  enforceBoundsOnMatrix modifies worldMatrix directly
	 *  doesn't use scale/zoomLevel setters to correct values otherwise we'd get stuck in a loop!
	 */
	private function enforceBounds():Bool
	{
		if (!enforceBoundsEnabled) {
			return false;
		}
		
		var touched:Bool = enforceBoundsOnMatrix(worldMatrix);

	    /* this is potentially the way to wrap the x position
		but all the tiles flash and the values aren't quite right
		so wrapping the matrix needs more work :(
		
		var wrapTx:Float = 256 * scale;
		
		if (worldMatrix.tx > 0) {
		worldMatrix.tx = worldMatrix.tx - wrapTx; 
		}
		else if (worldMatrix.tx < -wrapTx) {
		worldMatrix.tx += wrapTx; 
		} */

		// to make sure we haven't gone too far
		// zoom topLeft and bottomRight coords to 0
		// so that they can be compared against minTx etc.
		
		if (touched) {
			_invertedMatrix = null;
			_topLeftCoordinate = null;
			_bottomRightCoordinate = null;
			_topRightCoordinate = null;
			_bottomLeftCoordinate = null;
			_centerCoordinate = null;		
		}

		return touched;		
	}

	public var d(null, setD):Float;
	
	private function setDirty(d:Bool):Void
	{
		_dirty = d;
		if (d) {
			if (stage) stage.invalidate();
			
			_invertedMatrix = null;
			_topLeftCoordinate = null;
			_bottomRightCoordinate = null;
			_topRightCoordinate = null;
			_bottomLeftCoordinate = null;
			_centerCoordinate = null;			
		}
	}

	private var dirty(getDirty, setDirty):Bool;
	
	private function getDirty():Bool
	{
		return _dirty;
	}

	public function getMatrix():Matrix
	{
		return worldMatrix.clone();
	}

	public function setMatrix(m:Matrix):Void
	{
		worldMatrix = m;
		matrixChanged = true;
		dirty = true;
	}

	public function get_a():Float
	{
		return worldMatrix.a;
	}
	
	public function get_b():Float
	{
		return worldMatrix.b;
	}
	
	public function get_c():Float
	{
		return worldMatrix.c;
	}
	
	public function get_d():Float
	{
		return worldMatrix.d;
	}
	
	public var tx(getTx, setTx):Float;
	
	private function getTx():Float
	{
		return worldMatrix.tx;
	}
	
	public var ty(getTy, setTy):Float;
	
	private function getTy():Float
	{
		return worldMatrix.ty;
	}

	public var a(null, setA):Float;
	
	private function setA(n:Float):Void
	{
		worldMatrix.a = n;
		dirty = true;
	}
	public var b(null, setB):Float;
		private function setB(n:Float):Void
	{
		worldMatrix.b = n;
		dirty = true;
	}
	public var c(null, setC):Float;
	
	private function setC(n:Float):Void
	{
		worldMatrix.c = n;
		dirty = true;
	}
	
	//public var d(null, setD):Float;
	
	private function setD(n:Float):Void
	{
		worldMatrix.d = n;
		dirty = true;
	}
	private function setTx(n:Float):Void
	{
		worldMatrix.tx = n;
		dirty = true;
	}
	private function setTy(n:Float):Void
	{
		worldMatrix.ty = n;
		dirty = true;
	}				
}