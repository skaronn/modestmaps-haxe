package com.modestmaps.core.painter;

import com.modestmaps.core.Coordinate;
import com.modestmaps.core.Tile;
import com.modestmaps.mapproviders.IMapProvider;

import openfl.events.IEventDispatcher;
import openfl.utils.Object;

interface ITilePainter extends IEventDispatcher
{
	function setTileClass(tileClass:Class<Object>):Void;
	function setMapProvider(provider:IMapProvider):Void;
	function getTileFromCache(key:String):Tile;
	function retainKeysInCache(recentlySeen:Array<Object>):Void;
	function createAndPopulateTile(coord:Coordinate, key:String):Tile;
	function isPainted(tile:Tile):Bool;
	function cancelPainting(tile:Tile):Void;
	function isPainting(tile:Tile):Bool;
	function reset():Void;
	function getLoaderCacheCount():Int;
	function getQueueCount():Int;
	function getRequestCount():Int;
	function getCacheSize():Int;
}