package com.modestmaps.overlays;

import openfl.display.BitmapData;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Matrix;
import openfl.geom.Point;
import openfl.utils.Object;

import com.modestmaps.Map;
import com.modestmaps.core.Coordinate;
import com.modestmaps.core.MapExtent;
import com.modestmaps.core.TileGrid;
import com.modestmaps.geo.Location;
import com.modestmaps.mapproviders.IMapProvider;

class PolygonMarker extends Sprite implements Redrawable
{
	private var map:Map;
	private var provider:IMapProvider;
	private var drawZoom:Float;

	public var zoomTolerance:Float = 4;

	public var locations:Array<Object>;
	private var coordinates:Array<Object>; // cached after converting locations with the map provider
	public var extent:MapExtent;
	public var location:Location;

	public var line:Bool = true;
	public var lineThickness:Float = 0;
	public var lineColor:UInt = 0xFFFFFF;
	public var lineAlpha:Float = 1;
	public var linePixelHinting:Bool = false;
	public var lineScaleMode:LineScaleMode = LineScaleMode.NONE;
	public var lineCaps:CapsStyle = null;
	public var lineJoints:JointStyle = null; 
	public var lineMiterLimit:Float = 3; 	

	public var autoClose:Bool = true;

	public var fill:Bool = true;
	public var fillColor:UInt = 0xFF0000;
	public var fillAlpha:Float = 0.2;

	public var bitmapFill:Bool = false;
	public var bitmapData:BitmapData = null;
	public var bitmapMatrix:Matrix = null;
	public var bitmapRepeat:Bool = false;
	public var bitmapSmooth:Bool = false;
		
	/** 
	 * Creates a polygon from the given array (or array of arrays) of Locations.
	 * 
	 * The polygon will use the given map to project the locations, and should be added to an
	 * instance of PolygonClip, which will add and remove it from the stage and position it
	 * as required.
	 * 
	 * If an array of arrays of Locations is given, the first array will be drawn as the outer
	 * ring of the polygon, and subsequent arrays will be treated as holes if they overlap it.
	 * 
	 */
	public function new(map:Map, locations:Array<Location>, autoClose:Bool = true)	
	{
		super();
		this.map = map;
		this.provider = map.getMapProvider();
		this.mouseEnabled = false;
		this.autoClose = autoClose;

		if (locations != null && locations.length > 0)
		{
			if (locations.length > 0 && Std.is(locations[0], Location))
			{
				locations = [ locations ];
			}
			if (locations[0].length > 0 && Std.is(locations[0], Array))
			{
				this.locations = [ locations[0] ];
				this.extent = MapExtent.fromLocations(locations[0]);
				this.location = cast(locations[0][0], Location);
				this.coordinates = [ locations[0].map(l2c) ];
				

				//for each (var hole:Array in locations.slice(1))
				var hole:Array<Object>;
				var slicedLocations = locations.slice(1);
				for (holeIndex in 0...slicedLocations.length)
				{
					hole = cast(slicedLocations[holeIndex], Array<Object>);
					addHole(hole);
				}
			}
		}
	}

	public function addHole(hole:Array<Object>):Void	
	{
		this.locations.push(hole);
		this.extent.encloseExtent(MapExtent.fromLocations(hole));
		//TOFIX
		//this.coordinates.push(hole.map(l2c));	
		updateGraphics();
	}

	private function l2c(l:Location, rest : Array<Object> = null):Coordinate
	{
		return provider.locationCoordinate(l);
	}

	public function redraw(event:Event = null):Void	
	{	
		if (event != null && drawZoom > 0 && Math.abs(map.grid.zoomLevel - drawZoom) < zoomTolerance) {			
			scaleX = scaleY = Math.pow(2, map.grid.zoomLevel - drawZoom);			
		}
		else {
			updateGraphics();
		}
	}

	public function updateGraphics():Void
	{	
		var grid:TileGrid = map.grid;
		
		drawZoom = grid.zoomLevel;
		scaleX = scaleY = 1;
		
		graphics.clear();
		
		if (line) {
			graphics.lineStyle(lineThickness, Std.int(lineColor), lineAlpha, linePixelHinting, lineScaleMode, lineCaps/*, lineJoints, lineMiterLimit*/);
		}
		else {
			graphics.lineStyle();
		}
		if (fill) {
			if (bitmapFill && bitmapData != null) {
				graphics.beginBitmapFill(bitmapData, bitmapMatrix, bitmapRepeat, bitmapSmooth);
			} 
			else {
				graphics.beginFill(fillColor, fillAlpha);
			}
		}
		
		if (location != null ) {
			var firstPoint:Point = grid.coordinatePoint(coordinates[0][0]);
			//for each (var ring:Array in coordinates) {
			var ring:Array<Object>;
			for (ringIndex in 0...coordinates.length) {
				ring = cast(coordinates[ringIndex], Array<Object>) ;
				var ringPoint:Point = grid.coordinatePoint(ring[0]);
				graphics.moveTo(ringPoint.x - firstPoint.x, ringPoint.y - firstPoint.y);				
				var p:Point = null;
				//for each (var coord:Coordinate in ring.slice(1)) {
				var coord:Coordinate;
				var slicedRing = ring.slice(1);
				for (coordIndex in 0...slicedRing.length) {
					coord = cast(slicedRing[coordIndex], Coordinate);
					p = grid.coordinatePoint(coord);
					graphics.lineTo(p.x - firstPoint.x, p.y - firstPoint.y);					
				}
				if (autoClose && !ringPoint.equals(p)) {					
					graphics.lineTo(ringPoint.x - firstPoint.x, ringPoint.y - firstPoint.y);					
				}
			}
		}
		
		if (fill) {
			graphics.endFill();
		}
	}
	
}