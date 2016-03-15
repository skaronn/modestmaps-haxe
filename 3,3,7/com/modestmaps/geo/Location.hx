/*
 * $Id$
 */
package com.modestmaps.geo;

import openfl.errors.Error;

import hxculture.FormatNumber;
import hxculture.cultures.FrFR;

import com.modestmaps.util.DebugUtil;

/**
 * 
 */
class Location
{
	public static inline var MAX_LAT:Float = 84;
	public static inline var MIN_LAT:Float = -84;
	public static inline var MAX_LON:Float = 180;
	public static inline var MIN_LON:Float = -180;

	// Latitude, longitude, _IN DEGREES_.
	public var lat:Float;
	public var lon:Float;

	/**
	 * 
	 * @param	location
	 * @param	lonlat
	 * @return
	 */
	public static function fromString(location:String, lonlat:Bool = false):Location
	{
		//trace("fromString - location : "+location);
		var regexp = new EReg("s*, s*", "i");
		var parts:Array<String> = regexp.split(location);
		if (lonlat) parts.reverse();
		//trace("fromString - parts[0] : "+parts[0]);
		//trace("fromString - parts[1] : " + parts[1]);
		return new Location(Std.parseFloat(parts[0]), Std.parseFloat(parts[1]));
	}

	/**
	 * 
	 * @param	lat
	 * @param	lon
	 */
	public function new(lat:Float, lon:Float)
	{
		this.lat = lat;
		this.lon = lon;
		//trace("new - this.lat : " + this.lat);
		//trace("new - this.lon : " + this.lon);
		//DebugUtil.dumpStack(null, "new");
	}

	/**
	 * 
	 * @param	loc
	 * @return
	 */
	public function equals(loc:Location):Bool
	{
		return loc != null && loc.lat == lat && loc.lon == lon;
	}

	public function clone():Location
	{
		return new Location(lat, lon);
	}

	/**
	 * This function normalizes latitude and longitude values to a sensible range
	 * (±84°N, ±180°E), and returns a new Location instance.
	 */
	public function normalize():Location
	{
		var loc:Location = clone();
		loc.lat = Math.max(MIN_LAT, Math.min(MAX_LAT, loc.lat));
		while (loc.lon > 180) loc.lon -= 360;
		while (loc.lon < -180) loc.lon += 360;
		return loc;
	}

	/**
	 * 
	 * @param	precision
	 * @return
	 */
	public function toString(precision:Int = 5):String
	{
		return [FormatNumber.decimal(lat, FrFR.culture, precision), FormatNumber.decimal(lon, FrFR.culture, precision)].join(',');
	}
}