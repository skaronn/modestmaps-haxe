/**
 * MapProvider for Here Map data.
 * http://here.com/
 * 
 * @author skaronn
 * $Id$
 */
package com.modestmaps.mapproviders;
 
import com.modestmaps.core.Coordinate;

class HereMapProvider extends AbstractMapProvider implements IMapProvider
{
	private var appId : String;
	private var appCode : String;
	
	public function new(/*minZoom:Int=AbstractMapProvider.MIN_ZOOM, maxZoom:Int=AbstractMapProvider.MAX_ZOOM,*/ appId:String, appCode:String)
	{
		super(AbstractMapProvider.MIN_ZOOM, AbstractMapProvider.MAX_ZOOM);
		this.appId = appId;		
		this.appCode = appCode;		
	}

	public function toString() : String
	{
		return "HERE_MAP";
	}

	public function getTileUrls(coord:Coordinate):Array<Dynamic>
	{
		var sourceCoord:Coordinate = sourceCoordinate(coord);
		if (sourceCoord.row < 0 || sourceCoord.row >= Math.pow(2, coord.zoom)) {
			//flash.Lib.trace("HereMapProvider.hx - getTileUrls - []");
			return [];
		}
		//flash.Lib.trace("HereMapProvider.hx - getTileUrls - 'http://tile.openstreetmap.org/'+(sourceCoord.zoom)+'/'+(sourceCoord.column)+'/'+(sourceCoord.row)+'.png'");
		return [ 'http://tile.openstreetmap.org/'+(sourceCoord.zoom)+'/'+(sourceCoord.column)+'/'+(sourceCoord.row)+'.png' ];
	}
}