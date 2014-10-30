/*
 * vim:et sts=4 sw=4 cindent:
 * $Id$
 */

package com.modestmaps.core;

import com.greensock.TweenLite;
//import com.gskinner.motion.GTweener;
//import tink.tween.Tweener;

class TweenTile extends Tile
{
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
		this.alpha = 0;
	}

	override public function show():Void 
	{
		if (alpha < 1) {
			TweenLite.to(this, FADE_TIME, { alpha: 1 });
		}
	}	

	override public function showNow():Void 
	{
		TweenLite.killTweensOf(this);
		this.alpha = 1;
	}	

	override public function destroy():Void 
	{
		TweenLite.killTweensOf(this);
		super.destroy();
	}	
	
}