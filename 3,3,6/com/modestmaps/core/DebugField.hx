package com.modestmaps.core;

import openfl.text.TextField;
import com.modestmaps.core.TileGrid;
import com.modestmaps.core.Tile;
import openfl.text.TextFormat;
import openfl.utils.GetTimer;
import openfl.display.Sprite;
import openfl.system.System;
import com.modestmaps.core.painter.TilePainter;
import com.modestmaps.core.painter.ITilePainter;	

class DebugField extends TextField
{
	// for stats:
	private var lastFrameTime:Float;
	private var fps:Float = 30;	

	public function DebugField():Void
	{
		defaultTextFormat = new TextFormat(null, 12, 0x000000, false);
		backgroundColor = 0xffffff;
		background = true;
		text = "messages";
			name = 'debugField';
			mouseEnabled = false;
			selectable = false;
			multiline = true;
			wordWrap = false;

		lastFrameTime = getTimer();	
	}

	public function update(grid:TileGrid, blankCount:Int, recentCount:Int, tilePainter:ITilePainter):Void
	{
		// for stats...
		var frameDuration:Float = getTimer() - lastFrameTime;

		lastFrameTime = getTimer();

		fps = (0.9 * fps) + (0.1 * (1000.0/frameDuration));

		var well:Sprite = cast(grid.getChildByName('well'), Sprite);

		// report stats:
		var tileChildren:Int = 0;
		
		for (i in 0...well.numChildren) {
			tileChildren += Tile(well.getChildAt(i)).numChildren;
		}
	  
		this.text = "tx: " + grid.tx.toFixed(3)
			+ "\nty: " + grid.ty.toFixed(3)
			+ "\nsc: " + grid.scale.toFixed(4)
			+ "\nfps: " + fps.toFixed(0)
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
			+ "\nmemory: " + (System.totalMemory/1048576).toFixed(1) + "MB"; 
		width = textWidth+8;
		height = textHeight+4;
	}
}