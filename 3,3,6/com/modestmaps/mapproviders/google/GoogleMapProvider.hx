/**
 * MapProvider for Google Map Tile API.
 * https://developers.google.com/maps
 * 
 * @author skaronn
 * $Id$
 */
package com.modestmaps.mapproviders.google;

import com.modestmaps.core.Coordinate;

import openfl.utils.Object;

class GoogleMapProvider extends AbstractMapProvider implements IMapProvider
{
	public static inline var EARTH:String = "earth";
	public static inline var SATELLITE_EARTH:String = "satellite_earth";
	public static inline var TERRAIN_EARTH:String = "terrain_earth";
	public static inline var LOCALE_EARTH:String = "locale_earth";
	public static inline var LABELS_EARTH:String = "labels_earth";
	public static inline var LABELS_LOCALE_EARTH:String = "labels_locale_earth";
	public static inline var MOON:String = "moon";
	public static inline var APPOLLO_MOON:String = "appollo_moon";
	public static inline var ELEVATION_MOON:String = "elevation_moon";
	public static inline var SKY_MOON:String = "sky_moon";
		
	private var mapType:String;
	
	private var IMAGE_FORMAT = {
		jpeg : 0,		
		gif : 1,		
		png : 2,		
		png8 : 3		
	};

	private var MAP_TYPE = { 
		roadmap : 0,
		satellite : 1,
		hybrid : 2
	};
	
	private static inline var SERVER = "mt";
    private static inline var REQUEST = "vt"; //
    private static inline var LYRS = "m@114"; // version
    private static inline var Hl = "vi"; // language 

	public function new(mapType:String=GoogleMapProvider.EARTH, minZoom:Int=AbstractMapProvider.MIN_ZOOM, maxZoom:Int=AbstractMapProvider.MAX_ZOOM)
	{
		super(minZoom, maxZoom);
		this.mapType = mapType;
	}

	public function toString():String
	{
		return "GOOGLE_MAP_"+mapType.toUpperCase();
	}

	private function getTileUrl(column:Float, row:Float, zoom:Float):String
	{
		var tileUrl:String = null;
		switch (mapType) 
		{
			case GoogleMapProvider.SKY_MOON:
				tileUrl = "http://mw1.google.com/mw-planetary/sky/skytiles_v1/" + column + "_" + row + "_" + zoom + ".jpg";

			case GoogleMapProvider.ELEVATION_MOON:
				tileUrl = "http://mw1.google.com/mw-planetary/lunar/lunarmaps_v1/terrain/" + zoom + "/" + column + "/" + -row + ".jpg";

			case GoogleMapProvider.APPOLLO_MOON:
				tileUrl = "http://mw1.google.com/mw-planetary/lunar/lunarmaps_v1/apollo/" + zoom + "/" + column + "/" + -row + ".jpg";

			case GoogleMapProvider.MOON:
				tileUrl = "http://mw1.google.com/mw-planetary/lunar/lunarmaps_v1/clem_bw/" + zoom + "/" + column + "/" + -row + ".jpg";

			case GoogleMapProvider.LABELS_LOCALE_EARTH:
				tileUrl = "http://mt3.google.com/vt/lyrs=h@162000000&hl=x-local&x=" + column + "&y=" + row + "&z=" + zoom;
	
			case GoogleMapProvider.LABELS_EARTH:
				tileUrl = "http://mt3.google.com/vt/lyrs=h@162000000&hl=en&x=" + column + "&y=" + row + "&z=" + zoom;

			case GoogleMapProvider.LOCALE_EARTH:
				tileUrl = "http://mt3.google.com/vt/v=w2.97&hl=x-local&x=" + column + "&y=" + row + "&z=" + zoom;

			case GoogleMapProvider.TERRAIN_EARTH:
				tileUrl = "http://mt3.google.com/vt/v=w2p.111&hl=en&x=" + column + "&y=" + row + "&z=" + zoom;
						
			case GoogleMapProvider.SATELLITE_EARTH:
				tileUrl = "http://khm1.google.com/kh/v=89&x=" + column + "&y=" + row + "&z=" + zoom;
	
			default:
			case GoogleMapProvider.EARTH:
				tileUrl = "http://mt3.google.com/vt/v=w2.97&x=" + column + "&y=" + row + "&z=" + zoom;
	
		}
		return tileUrl;
	}
			
	public function getTileUrls(coord:Coordinate):Array<Object>
	{
		var sourceCoord:Coordinate = sourceCoordinate(coord);
		if (sourceCoord.row < 0 || sourceCoord.row >= Math.pow(2, coord.zoom)) {
			return [];
		}
		return [ getTileUrl(sourceCoord.column, sourceCoord.row, sourceCoord.zoom) ];
	}
}