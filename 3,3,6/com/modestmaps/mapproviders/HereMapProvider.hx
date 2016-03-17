/**
 * MapProvider for Here Map Tile API.
 * https://developer.here.com
 * 
 * @author skaronn
 * $Id$
 */
package com.modestmaps.mapproviders;

//import openfl.utils.Object;
 
import com.modestmaps.core.Coordinate;

class HereMapProvider extends AbstractMapProvider implements IMapProvider
{
	private var appId : String;
	private var appCode : String;
	private var mapType : String;
	
	// provides map tiles using the map as a background
	public static inline var BASE:String = "Base";
	// provides map tiles using satellite images as a background
	public static inline var AERIAL:String = "Aerial";
	// provides map tiles using map and panorama coverage as a background
	public static inline var PANO:String = "Pano";
	// provides map tiles with a traffic flow overlay
	public static inline var TRAFFIC:String = "Traffic"; 
	
	public function new(appId:String, appCode:String, mapType:String = HereMapProvider.BASE, minZoom:Int = AbstractMapProvider.MIN_ZOOM, maxZoom:Int = AbstractMapProvider.MAX_ZOOM)
	{
		super(minZoom, maxZoom);
		this.mapType = mapType;
		this.appId = appId;		
		this.appCode = appCode;		
	}

	public function toString() : String
	{
		return "HERE_MAP";
	}

	//TODO: Why all the mapproviders returns an Array<String> instead of String, does it make sense?
	public function getTileUrls(coord:Coordinate):Array<String>
	{
		var sourceCoord:Coordinate = sourceCoordinate(coord);
		if (sourceCoord.row < 0 || sourceCoord.row >= Math.pow(2, coord.zoom))
		{
			return [];
		}
		return [ "http://1.base.maps.cit.api.here.com/maptile/2.1/maptile/newest/normal.day/" + sourceCoord.zoom + "/" + sourceCoord.column + "/" + sourceCoord.row + "/256/png8?app_id=" + appId + "&app_code=" + appCode ];
	}
}