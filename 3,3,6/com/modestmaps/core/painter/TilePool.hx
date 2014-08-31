package com.modestmaps.core.painter;

import com.modestmaps.core.Tile;

/** 
 *  This post http://lab.polygonal.de/2008/06/18/using-object-pools/
 *  suggests that using Object pools, especially for complex classes like Sprite
 *  is a lot faster than calling new Object().  The suggested implementation
 *  uses a linked list, but to get started with it here I'm using an Array.  
 *  
 *  If anyone wants to try it with a linked list and compare the times,
 *  it seems like it could be worth it :)
 */ 
class TilePool 
{
private static inline MIN_POOL_SIZE:Int = 256;
private static inline MAX_NEW_TILES:Int = 256;

private var pool:Array = [];
private var tileClass:Class;

public function new(tileClass:Class)
{
	this.tileClass = tileClass;
}

public function setTileClass(tileClass:Class):Void
{
	this.tileClass = tileClass;
	pool = [];
}

public function getTile(column:Int, row:Int, zoom:Int):Tile
{
	if (pool.length < MIN_POOL_SIZE) {
	while (pool.length < MAX_NEW_TILES) {
		pool.push(new tileClass(0,0,0));
	}
	}			
	var tile:Tile = pool.pop() as Tile;
	tile.init(column, row, zoom);
	return tile;
}

public function returnTile(tile:Tile):Void
{
	tile.destroy();
	pool.push(tile);
}

}