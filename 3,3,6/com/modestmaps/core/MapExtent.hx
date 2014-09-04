/*
 * $Id$
 */
package com.modestmaps.core;

import com.modestmaps.geo.Location;
import openfl.utils.Object;

import flash.geom.Rectangle;

//class MapExtent extends Object
class MapExtent
{
	// TODO: OK for rectangular projections, but we need a better way for other projections
	public var north:Float;
	public var south:Float;
	public var east:Float;
	public var west:Float;

	/** 
	 * @param n the most northerly latitude
	 * @param s the southern latitude
	 * @param e the eastern-most longitude
	 * @param w the westest longitude
	 */
	public function new(n:Float=0, s:Float=0, e:Float=0, w:Float=0)
	{
		north = Math.max(n, s);
		south = Math.min(n, s);
		east = Math.max(e, w);
		west = Math.min(e, w);
	}

	public function clone():MapExtent
	{
		return new MapExtent(north, south, east, west);
	}

	/** 
	* enlarges this extent so that the given extent is inside it
	*/
	public function encloseExtent(extent:MapExtent):Void
	{
		north = Math.max(extent.north, north);
		south = Math.min(extent.south, south);
		east = Math.max(extent.east, east);
		west = Math.min(extent.west, west);		
	}

	/** enlarges this extent so that the given location is inside it */
	public function enclose(location:Location):Void
	{
		north = Math.max(location.lat, north);
		south = Math.min(location.lat, south);
		east = Math.max(location.lon, east);
		west = Math.min(location.lon, west);
	}

	public var northWest(getNorthWest, setNorthWest):Location;
	
	private function getNorthWest():Location
	{
		return new Location(north, west);
	}

	public var southWest(getSouthWest, setSouthWest):Location;
	
	private function getSouthWest():Location
	{
		return new Location(south, west);
	}

	public var northEast(getNorthEast, setNorthEast):Location;
	
	private function getNorthEast():Location
	{
		return new Location(north, east);
	}

	public var southEast(getSouthEast, setSouthEast):Location;
	
	private function getSouthEast():Location
	{
		return new Location(south, east);
	}

	private function setNorthWest(nw:Location):Void
	{
		north = nw.lat;
		west = nw.lon;
	}

	private function setSouthWest(sw:Location):Void
	{
		south = sw.lat;
		west = sw.lon;
	}

	private function setNorthEast(ne:Location):Void
	{
		north = ne.lat;
		east = ne.lon;
	}

	private function setSouthEast(se:Location):Void
	{
		south = se.lat;
		east = se.lon;
	}

	public var center(getCenter, setCenter):Location;
	
	private function getCenter():Location
	{   
		return new Location(south + (north - south) / 2, east + (west - east) / 2);
	}

	private function setCenter(location:Location):Void
	{   
		var w:Float = east - west;
		var h:Float = north - south;
		north = location.lat - h / 2;
		south = location.lat + h / 2;
		east = location.lon + w / 2;
		west = location.lon - w / 2;
	}

	public function inflate(lat:Float, lon:Float):Void
	{
		north += lat;
		south -= lat;
		west -= lon;
		east += lon;
	}

	public function getRect():Rectangle
	{
		var rect:Rectangle = new Rectangle(Math.min(east, west), Math.min(north, south));
		rect.right = Math.max(east, west);
		rect.bottom = Math.max(north, south);
		return rect;
	}

	public function contains(location:Location):Bool
	{
		return getRect().contains(location.lon, location.lat);
	}

	public function containsExtent(extent:MapExtent):Bool
	{
		return getRect().containsRect(extent.getRect());
	}

	/** 
	* @return "north, south, east, west"
	*/
	public function toString():String
	{
		return [north, south, east, west].join(', ');
	}

	/**
	* Creates a new MapExtent from the given String.
	* 
	* @param str "north, south, east, west"
	* @return a new MapExtent from the given string
	*/
	public static function fromString(str:String):MapExtent
	{
		var parts:Array = new Array<Dynamic>(); //str.split(/\s*,\s*/, 4);
		return new MapExtent(Std.parseFloat(parts[0]),
				 Std.parseFloat(parts[1]),
				 Std.parseFloat(parts[2]),
				 Std.parseFloat(parts[3]));
	}

	/**
	* Calculate the north/south/east/west extremes of the given array of locations
	* 
	* @param	locations
	* @return
	*/
	public static function fromLocations(locations:Array<Dynamic>):MapExtent
	{
		if (locations==null || locations.length == 0) return new MapExtent();
		
		var extent:MapExtent;
		var location:Location;
		
		for (location in locations)
		{
			if (extent == null)
			{
				if (location && !Math.isNaN(location.lat) && !Math.isNaN(location.lon)) {
					extent = new MapExtent(location.lat, location.lat, location.lon, location.lon);
				}			
			}
			else {
				if (location && !Math.isNaN(location.lat) && !Math.isNaN(location.lon)) {
					extent.enclose(location);
				}
			}
		}
		
		if (extent!=null) {
			extent = new MapExtent();
		}
		
		return extent;
	}

	/**
	* 
	* @param	location
	* @return
	*/
	public static function fromLocation(location:Location):MapExtent
	{
		return new MapExtent(location.lat, location.lat, location.lon, location.lon);
	}

	/**
	* 
	* @param	objects
	* @param	locationProp
	* @return
	*/
	public static function fromLocationProperties(objects:Array<Dynamic>, locationProp:String='location'):MapExtent
	{
		//return fromLocations(objects.map(function(obj:Object, ...rest):Location { return obj[locationProp] as Location }));
		return fromLocations(objects.map(function(obj:Dynamic, rest:Dynamic = null):Location { return cast (obj[locationProp], Location);  } ));
	}

}