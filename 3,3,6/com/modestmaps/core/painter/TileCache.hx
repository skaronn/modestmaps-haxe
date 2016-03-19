package com.modestmaps.core.painter;

import com.modestmaps.core.Tile;
import haxe.ds.StringMap;

import flash.utils.Object;

/**
 * The alreadySeen Dictionary here will contain up to grid.maxTilesToKeep Tiles
 */
class TileCache
{
	// Tiles we've already seen and fully loaded, by key (.name)
	private var alreadySeen:StringMap<Tile>;
	//private var alreadySeen:Dictionary;
	private var tilePool:TilePool; // for handing tiles back!

	public function new(tilePool:TilePool)
	{
		this.tilePool = tilePool;
		//alreadySeen = new Dictionary();
		alreadySeen = new StringMap<Tile>();
	}

	public var size(get, null):Int;
	
	private function get_size():Int
	{
		var alreadySeenCount:Int = 0;
		for (key in alreadySeen)
		{
			alreadySeenCount++;
		}
		return alreadySeenCount;	
	}

	public function putTile(tile:Tile):Void
	{
		alreadySeen.set(tile.name, tile);
	}

	public function getTile(key:String):Tile
	{
		return alreadySeen.get(key);
	}

	public function containsKey(key:String):Bool
	{
		return Std.is(alreadySeen.get(key), Tile);
	}

	public function retainKeys(keys:Array<String>):Void
	{
		//TODO està fent el contrari?? esta eliminant les keys, en comptes de les que no siguin les keys
		
		for (key in alreadySeen.keys())
		{
			if (keys.indexOf(key) < 0) 
			{
				tilePool.returnTile(alreadySeen.get(key));
				//untyped __delete__(alreadySeen, key);
				alreadySeen.remove(key);
			}
		}	
	}

	public function clear():Void
	{
		for (key in alreadySeen.keys())
		{
			tilePool.returnTile(alreadySeen.get(key));
			//untyped __delete__(alreadySeen, key);
		}
		//alreadySeen = new Dictionary();	
		alreadySeen = new StringMap<Tile>();
	}
}