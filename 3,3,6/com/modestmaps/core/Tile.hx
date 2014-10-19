/*
 * vim:et sts=4 sw=4 cindent:
 * $Id$
 */

package com.modestmaps.core;

import openfl.display.Bitmap;
import openfl.display.DisplayObject;
import openfl.display.Loader;
import openfl.display.Sprite;
import openfl.errors.Error;

class Tile extends Sprite
{	
	public static var count:Int = 0;

	// not a coordinate, because it's very important these are ints
	public var zoom:Int;
	public var row:Int;
	public var column:Int;
		
	public function new(column:Int, row:Int, zoom:Int)
	{
		super();
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
			if (Std.is(child, Loader))
			{
				try {
					cast(child, Loader).unload();
				}
				catch (error:Error) {
					error.getStackTrace();
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
		
		if (this.graphics != null)
		{
			this.graphics.clear();		
			
			this.graphics.beginFill(0x808080);
			this.graphics.drawRect(0, 0, w, h);

			this.graphics.moveTo(0, 0);
			this.graphics.beginFill(0x444444, 1);
			this.graphics.lineTo(size, 0);
			this.graphics.lineTo(size, size);
			this.graphics.lineTo(0, size);
			this.graphics.lineTo(0, 0);
			this.graphics.endFill();
			
			this.graphics.moveTo(weight+padding, padding);
			this.graphics.beginFill(0x888888, 1);
			this.graphics.lineTo(padding, weight+padding);
			this.graphics.lineTo(size-weight-padding, size-padding);
			this.graphics.lineTo(size-padding, size-weight-padding);
			this.graphics.lineTo(weight+padding, padding);
			this.graphics.endFill();
			
			this.graphics.moveTo(size-weight-padding, padding);
			this.graphics.beginFill(0x888888, 1);
			this.graphics.lineTo(size-padding, weight+padding);
			this.graphics.lineTo(weight+padding, size-padding);
			this.graphics.lineTo(padding, size-weight-padding);
			this.graphics.lineTo(size-weight-padding, padding);
			this.graphics.endFill();
		}		
	}

}