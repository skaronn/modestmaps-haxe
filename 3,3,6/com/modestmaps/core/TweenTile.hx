/*
 * vim:et sts=4 sw=4 cindent:
 * $Id$
 */

package com.modestmaps.core;

import gs.TweenLite;

class TweenTile extends Tile
{			
	public function dumpFields():String
	{
		var concatDumpFields : String = "{"+this+"[alpha:" + this.alpha +"]}";
		//flash.Lib.trace("TweenTile.hx - dumpFields : " +concatDumpFields);
		return concatDumpFields;
	}
	
	public static var FADE_TIME:Float = 0.25;
		
	public function new(col:Int, row:Int, zoom:Int)
	{
		super(col, row, zoom);
	} 

	override public function hide():Void
	{
		// *** don't *** kill the tweens when hiding
		// it seems there's a harmless bug where hide might get called after show
		// if there's a tween running it will correct it though :)
		//TweenLite.killTweensOf(this);
		this.alpha = 0.0;
	}

	override public function show():Void 
	{
		if (alpha < 1) {
			//flash.Lib.trace("TweenLite.hx - override public function show - alpha: " + alpha);			
			TweenLite.to(this, FADE_TIME, { alpha : 1 } );
		}
	}	

	override public function showNow():Void 
	{
		TweenLite.killTweensOf(this);
		this.alpha = 1.0;
	}	

	override public function destroy():Void 
	{
		TweenLite.killTweensOf(this);
		super.destroy();
	}	
	
}