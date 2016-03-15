package com.modestmaps.mapproviders;

import openfl.geom.Point;
import openfl.utils.Object;

import com.modestmaps.core.Coordinate;
/**
 * https://msdn.microsoft.com/en-us/library/bb259689.aspx
 */
class BingMapProvider extends AbstractMapProvider implements IMapProvider
{	
	private static var EarthRadius : Float = 6378137;
	private static var MinLatitude : Float = -85.05112878;
	private static var MaxLatitude : Float = 85.05112878;
	private static var MinLongitude : Float = -180;
	private static var MaxLongitude : Float = 180;
	
	private var token : String;
	
	// Display an aerial view of the map.
	public static inline var AERIAL:String = "a";
	// Display a road view of the map.
	public static inline var ROAD:String = "r";
	// Display an aerial view of the map with labels.
	public static inline var AERIAL_LABELS:String = "h";
	// Use this value to display a bird's eye (oblique) view of the map.
	public static inline var BIRD_EYE:String = "o";
	// Display a bird's eye (oblique) with labels view of the map.
	public static inline var BIRD_EYE_LABELS:String = "b";	
	
	public function new(token : String, minZoom:Int = AbstractMapProvider.MIN_ZOOM, maxZoom:Int = AbstractMapProvider.MAX_ZOOM)
	{
		super(minZoom, maxZoom);
		this.token = token;
	}
	
	/**
	* Clips a number to the specified minimum and maximum values.
	* <param name="n">The number to clip.</param>
	* <param name="minValue">Minimum allowable value.</param>
	* <param name="maxValue">Maximum allowable value.</param>
	* <returns>The clipped value.</returns>
	*/
	private static function clip(n:Float, minValue:Float, maxValue:Float) : Float
	{
		return Math.min(Math.max(n, minValue), maxValue);
	}        

	/**
	* Determines the map width and height (in pixels) at a specified level
	* of detail.
	* <param name="levelOfDetail">Level of detail, from 1 (lowest detail)
	* to 23 (highest detail).</param>
	* <returns>The map width and height in pixels.</returns>
	*/
	private static function mapSize(levelOfDetail:Int) : UInt
	{
		return cast(256, UInt) << levelOfDetail;
	}

	/**
	* Determines the ground resolution (in meters per pixel) at a specified
	* latitude and level of detail.
	* <param name="latitude">Latitude (in degrees) at which to measure the
	* ground resolution.</param>
	* <param name="levelOfDetail">Level of detail, from 1 (lowest detail)
	* to 23 (highest detail).</param>
	* <returns>The ground resolution, in meters per pixel.</returns>
	*/
	private static function groundResolution(latitude:Float, levelOfDetail:Int) : Float
	{
		latitude = clip(latitude, MinLatitude, MaxLatitude);
		return Math.cos(latitude * Math.PI / 180) * 2 * Math.PI * EarthRadius / mapSize(levelOfDetail);
	}

	/**
	* Determines the map scale at a specified latitude, level of detail,
	* and screen resolution.
	* <param name="latitude">Latitude (in degrees) at which to measure the
	* map scale.</param>
	* <param name="levelOfDetail">Level of detail, from 1 (lowest detail)
	* to 23 (highest detail).</param>
	* <param name="screenDpi">Resolution of the screen, in dots per inch.</param>
	* <returns>The map scale, expressed as the denominator N of the ratio 1 : N.</returns>
	*/
	private static function mapScale(latitude:Float, levelOfDetail:Int, screenDpi:Int) :Float
	{
		return groundResolution(latitude, levelOfDetail) * screenDpi / 0.0254;
	}

	/**
	* Converts a point from latitude/longitude WGS-84 coordinates (in degrees)
	* into pixel XY coordinates at a specified level of detail.
	* <param name="latitude">Latitude of the point, in degrees.</param>
	* <param name="longitude">Longitude of the point, in degrees.</param>
	* <param name="levelOfDetail">Level of detail, from 1 (lowest detail)
	* to 23 (highest detail).</br>
	* <param name="pixelX">Output parameter receiving the X coordinate in pixels.</param>
	* <param name="pixelY">Output parameter receiving the Y coordinate in pixels.</param>
	*/
	private static function latLongToPixelXY(latitude:Float, longitude:Float, levelOfDetail:Int) : Point
	{
		latitude = clip(latitude, MinLatitude, MaxLatitude);
		longitude = clip(longitude, MinLongitude, MaxLongitude);
		
		var x : Float = (longitude + 180) / 360; 
		var sinLatitude : Float  = Math.sin(latitude * Math.PI / 180);
		var y : Float = 0.5 - Math.log((1 + sinLatitude) / (1 - sinLatitude)) / (4 * Math.PI);
		
		var mapSize : UInt = mapSize(levelOfDetail);
		var pixelX : Int = Std.int(clip(x * mapSize + 0.5, 0, mapSize - 1));
		var pixelY : Int = Std.int(clip(y * mapSize + 0.5, 0, mapSize - 1));
		
		return new Point(pixelX, pixelY);
	}

	/** 
	* Converts a pixel from pixel XY coordinates at a specified level of detail
	* into latitude/longitude WGS-84 coordinates (in degrees).
	* <param name="pixelX">X coordinate of the point, in pixels.</param>
	* <param name="pixelY">Y coordinates of the point, in pixels.</param>
	* <param name="levelOfDetail">Level of detail, from 1 (lowest detail)
	* to 23 (highest detail).</param>
	* <param name="latitude">Output parameter receiving the latitude in degrees.</param>
	* <param name="longitude">Output parameter receiving the longitude in degrees.</param>
	*/
	private static function pixelXYToLatLong(pixelX : Int, pixelY: Int, levelOfDetail: Int) : Coordinate
	{
		var mapSize : Float = mapSize(levelOfDetail);
		var x : Float = (clip(pixelX, 0, mapSize - 1) / mapSize) - 0.5;
		var y : Float = 0.5 - (clip(pixelY, 0, mapSize - 1) / mapSize);

		var latitude = 90 - 360 * Math.atan(Math.exp(-y * 2 * Math.PI)) / Math.PI;
		var longitude = 360 * x;
		
		return new Coordinate(latitude, longitude, levelOfDetail);
	}

	/** 
	* Converts pixel XY coordinates into tile XY coordinates of the tile containing
	* the specified pixel.
	* <param name="pixelX">Pixel X coordinate.</param>
	* <param name="pixelY">Pixel Y coordinate.</param>
	* <param name="tileX">Output parameter receiving the tile X coordinate.</param>
	* <param name="tileY">Output parameter receiving the tile Y coordinate.</param>
	*/
	private static function pixelXYToTileXY(pixelX : Int, pixelY : Int) : Point
	{
		var tileX = pixelX / 256;
		var tileY = pixelY / 256;
		
		return new Point(tileX, tileY);
	}

	/** 
	* Converts tile XY coordinates into pixel XY coordinates of the upper-left pixel
	* of the specified tile.
	* <param name="tileX">Tile X coordinate.</param>
	* <param name="tileY">Tile Y coordinate.</param>
	* <param name="pixelX">Output parameter receiving the pixel X coordinate.</param>
	* <param name="pixelY">Output parameter receiving the pixel Y coordinate.</param>
	*/
	private static function tileXYToPixelXY(tileX : Int, tileY : Int) : Point
	{
		var pixelX = tileX * 256;
		var pixelY = tileY * 256;

		return new Point(pixelX, pixelY);
	}

	/** 
	* Converts tile XY coordinates into a QuadKey at a specified level of detail.
	* <param name="tileX">Tile X coordinate.</param>
	* <param name="tileY">Tile Y coordinate.</param>
	* <param name="levelOfDetail">Level of detail, from 1 (lowest detail) to 23 (highest detail).</param>
	* <returns>A string containing the QuadKey.</returns>
	*/
	/**
	 * 
	 * @param	tileX
	 * @param	tileY
	 * @param	levelOfDetail
	 * @return
	 */
	private static function tileXYToQuadKey(tileX : Int, tileY : Int, levelOfDetail : Int) : String
	{
		var quadKey : StringBuf = new StringBuf();
		var i : Int = levelOfDetail;
		while (i > 0)
		{
			var digit = 0;
			var mask = 1 << (i - 1);
			if ((tileX & mask) != 0)
			{
				digit += 1;
			}
			if ((tileY & mask) != 0)
			{
				digit += 2;
			}
			quadKey.add(digit);
			i--;
		}
		return quadKey.toString();
	}

	/** 
	* Converts a QuadKey into tile XY coordinates.
	* <param name="quadKey">QuadKey of the tile.</param>
	* <param name="tileX">Output parameter receiving the tile X coordinate.</param>
	* <param name="tileY">Output parameter receiving the tile Y coordinate.</param>
	* <param name="levelOfDetail">Output parameter receiving the level of detail.</param>
	*/
	private static function quadKeyToTileXY(quadKey : String) : Coordinate
	{
		var tileX = 0;
		var tileY = 0;
		var levelOfDetail : Int = quadKey.length;
		var mask : Int;
		var i : Int = quadKey.length;
		while ( i > 0)
		{
			mask = 1 << (i - 1);
			switch (quadKey.charAt(levelOfDetail - i))
			{
				case '0':

				case '1':
					tileX |= mask;
					
				case '2':
					tileY |= mask;
					
				case '3':
					tileX |= mask;
					tileY |= mask;
					
				default:
					//throw new ArgumentException("Invalid QuadKey digit sequence.");
			}
			i--;
		}
		return new Coordinate(tileX, tileY, levelOfDetail);
	}
	
	public function toString() : String
	{
		return "BING_MAP";
	}

	public function getTileUrls(coord:Coordinate):Array<Object>
	{
		var sourceCoord:Coordinate = sourceCoordinate(coord);
		if (sourceCoord.row < 0 || sourceCoord.row >= Math.pow(2, coord.zoom)) {
			return [];
		}
		//var quadKey : String = tileXYToQuadKey(Std.int(sourceCoord.row), Std.int(sourceCoord.column), Std.int(sourceCoord.zoom));
		trace('coord.row : '+ coord.row);
		trace('coord.zoom : '+ coord.zoom);
		var quadKey : String = tileXYToQuadKey(2, 6, 4);
		trace('getTileUrls - http://t0.tiles.virtualearth.net/tiles/' + AERIAL +''+ (quadKey) + '.jpeg?g=90&mkt=en-US&token=Anz84uRE1RULeLwuJ0qKu5amcu5rugRXy1vKc27wUaKVyIv1SVZrUjqaOfXJJoI0');
		return [ 'http://t0.tiles.virtualearth.net/tiles/' + AERIAL +''+ (quadKey) + '.jpeg?g=90&mkt=en-US&token=Anz84uRE1RULeLwuJ0qKu5amcu5rugRXy1vKc27wUaKVyIv1SVZrUjqaOfXJJoI0' ];
	}
}