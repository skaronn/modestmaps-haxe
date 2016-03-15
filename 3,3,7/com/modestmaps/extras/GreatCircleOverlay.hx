package com.modestmaps.extras;

import haxe.ds.ObjectMap;

import openfl.display.Sprite;
import openfl.filters.DropShadowFilter;
import openfl.geom.Point;
//import openfl.utils.Object;

import com.modestmaps.Map;
import com.modestmaps.core.MapExtent;
import com.modestmaps.geo.Location;

/** 
* a subclass of overlay that will render dashed great-circle arcs
*/
class GreatCircleOverlay extends Overlay
{	
	public var lines:Array<Array<Location>> = [];
	private var styles:ObjectMap<Array<Location>, LineStyle> = new ObjectMap<Array<Location>, LineStyle>();

	public function new(map:Map)
	{
		super(map);
		this.filters = [ new DropShadowFilter(2, 90, 0x000000, 0.35, 8, 8, 2, 1, false, false, false) ];
	}

	override public function redraw(sprite:Sprite):Void
	{
		sprite.graphics.clear();
		for (line in lines) {
			var lineStyle:LineStyle = styles.get(line);
			var p:Point = map.locationPoint(line[0], sprite);
			sprite.graphics.moveTo(p.x, p.y);
			var i:Int = 0;
			var prev:Location = null;
			var fields = Reflect.fields(line.slice(1));
			for (elt in fields) {
				var thickness:Float = Math.min(1, 1 - Math.abs(i - (line.length / 2)) / (line.length / 3));
				/*
				if (i % 4 == 0 && i != line.length-1) {
					sprite.graphics.lineStyle();
				}
				else {
					lineStyle.apply(sprite.graphics, 1+thickness);
				}
				*/
				var location : Location = cast(elt, Location);
				lineStyle.apply(sprite.graphics, 1 + thickness);
				p = map.locationPoint(location, sprite);
				if (prev != null && (Math.abs(prev.lat - location.lat) > 10 || Math.abs(prev.lon - location.lon) > 10)) {
					sprite.graphics.moveTo(p.x, p.y);
				}
				else {
					sprite.graphics.lineTo(p.x, p.y);
				}
				i++;
				prev = location;
			}
		}
	}

	public function addGreatCircle(start:Location, end:Location, lineStyle:LineStyle = null):MapExtent
	{
		var extent:MapExtent = new MapExtent();
		var latlngs:Array<Location> = [];
		
		var lat1:Float = start.lat * Math.PI / 180.0;
		var lon1:Float = start.lon * Math.PI / 180.0;
		var lat2:Float = end.lat * Math.PI / 180.0;
		var lon2:Float = end.lon * Math.PI / 180.0;
		
		var d:Float = 2 * Math.asin(Math.sqrt( Math.pow((Math.sin((lat1 - lat2) / 2)), 2) + Math.cos(lat1) * Math.cos(lat2) * Math.pow((Math.sin((lon1 - lon2) / 2)), 2)));
		var bearing:Float = Math.atan2(Math.sin(lon1 - lon2) * Math.cos(lat2), Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(lon1 - lon2))  / -(Math.PI / 180);
		bearing = bearing < 0 ? 360 + bearing : bearing;

		var numSegments:Int = Std.int(40 + (400 * Distance.approxDistance(start, end) / (Math.PI * 2 * 6378000)));
		
		for (n in 0...numSegments) {
			var f:Float = (1 / (numSegments - 1)) * n;
			var A:Float = Math.sin((1 - f) * d) / Math.sin(d);
			var B:Float = Math.sin(f * d) / Math.sin(d);
			var x:Float = A * Math.cos(lat1) * Math.cos(lon1) +  B * Math.cos(lat2) * Math.cos(lon2);
			var y:Float = A * Math.cos(lat1) * Math.sin(lon1) +  B * Math.cos(lat2) * Math.sin(lon2);
			var z:Float = A * Math.sin(lat1) +  B * Math.sin(lat2);
			var latN:Float = Math.atan2(z, Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2)));
			var lonN:Float = Math.atan2(y, x);
			var l:Location = new Location(latN / (Math.PI / 180), lonN / (Math.PI / 180));
			latlngs.push(l);
			extent.enclose(l);
		}
		
		lines.push(latlngs);
		
		styles.set(latlngs, (lineStyle != null ? lineStyle : new LineStyle()));

		refresh();
		
		return extent;
	}
}