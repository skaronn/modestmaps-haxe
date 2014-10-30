/**
 * MapProvider for Open Street Map data.
 * 
 * @author migurski
 * $Id$
 */
package com.modestmaps.mapproviders;
 
import com.modestmaps.core.Coordinate;

class OpenStreetMapProvider extends AbstractMapProvider implements IMapProvider
{
	public function new(minZoom:Int=AbstractMapProvider.MIN_ZOOM, maxZoom:Int=AbstractMapProvider.MAX_ZOOM)
	{
		super(minZoom, maxZoom);
	}

	public function toString() : String
	{
		return "OPEN_STREET_MAP";
	}

	public function getTileUrls(coord:Coordinate):Array<Dynamic>
	{
		var sourceCoord:Coordinate = sourceCoordinate(coord);
		if (sourceCoord.row < 0 || sourceCoord.row >= Math.pow(2, coord.zoom)) {
			flash.Lib.trace("OpenStreetMapProvider.hx - getTileUrls - []");
			return [];
		}
		flash.Lib.trace("OpenStreetMapProvider.hx - getTileUrls - 'http://tile.openstreetmap.org/'+(sourceCoord.zoom)+'/'+(sourceCoord.column)+'/'+(sourceCoord.row)+'.png'");
		return [ 'http://tile.openstreetmap.org/'+(sourceCoord.zoom)+'/'+(sourceCoord.column)+'/'+(sourceCoord.row)+'.png' ];
	}
}