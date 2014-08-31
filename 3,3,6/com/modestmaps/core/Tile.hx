/*
 * vim:et sts=4 sw=4 cindent:
 * $Id$
 */

package com.modestmaps.core;

import openfl.display.Bitmap;
import openfl.display.DisplayObject;
import openfl.display.Loader;
import openfl.display.Sprite;

class Tile extends Sprite
{	
	public static var count:Int = 0;

	// not a coordinate, because it's very important these are ints
	public var zoom:Int;
	public var row:Int;
	public var column:Int;
		
	public function new(column:Int, row:Int, zoom:Int)
	{
		init(column, row, zoom);
		
		// otherwise you'll get seams between tiles :(
		this.cacheAsBitmap = false;
		
		count++;
	} 

	/** override this in a subclass and call grid.setTileClass if you want to draw on your tiles */
	public function init(column:Int, row:Int, zoom:Int):Void
	{
		this.zoom = zoom;
		this.row = row;
		this.column = column;		
		hide();
	}	

	/** once TileGrid is done with a tile, it will call destroy and possibly reuse it later */
	public function destroy():Void
	{
		while (numChildren > 0) {
			var child:DisplayObject = removeChildAt(0);
			if (Std.is(child, Loader)) {
				try {
				Loader(child).unload();
				}
				catch (error:Error) {
				// meh
				}
			}
		}
		graphics.clear();
	}	

	public function isShowing():Bool
	{
		return this.alpha == 1.0;
	}

	public function showNow():Void
	{
		this.alpha = 1.0;
	}

	public function show():Void 
	{
		this.alpha = 1.0;
		// if you want to do something when the tile is ready then override 
		// this method and override Map.createTile to use your subclass 
	}

	public function hide():Void
	{
		this.alpha = 0.0;
	}

	public function paintError(w:Float=256, h:Float=256):Void
	{
		// length of 'X' side, padding from edge, weight of 'X' symbol
		var size:UInt = 32;
		var padding:UInt = 4;
		var weight:UInt = 4;
		
		with (graphics);
		{
			clear();		
			
			beginFill(0x808080);
			drawRect(0, 0, w, h);

			moveTo(0, 0);
			beginFill(0x444444, 1);
			lineTo(size, 0);
			lineTo(size, size);
			lineTo(0, size);
			lineTo(0, 0);
			endFill();
			
			moveTo(weight+padding, padding);
			beginFill(0x888888, 1);
			lineTo(padding, weight+padding);
			lineTo(size-weight-padding, size-padding);
			lineTo(size-padding, size-weight-padding);
			lineTo(weight+padding, padding);
			endFill();
			
			moveTo(size-weight-padding, padding);
			beginFill(0x888888, 1);
			lineTo(size-padding, weight+padding);
			lineTo(weight+padding, size-padding);
			lineTo(padding, size-weight-padding);
			lineTo(size-weight-padding, padding);
			endFill();
		}		
	}

}