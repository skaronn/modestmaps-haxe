package com.modestmaps.extras.ui;

import openfl.display.Sprite;
import openfl.system.System;
import openfl.utils.Object;
import openfl.utils.Timer;
import openfl.text.TextField;
import openfl.text.TextFormat;

import hxculture.FormatNumber;
import hxculture.cultures.FrFR;

import com.modestmaps.core.TileGrid;
import com.modestmaps.core.Tile;
import com.modestmaps.core.painter.TilePainter;
import com.modestmaps.core.painter.ITilePainter;	

class DebugField extends TextField
{
	// for stats:
	private var lastFrameTime:Int;
	private var fps:Int = 30;	

	public function new():Void
	{
		super();
		defaultTextFormat = new TextFormat(null, 12, 0x000000, false);
		backgroundColor = 0xFFFFFF;
		background = true;
		text = "messages";
		name = 'debugField';
		mouseEnabled = false;
		selectable = false;
		multiline = true;
		wordWrap = false;
		lastFrameTime = Std.int(Date.now().getTime());
		#if !debug
		visible = false;
		#end
	}

	public function update(grid:TileGrid, blankCount:Int, recentCount:Int, tilePainter:ITilePainter):Void
	{
		// for stats...
		var frameDuration:Float = Std.int(Date.now().getTime()) - lastFrameTime;

		lastFrameTime = Std.int(Date.now().getTime());

		fps = Std.int((0.9 * fps) + (0.1 * (1000.0 / frameDuration)));

		var well:Sprite = cast(grid.getChildByName('well'), Sprite);
		//trace("well.numChildren : "+well.numChildren);
		
		// report stats:
		var tileChildren:Int = 0;
		
		for (i in 0...well.numChildren) {
			tileChildren += cast(well.getChildAt(i), Tile).numChildren;
		}
	  
		this.text = "tx: " + FormatNumber.decimal(grid.tx, FrFR.culture, 3)
			+ "\nty: " + FormatNumber.decimal(grid.ty, FrFR.culture, 3)
			+ "\nsc: " + FormatNumber.decimal(grid.scale, FrFR.culture, 4)
			+ "\nfps: " + FormatNumber.decimal(fps, FrFR.culture, 0)
			+ "\ncurrent child count: " + well.numChildren
			+ "\ncurrent child of tile count: " + tileChildren
			+ "\nvisible tile count: " + grid.getVisibleTiles().length
			+ "\nblank count: " + blankCount
			+ "\nrecently used tiles: " + recentCount
			+ "\ntiles created: " + Tile.count
			+ "\nqueue length: " + tilePainter.getQueueCount()
			+ "\nrequests: " + tilePainter.getRequestCount()
			+ "\nfinished (cached) tiles: " + tilePainter.getCacheSize()
			+ "\ncachedLoaders: " + tilePainter.getLoaderCacheCount()
			+ "\nmemory: " + FormatNumber.decimal((System.totalMemory / 1048576), FrFR.culture, 1) + " MB"; 
		width = textWidth + 8;
		height = textHeight + 4;
	}
	
}