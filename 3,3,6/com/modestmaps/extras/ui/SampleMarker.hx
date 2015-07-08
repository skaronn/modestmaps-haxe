package com.modestmaps.extras.ui;

import openfl.Assets;
import openfl.display.MovieClip;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.MouseEvent; 

/**
 * Sample Marker
 * @author David Knape
 */
@:bitmap("assets/simple_marker_resized.png")
class MarkerLogo extends openfl.display.BitmapData
{
    
}

class SampleMarker extends MovieClip
{ 
	private var _title : String;

	public function new ()
	{
		super();
		stop();
		
		buttonMode = true;
		mouseChildren = false;
		tabEnabled = false;        	
		cacheAsBitmap = true;
		
		var mb : MarkerLogo = new MarkerLogo(20, 20);
		var bitmap = new Bitmap(mb);		
		addChild(bitmap);
		
		addEventListener(MouseEvent.ROLL_OVER, bringToFront, true);
	}
	
	public var title(get, set) : String;
	
	private function get_title() : String
	{
		return _title;
	}
	
	private function set_title(s:String) : String
	{
		_title = s;
		return _title;
	}
	
	public function bringToFront(e:MouseEvent) : Void
	{
		parent.swapChildrenAt(parent.getChildIndex(this), parent.numChildren - 1);
	}
	
	override public function toString() : String
	{
		return '[SampleMarker] ' + title;
	}
}