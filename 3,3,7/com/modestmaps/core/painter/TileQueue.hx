package com.modestmaps.core.painter;

import com.modestmaps.core.Tile;
import openfl.utils.Object;

class TileQueue
{
	// Tiles we want to load:
	private var queue:Array<Tile>;

	public function new()
	{
		queue = [];
	}

	public var length(get, null):Int;

	private function get_length():Int 
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
		return queue.shift();
	}

	public function sortTiles(callback:Dynamic):Void
	{
		queue.sort(callback);
	}

	public function retainAll(tiles:Array<Tile>):Array<Tile>
	{
		var removed:Array<Tile> = [];
		for (i in queue.length - 1...0)
		{
			var tile:Tile = queue[i];
			if (tiles.indexOf(tile) < 0)
			{
				removed.push(tile);
				queue.splice(i, 1);
			} 
		}
		return removed;
	}

	public function clear():Void
	{
		queue = [];
	}
}