package com.modestmaps.core.painter;

import com.modestmaps.core.Tile;

import flash.utils.Dictionary;

/** the alreadySeen Dictionary here will contain up to grid.maxTilesToKeep Tiles */
class TileCache
{
// Tiles we've already seen and fully loaded, by key (.name)
private var alreadySeen:Dictionary;
private var tilePool:TilePool; // for handing tiles back!

public function new(tilePool:TilePool)
{
	this.tilePool = tilePool;
	alreadySeen = new Dictionary();
}

public var size(getSize, null):Int;
 	private function getSize():Int
{
	var alreadySeenCount:Int = 0;
	for (var key:Dynamic in alreadySeen) {
	alreadySeenCount++;
	}
	return alreadySeenCount;	
}

public function putTile(tile:Tile):Void
{
	alreadySeen[tile.name] = tile;
}

public function getTile(key:String):Tile
{
	return alreadySeen[key] as Tile;
}

public function containsKey(key:String):Bool
{
	return alreadySeen[key] is Tile;
}

public function retainKeys(keys:Array):Void
{
	for (var key:String in alreadySeen) {
	if (keys.indexOf(key) < 0) {
		tilePool.returnTile(alreadySeen[key] as Tile);
		delete alreadySeen[key];
	}
	}	
}

public function clear():Void
{
	for (var key:String in alreadySeen) {
	tilePool.returnTile(alreadySeen[key] as Tile);
	delete alreadySeen[key];
	}
	alreadySeen = new Dictionary();	
}
}