package com.modestmaps.extras;

import haxe.ds.ObjectMap;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.geom.Point;

import com.modestmaps.Map;
import com.modestmaps.core.MapExtent;
import com.modestmaps.geo.Location;

/** 
* a subclass of overlay that will render spot light
*/
class SpotlightOverlay extends Overlay
{	

	private var spots:Array<Location> = [];

	public function new(map:Map)
	{
		super(map);		
	}

	override public function redraw(sprite:Sprite):Void
	{				
		sprite.graphics.clear();
		
		var mapShadowOverlay:Sprite = new Sprite();
		mapShadowOverlay.graphics.beginFill(0x000000);
		mapShadowOverlay.graphics.drawRect(0, 0, map.width, map.height);
		mapShadowOverlay.graphics.endFill();
		mapShadowOverlay.alpha = 0.3;
		addChild(mapShadowOverlay);
		
		for (spot in spots)
		{
			var point:Point = map.locationPoint(spot, sprite);
			var spotOverlay:Sprite = new Sprite();
			spotOverlay.graphics.beginFill(0xFFFFFF);
			spotOverlay.graphics.drawCircle(point.x, point.y, 50);
			spotOverlay.graphics.endFill();
			spotOverlay.alpha = 0.1;
			addChild(spotOverlay);
		}
	}

    public function addSpot(locations:Array<Location>):MapExtent
	{
		spots = locations;
		
		var extent:MapExtent = MapExtent.fromLocations(spots);
	
		refresh();
		
		return extent;
	}
}