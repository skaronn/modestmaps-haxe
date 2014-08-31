package com.modestmaps.core.painter;

import com.modestmaps.core.Tile;

class TileQueue
{
// Tiles we want to load:
private var queue:Array;

public function new()
{
	queue = [];
}

public var length(getLength, null):Float;
 	private function getLength():Float 
{
	return queue.length;
}

public function contains(tile:Tile):Bool
{
	return queue.indexOf(tile) >= 0;
}

public function remove(tile:Tile):Void
{
	var index:Int = queue.indexOf(tile); 
	if (index >= 0) { 
	queue.splice(index, 1);
	}
}

public function push(tile:Tile):Void
{
	queue.push(tile);
}

public function shift():Tile
{
	return queue.shift() as Tile;
}

public function sortTiles(callback:Function):Void
{
	queue = queue.sort(callback);
}

public function retainAll(tiles:Array):Array
{
	var removed:Array = [];
	for (var i:Int = queue.length-1; i >= 0; i--) {
	var tile:Tile = queue[i] as Tile;
	if (tiles.indexOf(tile) < 0) {
		removed.push(tile);
		queue.splice(i,1);
	} 
	}
	return removed;
}

public function clear():Void
{
	queue = [];
}
}