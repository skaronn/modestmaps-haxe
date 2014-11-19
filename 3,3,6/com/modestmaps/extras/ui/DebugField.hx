package com.modestmaps.extras.ui;

import openfl.text.TextField;
import com.modestmaps.core.TileGrid;
import com.modestmaps.core.Tile;
import openfl.text.TextFormat;
import openfl.utils.Timer;
import openfl.display.Sprite;
import openfl.system.System;
import com.modestmaps.core.painter.TilePainter;
import com.modestmaps.core.painter.ITilePainter;	
import de.polygonal.core.fmt.NumberFormat;
import openfl.utils.Object;

class DebugField extends TextField
{
	// for stats:
	private var lastFrameTime:Float;
	private var fps:Float = 30;	

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
		lastFrameTime = flash.Lib.getTimer(); 
	}

	public function update(grid:TileGrid, blankCount:Int, recentCount:Int, tilePainter:ITilePainter):Void
	{
		// for stats...
		var frameDuration:Float = flash.Lib.getTimer() - lastFrameTime;

		lastFrameTime = flash.Lib.getTimer();

		fps = Std.int((0.9 * fps) + (0.1 * (1000.0 / frameDuration)));

		var well:Sprite = cast(grid.getChildByName('well'), Sprite);

		// report stats:
		var tileChildren:Int = 0;
		
		for (i in 0...well.numChildren) {
			tileChildren += cast(well.getChildAt(i), Tile).numChildren;
		}
	  
		this.text = "tx: " + NumberFormat.toFixed(grid.tx, 3)
			+ "\nty: " + NumberFormat.toFixed(grid.ty, 3)
			+ "\nsc: " + NumberFormat.toFixed(grid.scale, 4)
			+ "\nfps: " + NumberFormat.toFixed(fps, 0)
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
			+ "\nmemory: " + NumberFormat.toFixed((System.totalMemory / 1048576), 1) + "MB"; 
		width = textWidth+8;
		height = textHeight+4;
	}
	
}