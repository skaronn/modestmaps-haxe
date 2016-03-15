package com.modestmaps.mapproviders;

import com.modestmaps.core.Coordinate;
import openfl.utils.Object;

class CloudMadeProvider extends OpenStreetMapProvider
{
	public static inline var THE_ORIGINAL:String = '1';
	public static inline var FINE_LINE:String = '2';
	public static inline var TOURIST:String = '7';

	public static inline var FRESH:String = '997';
	public static inline var PALE_DAWN:String = '998';
	public static inline var MIDNIGHT_COMMANDER:String = '999';

	/** see http://developers.cloudmade.com/projects to get hold of an API key */
	public var key:String;

	/** use the constants above or see maps.cloudmade.com for more styles */
	public var style:String;

	public function new(key:String, style:String='1')
	{
		super();
		this.key = key;
		this.style = style;
	}

	override public function getTileUrls(coord:Coordinate):Array<Object>
	{
		var worldSize:Int = Std.int(Math.pow(2, coord.zoom));
		if (coord.row < 0 || coord.row >= worldSize) {
			return [];
		}
		coord = sourceCoordinate(coord);
		var server:String = [ 'a.', 'b.', 'c.', '' ][Std.int(worldSize * coord.row + coord.column) % 4];
		var url:String = 'http://' + server + 'tile.cloudmade.com/' + [ key, style, Std.string(tileWidth), Std.string(coord.zoom), Std.string(coord.column), Std.string(coord.row) ].join('/') + '.png'; 
		return [ url ];
	}

	override public function toString():String
	{
		return 'CLOUDMADE';
	}	
}