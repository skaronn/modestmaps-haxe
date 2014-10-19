
package com.modestmaps.mapproviders.microsoft;

import com.modestmaps.core.Coordinate;
import com.modestmaps.Map;
import com.modestmaps.mapproviders.AbstractMapProvider;
import com.modestmaps.mapproviders.IMapProvider;
import com.modestmaps.util.BinaryUtil;
import haxe.ds.ObjectMap;

/**
 * @author tom
 * @author darren
 * @author migurski
 	 * $Id:$
 */

class MicrosoftProvider extends AbstractMapProvider implements IMapProvider
{
	public static inline var AERIAL:String = "AERIAL";
	public static inline var ROAD:String = "ROAD";
	public static inline var HYBRID:String = "HYBRID";

	public static var serverSalt:Int = cast((Math.random() * 4), Int);
		
	private static var URLSTART:ObjectMap<String, String> = [
		AERIAL => "http://a",
		ROAD => "http://r",
		HYBRID => "http://h"
	];
		
	private static var URLMIDDLE:ObjectMap<String, String> = [
		AERIAL => ".ortho.tiles.virtualearth.net/tiles/a",
		ROAD => ".ortho.tiles.virtualearth.net/tiles/r",
		HYBRID => ".ortho.tiles.virtualearth.net/tiles/h"
	];
	
	private static var URLEND:ObjectMap<String, String> = [
		AERIAL => ".jpeg?g=90",
		ROAD => ".png?g=90",
		HYBRID => ".jpeg?g=90"
	];

	private var type:String;
	
	private var hillShading:Bool;

	public function new(type:String=ROAD, hillShading:Bool=true, minZoom:Int=AbstractMapProvider.MIN_ZOOM, maxZoom:Int=AbstractMapProvider.MAX_ZOOM)
	{
		super(minZoom, maxZoom);
		
		this.type = type;
		this.hillShading = hillShading;

		if (hillShading) {
			URLEND.set(ROAD, URLEND.get(ROAD)+"&shading=hill"); 
		}

		// Microsoft don't have a zoom level 0 right now:
		__topLeftOutLimit.zoomTo(1);
	}

	private function getZoomString(coord:Coordinate):String
	{
		var sourceCoord:Coordinate = sourceCoordinate(coord);
		
		// convert row + col to zoom string
		// padded with zeroes so we end up with zoom digits after slicing:
		var rowBinaryString:String = Std.string(sourceCoord.row);
		rowBinaryString = rowBinaryString.substr(cast(-sourceCoord.zoom, Int));
		
		var colBinaryString : String = Std.string(sourceCoord.column);
		colBinaryString = colBinaryString.substr(cast(-sourceCoord.zoom, Int));

		// generate zoom string by combining strings
		var zoomString : String = "";

		for (i in 0...cast(sourceCoord.zoom, Int))
		{
			zoomString += BinaryUtil.convertToDecimal(rowBinaryString.charAt( i ) + colBinaryString.charAt( i ));
		}
		
		return zoomString; 
	}

	public function toString():String
	{
		return "MICROSOFT_"+type;
	}

	public function getTileUrls(coord:Coordinate):Array<Dynamic>
	{
		if (coord.row < 0 || coord.row >= Math.pow(2, coord.zoom)) {
			return null;
		}
		// this is so that requests will be consistent in this session, rather than totally random
		var serverRequest:Float = cast((serverSalt + coord.row + coord.column + coord.zoom) % 4, Float);
		var server:Int = cast(Math.abs(serverRequest), Int);
		return [ URLSTART.get(type) + server + URLMIDDLE.get(type) + getZoomString(coord) + URLEND.get(type) ];
	}

}