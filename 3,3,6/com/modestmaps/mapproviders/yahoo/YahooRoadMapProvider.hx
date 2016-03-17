package com.modestmaps.mapproviders.yahoo;

//import openfl.utils.Object;

import com.modestmaps.core.Coordinate;
import com.modestmaps.mapproviders.AbstractMapProvider;
import com.modestmaps.mapproviders.IMapProvider;

/**
 * @author darren
 * $Id$
 */
class YahooRoadMapProvider extends AbstractMapProvider implements IMapProvider
{
	public function new(minZoom:Int = AbstractMapProvider.MIN_ZOOM, maxZoom:Int = AbstractMapProvider.MAX_ZOOM)
	{
		super(minZoom, maxZoom);
	}

	public function toString():String
	{
		return "YAHOO_ROAD";
	}
	
	private function getZoomString(coord:Coordinate):String
	{	
		var row : Float = (Math.pow(2, coord.zoom) / 2) - coord.row - 1;
		return "&x=" + coord.column + "&y=" + row + "&z=" + (18 - coord.zoom);
	}

	public function getTileUrls(coord:Coordinate):Array<String>
	{	
		trace("http://us.maps2.yimg.com/us.png.maps.yimg.com/png?v=3.52&t=m" + getZoomString(sourceCoordinate(coord)));
		return [ "http://us.maps2.yimg.com/us.png.maps.yimg.com/png?v=3.52&t=m" + getZoomString(sourceCoordinate(coord)) ];
	}	
}