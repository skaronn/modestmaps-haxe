/**
 * vim:et sts=4 sw=4 cindent:
 * @ignore
 *
 * @author migurski
 * @author darren
 * @author tom
 *
 * com.modestmaps.Map is the base class and interface for Modest Maps.
 *
 * @description Map is the base class and interface for Modest Maps.
 * 		Correctly attaching an instance of this Sprite subclass 
 * 		should result in a pannable map. Controls and event 
 * 		handlers must be added separately.
 *
 * @usage <code>
 *	  import com.modestmaps.Map;
 *	  import com.modestmaps.geo.Location;
 *	  import com.modestmaps.mapproviders.BlueMarbleMapProvider;
 *	  ...
 *	  var map:Map = new Map(640, 480, true, new BlueMarbleMapProvider());
 *	  addChild(map);
 *	</code>
 *
 */
package com.modestmaps;

import com.modestmaps.core.*;
import com.modestmaps.events.*;
import com.modestmaps.geo.*;
import com.modestmaps.mapproviders.IMapProvider;
import com.modestmaps.mapproviders.microsoft.MicrosoftProvider;
import com.modestmaps.overlays.MarkerClip;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
//import flash.utils.GetTimer;

//[Event(name="startZooming",	  type="com.modestmaps.events.MapEvent")]
//[Event(name="stopZooming",	   type="com.modestmaps.events.MapEvent")]
//[Event(name="zoomedBy",	  type="com.modestmaps.events.MapEvent")]
//[Event(name="startPanning",	  type="com.modestmaps.events.MapEvent")]
//[Event(name="stopPanning",	   type="com.modestmaps.events.MapEvent")]
//[Event(name="panned",		type="com.modestmaps.events.MapEvent")]
//[Event(name="resized",	   type="com.modestmaps.events.MapEvent")]
//[Event(name="mapProviderChanged",type="com.modestmaps.events.MapEvent")]
//[Event(name="beginExtentChange", type="com.modestmaps.events.MapEvent")]
//[Event(name="extentChanged",	 type="com.modestmaps.events.MapEvent")]
//[Event(name="beginTileLoading",  type="com.modestmaps.events.MapEvent")]
//[Event(name="allTilesLoaded",	type="com.modestmaps.events.MapEvent")]
//[Event(name="rendered",	  type="com.modestmaps.events.MapEvent")]
//[Event(name="markerRollOver",	type="com.modestmaps.events.MarkerEvent")]
//[Event(name="markerRollOut",	 type="com.modestmaps.events.MarkerEvent")]
//[Event(name="markerClick",	   type="com.modestmaps.events.MarkerEvent")]
import flash.errors.Error;

class Map extends Sprite
{
	private var mapWidth:Float;
	private var mapHeight:Float;
	private var __draggable:Bool = true;

	/** das grid */
	public var grid:TileGrid;

	/** markers are attached here */
	public var markerClip:MarkerClip;

	/** Who do we get our Map urls from? How far can we pan? */
	private var mapProvider:IMapProvider;

	/** fraction of width/height to pan panLeft, panRight, panUp, panDown
	 * @default 0.333333333  
	 */
	public var panFraction:Float = 0.333333333;

	/**
	* Initialize the map: set properties, add a tile grid, draw it.
	* Default extent covers the entire globe, (+/-85, +/-180).
	*
	* @param	Width of map, in pixels.
	* @param	Height of map, in pixels.
	* @param	Whether the map can be dragged or not.
	* @param	Desired map provider, e.g. Blue Marble.
	* @param	Either a MapExtent or a Location and zoom (comma separated)
	*
	* @see com.modestmaps.core.TileGrid
	*/
	//public function new(width:Float = 320, height:Float = 240, draggable:Bool = true, mapProvider:IMapProvider = null, ...rest)
	public function new(width:Float = 320, height:Float = 240, draggable:Bool = true, mapProvider:IMapProvider = null, rest:Array<Dynamic> = null)
	{
		if (!mapProvider) mapProvider = new MicrosoftProvider(MicrosoftProvider.ROAD);

		// TODO getter/setter for this that disables interaction in TileGrid
		__draggable = draggable;

		// don't call setMapProvider here
		// the extent calculations are all squirrely
		this.mapProvider = mapProvider;

		// initialize the grid (so point/location/coordinate functions should be valid after this)
		grid = new TileGrid(width, height, draggable, mapProvider);
		grid.addEventListener(Event.CHANGE, onExtentChanged);
		addChild(grid);

		setSize(width, height);
		
		markerClip = new MarkerClip(this);
		addChild(markerClip);

		// if rest was passed in from super constructor in a subclass,
		// it will be an array...
		if (rest && rest.length > 0 && Std.is (rest[0], Array)){
			rest = rest[0];
		}
		// (doing that is OK because none of the arguments we're expecting are Arrays)
		
		// look at ... rest arguments for MapExtent or Location/zoom
		if (rest && rest.length > 0 && Std.is (rest[0], MapExtent)){
			//setExtent(rest[0] as MapExtent);
		}
		else if (rest && rest.length > 1 && Std.is (rest[0], Location) && Std.is (rest[0], Float)) {
			//setCenterZoom(rest[0] as Location, rest[1] as Float);
		}
		else {
			// use the whole world as a default
			var extent:MapExtent = new MapExtent(85, -85, 180, -180);
		
			// but adjust to fit the mapprovider's outer limits if there are any: 
			var l1:Location = mapProvider.coordinateLocation(mapProvider.outerLimits()[0]);
			var l2:Location = mapProvider.coordinateLocation(mapProvider.outerLimits()[1]);

			if (!Math.isNaN(l1.lat) && Math.abs(l1.lat) != Infinity) {
				extent.north = l1.lat;
			}		
			if (!Math.isNaN(l2.lat) && Math.abs(l2.lat) != Infinity) {
				extent.south = l2.lat;
			}		
			if (!Math.isNaN(l1.lon) && Math.abs(l1.lon) != Infinity) {
				extent.west = l1.lon;
			}		
			if (!Math.isNaN(l2.lon) && Math.abs(l2.lon) != Infinity) {
				extent.east = l2.lon;
			}

			setExtent(extent);
		}
		
		//addChild(grid.debugField);
	}

	/**
	* Based on an array of locations, determine appropriate map
	* bounds using calculateMapExtent(), and inform the grid of
	* tile coordinate and point by calling grid.resetTiles().
	* Resulting map extent will ensure that all passed locations
	* are visible.
	*
	* @param extent the minimum area to fit inside the map view
	*
	* @see com.modestmaps.Map#calculateMapExtent
	* @see com.modestmaps.core.TileGrid#resetTiles
	*/
	public function setExtent(extent:MapExtent):Void
	{
		//trace('applying extent', extent);
		onExtentChanging();
		// tell grid what the rock is cooking
		grid.resetTiles(locationsCoordinate( [ extent.northWest, extent.southEast ] ));
		onExtentChanged();
	}

	/**
	* Based on a location and zoom level, determine appropriate initial
	* tile coordinate and point using calculateMapCenter(), and inform
	* the grid of tile coordinate and point by calling grid.resetTiles().
	*
	* @param	Location of center.
	* @param	Desired zoom level.
	*
	* @see com.modestmaps.Map#calculateMapExtent
	* @see com.modestmaps.core.TileGrid#resetTiles
	*/
	public function setCenterZoom(location:Location, zoom:Float):Void
	{
		if (zoom == grid.zoomLevel) {
			setCenter(location);
		}
		else {
			onExtentChanging();
			zoom = Math.min(Math.max(zoom, grid.minZoom), grid.maxZoom);
			// tell grid what the rock is cooking
			grid.resetTiles(mapProvider.locationCoordinate(location).zoomTo(zoom));
			onExtentChanged();
		}
	}
		   
	/**
	 * Based on a zoom level, determine appropriate initial
	 * tile coordinate and point using calculateMapCenter(), and inform
	 * the grid of tile coordinate and point by calling grid.resetTiles().
	 *
	 * @param	Desired zoom level.
	 *
	 * @see com.modestmaps.Map#calculateMapExtent
	 * @see com.modestmaps.core.TileGrid#resetTiles
	 */
	public function setZoom(zoom:Float):Void
	{
		if (zoom != grid.zoomLevel) {
			// TODO: if grid enforces this in enforceBounds, do we need to do it here too?
			grid.zoomLevel = Math.min(Math.max(zoom, grid.minZoom), grid.maxZoom);
		}
	}

	public function extentCoordinate(extent:MapExtent):Coordinate
	{
		return locationsCoordinate([ extent.northWest, extent.southEast ]);
	}
		
	public function locationsCoordinate(locations:Array, fitWidth:Float=0, fitHeight:Float=0):Coordinate
	{
		if (!fitWidth) fitWidth = mapWidth;
		if (!fitHeight) fitHeight = mapHeight;
		
		var TL:Coordinate = mapProvider.locationCoordinate(locations[0].normalize());
		var BR:Coordinate = TL.copy();
		
		// get outermost top left and bottom right coordinates to cover all locations
		for (i in 1...locations.length)
		{
			var coordinate:Coordinate = mapProvider.locationCoordinate(locations[i].normalize());
			TL.row = Math.min(TL.row, coordinate.row);
			TL.column = Math.min(TL.column, coordinate.column);
			TL.zoom = Math.min(TL.zoom, coordinate.zoom);
			BR.row = Math.max(BR.row, coordinate.row);
			BR.column = Math.max(BR.column, coordinate.column);
			BR.zoom = Math.max(BR.zoom, coordinate.zoom);
		}
		
		// multiplication factor between horizontal span and map width
		var hFactor:Float = (BR.column - TL.column) / (fitWidth / mapProvider.tileWidth);
		
		// multiplication factor expressed as base-2 logarithm, for zoom difference
		var hZoomDiff:Float = Math.log(hFactor) / Math.LN2;
		
		// possible horizontal zoom to fit geographical extent in map width
		var hPossibleZoom:Float = TL.zoom - Math.ceil(hZoomDiff);
		
		// multiplication factor between vertical span and map height
		var vFactor:Float = (BR.row - TL.row) / (fitHeight / mapProvider.tileHeight);
		
		// multiplication factor expressed as base-2 logarithm, for zoom difference
		var vZoomDiff:Float = Math.log(vFactor) / Math.LN2;
		
		// possible vertical zoom to fit geographical extent in map height
		var vPossibleZoom:Float = TL.zoom - Math.ceil(vZoomDiff);
		
		// initial zoom to fit extent vertically and horizontally
		// additionally, make sure it's not outside the boundaries set by provider limits
		var initZoom:Float = Math.min(hPossibleZoom, vPossibleZoom);
		initZoom = Math.min(initZoom, mapProvider.outerLimits()[1].zoom);
		initZoom = Math.max(initZoom, mapProvider.outerLimits()[0].zoom);

		// coordinate of extent center
		var centerRow:Float = (TL.row + BR.row) / 2;
		var centerColumn:Float = (TL.column + BR.column) / 2;
		var centerZoom:Float = (TL.zoom + BR.zoom) / 2;
		var centerCoord:Coordinate = (new Coordinate(centerRow, centerColumn, centerZoom)).zoomTo(initZoom);
		
		return centerCoord;
	}

	/**
	* Return a MapExtent for the current map view.
	* TODO: MapExtent needs adapting to deal with non-rectangular map projections
	*
	* @return   MapExtent object
	*/
	function getExtent():MapExtent
	{
		var extent:MapExtent = new MapExtent();
		
		if(!mapProvider) {
			throw new Error("WHOAH, no mapProvider in getExtent!");
		}

		extent.northWest = mapProvider.coordinateLocation(grid.topLeftCoordinate);
		extent.southEast = mapProvider.coordinateLocation(grid.bottomRightCoordinate);
		return extent;
	}

	/**
	* Return the current center location and zoom of the map.
	*
	* @return   Array of center and zoom: [center location, zoom number].
	*/
	public function getCenterZoom():Array
	{
		return [ mapProvider.coordinateLocation(grid.centerCoordinate), grid.zoomLevel ];
	}

	/**
	* Return the current center location of the map.
	*
	* @return center Location
	*/
	public function getCenter():Location
	{
		return mapProvider.coordinateLocation(grid.centerCoordinate);
	}

	/*
	* Return the current zoom level of the map.
	*
	* @return   zoom number
	*/
	function getZoom():Int
	{
		return Math.floor(grid.zoomLevel);
	}

	/**
	* Set new map size, dispatch MapEvent.RESIZED. 
	* The MapEvent includes the newSize.
	*
	* @param w New map width.
	* @param h New map height.
	*
	* @see com.modestmaps.events.MapEvent.RESIZED
	*/
	function setSize(w:Float, h:Float):Void
	{
		if (w != mapWidth || h != mapHeight)
		{
			mapWidth = w;
			mapHeight = h;

			// mask out out of bounds marker remnants
			scrollRect = new Rectangle(0,0,mapWidth,mapHeight);
			
			grid.resizeTo(new Point(mapWidth, mapHeight));
			
			dispatchEvent(new MapEvent(MapEvent.RESIZED, this.getSize()));
		}		
	}

	/**
	* Get map size.
	*
	* @return   Array of [width, height].
	*/
	function getSize():Array
	{
		var size:Array = [mapWidth, mapHeight];
		return size;
	}

	function getSize():Point
	{
		return new Point(mapWidth, mapHeight);
	}
	
	//function set_size(getSize, setSize):Point {
		//
	//}

	//function setSize(value:Point):Void
	//{
		//set_Size(value.x, value.y);
	//}

	/** Get map width. */
	function getWidth():Float
	{
		return mapWidth;
	}

	/** Get map height. */
	function getHeight():Float
	{
		return mapHeight;
	}

	/**
	* Get a reference to the current map provider.
	*
	* @return   Map provider.
	*
	* @see com.modestmaps.mapproviders.IMapProvider
	*/
	function getMapProvider():IMapProvider
	{
		return mapProvider;
	}

	/**
	* Set a new map provider, repainting tiles and changing bounding box if necessary.
	*
	* @param   Map provider.
	*
	* @see com.modestmaps.mapproviders.IMapProvider
	*/
	function setMapProvider(newProvider:IMapProvider):Void
	{
		var previousGeometry:String;
		if (mapProvider)
		{
			previousGeometry = mapProvider.geometry();
		}
		var extent:MapExtent = getExtent();

		mapProvider = newProvider;
		if (grid)
		{
			grid.setMapProvider(mapProvider);
		}
		
		if (mapProvider.geometry() != previousGeometry)
		{
			setExtent(extent);
		}
		
		// among other things this will notify the marker clip that its cached coordinates are invalid
		dispatchEvent(new MapEvent(MapEvent.MAP_PROVIDER_CHANGED, newProvider));
	}

	/**
	* Get a point (x, y) for a location (lat, lon) in the context of a given clip.
	*
	* @param	Location to match.
	* @param	Movie clip context in which returned point should make sense.
	*
	* @return   Matching point.
	*/
	function locationPoint(location:Location, context:DisplayObject=null):Point
	{
		var coord:Coordinate = mapProvider.locationCoordinate(location);
		return grid.coordinatePoint(coord, context);
	}

	/**
	* Get a location (lat, lon) for a point (x, y) in the context of a given clip.
	*
	* @param	Point to match.
	* @param	Movie clip context in which passed point should make sense.
	*
	* @return   Matching location.
	*/
	function pointLocation(point:Point, context:DisplayObject=null):Location
	{
		var coord:Coordinate = grid.pointCoordinate(point, context);
		return mapProvider.coordinateLocation(coord);
	}
		
	/** Pan up by 1/3 (or panFraction) of the map height. */
	function panUp(event:Event=null):Void
	{
		panBy(0, mapHeight*panFraction);
	}	  

	   /** Pan down by 1/3 (or panFraction) of the map height. */
	function panDown(event:Event=null):Void
	{
		panBy(0, -mapHeight*panFraction);
	}

	/** Pan left by 1/3 (or panFraction) of the map width. */	
	function panLeft(event:Event=null):Void
	{
		panBy((mapWidth*panFraction), 0);
	}	  

	/** Pan left by 1/3 (or panFraction) of the map width. */	
	function panRight(event:Event=null):Void
	{
		panBy(-(mapWidth*panFraction), 0);
	}

	function panBy(px:Float, py:Float):Void
	{
		if (!grid.panning && !grid.zooming) {
			grid.prepareForPanning();
			grid.tx += px;
			grid.ty += py;
			grid.donePanning();
		}
	}

	/** zoom in, keeping the requested point in the same place */
	function zoomInAbout(targetPoint:Point=null, duration:Float=-1):Void
	{
		zoomByAbout(1, targetPoint, duration);
	}

	/** zoom out, keeping the requested point in the same place */
	function zoomOutAbout(targetPoint:Point=null, duration:Float=-1):Void
	{
		zoomByAbout(-1, targetPoint, duration);
	}

	/** zoom in or out by zoomDelta, keeping the requested point in the same place */
	function zoomByAbout(zoomDelta:Float, targetPoint:Point=null, duration:Float=-1):Void
	{
		if (!targetPoint) targetPoint = new Point(mapWidth/2, mapHeight/2);		
		
		if (grid.zoomLevel + zoomDelta < grid.minZoom) {
			zoomDelta = grid.minZoom - grid.zoomLevel;		
		}
		else if (grid.zoomLevel + zoomDelta > grid.maxZoom) {
			zoomDelta = grid.maxZoom - grid.zoomLevel; 
		} 
		
		var sc:Float = Math.pow(2, zoomDelta);
		
		grid.prepareForZooming();
		grid.prepareForPanning();
		
		var m:Matrix = grid.getMatrix();
		
		m.translate(-targetPoint.x, -targetPoint.y);
		m.scale(sc, sc);
		m.translate(targetPoint.x, targetPoint.y);	   	
		
		grid.setMatrix(m);

		grid.doneZooming();
		grid.donePanning();
	}

	function getRotation():Float
	{
		var m:Matrix = grid.getMatrix();
		var px:Point = m.deltaTransformPoint(new Point(0, 1));
		return Math.atan2(px.y, px.x);
	}

	/** rotate to angle (radians), keeping the requested point in the same place */
	function setRotation(angle:Float, targetPoint:Point=null):Void
	{
		var rotation:Float = getRotation();
		rotateByAbout(angle - rotation, targetPoint);		
	}

	/** rotate by angle (radians), keeping the requested point in the same place */
	function rotateByAbout(angle:Float, targetPoint:Point=null):Void
	{
		if (!targetPoint) targetPoint = new Point(mapWidth/2, mapHeight/2);		
		
		grid.prepareForZooming();
		grid.prepareForPanning();
		
		var m:Matrix = grid.getMatrix();
		
		m.translate(-targetPoint.x, -targetPoint.y);
		m.rotate(angle);
		m.translate(targetPoint.x, targetPoint.y);	   	
		
		grid.setMatrix(m);

		grid.doneZooming();
		grid.donePanning();
	}	

	/** zoom in and put the given location in the center of the screen, or optionally at the given targetPoint */
	function panAndZoomIn(location:Location, targetPoint:Point=null):Void
	{
		panAndZoomBy(2, location, targetPoint);
	}

	/** zoom out and put the given location in the center of the screen, or optionally at the given targetPoint */	
	function panAndZoomOut(location:Location, targetPoint:Point=null):Void
	{
		panAndZoomBy(0.5, location, targetPoint);
	}

	/** zoom in or out by sc, moving the given location to the requested target */	
	function panAndZoomBy(sc:Float, location:Location, targetPoint:Point=null, duration:Float=-1):Void
	{
		if (!targetPoint) targetPoint = new Point(mapWidth/2, mapHeight/2);
		
		var p:Point = locationPoint(location);
		
		grid.prepareForZooming();
		grid.prepareForPanning();
		
		var m:Matrix = grid.getMatrix();
		
		m.translate(-p.x, -p.y);
		m.scale(sc, sc);
		m.translate(targetPoint.x, targetPoint.y);
		
		grid.setMatrix(m);
		
		grid.donePanning();
		grid.doneZooming();
	}
			
	/** put the given location in the middle of the map */
	function setCenter(location:Location):Void
	{
		onExtentChanging();
		// tell grid what the rock is cooking
		grid.resetTiles(mapProvider.locationCoordinate(location).zoomTo(grid.zoomLevel));
		onExtentChanged();
	}

	/**
	* Zoom in by one zoom level (to 200%) immediately,
	* rounding up to the nearest zoom level if we're currently between zooms.
	*  
	* <p>Triggers MapEvent.START_ZOOMING and MapEvent.STOP_ZOOMING events.</p>
	* 
	* @param event an optional event so that zoomIn can directly function as an event listener.
	*/
	function zoomIn(event:Event=null):Void
	{
		zoomBy(1);
	}

	   /**
	* Zoom out by one zoom level (to 50%) immediately, 
	* rounding down to the nearest zoom level if we're currently between zooms.
	*  
	* <p>Triggers MapEvent.START_ZOOMING and MapEvent.STOP_ZOOMING events.</p>
	* 
	* @param event an optional event so that zoomOut can directly function as an event listener.
	*/
	function zoomOut(event:Event=null):Void
	{
		zoomBy(-1);
	}

	/**
	 * Adds dir to grid.zoomLevel, and rounds up or down to the nearest whole number.
	 * Used internally by zoomIn and zoomOut (keeping it DRY, as they say)
	 * and overridden by TweenMap for animation.
	 * 
	 * <p>grid.zoomLevel calls the grid.scale setter for us 
	 * which will call grid.prepareForZooming if we didn't already 
	 * and grid.doneZooming after modifying the zoom level.</p>
	 * 
	 * <p>Animating/tweening grid.scale fires START_ZOOMING, and STOP_ZOOMING 
	 * MapEvents unless you call grid.prepareForZooming first. Be sure
	 * to also call grid.stopZooming at the end of your animation.
	 *
	 * @param dir the direction of zoom, generally 1 for zooming in, or -1 for zooming out
	 * 
	 */ 
	function zoomBy(dir:Int):Void
	{
		if (!grid.panning) {
			var target:Float = dir < 0 ? Math.floor(grid.zoomLevel+dir) : Math.ceil(grid.zoomLevel+dir);
			grid.zoomLevel = Math.min(Math.max(grid.minZoom, target), grid.maxZoom);
		}
	} 

	/**
	* Add a marker at the given location (lat, lon)
	*
	* @param	Location of marker.
	* @param	optionally, a sprite (where sprite.name=id) that will always be in the right place
	*/
	function putMarker(location:Location, marker:DisplayObject=null):Void
	{
		markerClip.attachMarker(marker, location);
	}

	/**
	 * Get a marker with the given id if one was created.
	 *
	 * @param	ID of marker, opaque string.
	 */
	function getMarker(id:String):DisplayObject
	{
		return markerClip.getMarker(id);
	}

	/**
	* Remove a marker with the given id.
	*
	* @param	ID of marker, opaque string.
	*/
	function removeMarker(id:String):Void
	{
		markerClip.removeMarker(id); // also calls grid.removeMarker
	}

	function removeAllMarkers():Void {
		markerClip.removeAllMarkers();
	}

	/**
	* Dispatches MapEvent.EXTENT_CHANGED when the map is recentered.
	* The MapEvent includes the new extent.
	* 
	* TODO: dispatch this on resize?
	* TODO: should we move Map to com.modestmaps.core so that this could be made internal instead of public?
	*
	* @see com.modestmaps.events.MapEvent.EXTENT_CHANGED
	*/
	function onExtentChanged(event:Event=null):Void
	{
		if (hasEventListener(MapEvent.EXTENT_CHANGED)) {
			dispatchEvent(new MapEvent(MapEvent.EXTENT_CHANGED, getExtent()));
		}
	}

	/**
	* Dispatches MapEvent.BEGIN_EXTENT_CHANGE when the map is about to be resized.
	* The MapEvent includes the current.
	*
	* @see com.modestmaps.events.MapEvent.BEGIN_EXTENT_CHANGE
	*/
	function onExtentChanging():Void
	{
		if (hasEventListener(MapEvent.BEGIN_EXTENT_CHANGE)) {
		dispatchEvent(new MapEvent(MapEvent.BEGIN_EXTENT_CHANGE, getExtent()));
		}
	}

	//override public var doubleClickEnabled(null, setDoubleClickEnabled):Bool;
	
	function setDoubleClickEnabled(enabled:Bool):Void
	{
		super.doubleClickEnabled = enabled;
		trace("doubleClickEnabled on Map is no longer necessary!"); 
		trace("\tto enable useful defaults, use:");
		trace("\tmap.addEventListener(MouseEvent.DOUBLE_CLICK, map.onDoubleClick);");
	}

	/** pans and zooms in on double clicked location */
	function onDoubleClick(event:MouseEvent):Void
	{
		if (!__draggable) return;
		
		var p:Point = grid.globalToLocal(new Point(event.stageX, event.stageY));
		
		if (event.shiftKey) {
			if (grid.zoomLevel > grid.minZoom) {
				zoomOutAbout(p);
			}
			else {
				panBy(mapWidth/2 - p.x, mapHeight/2 - p.y);
			}
		}
		else if (event.ctrlKey) {
			panAndZoomIn(pointLocation(p));
		}
		else {
			if (grid.zoomLevel < grid.maxZoom) {
				zoomInAbout(p);
			}
			else {
				panBy(mapWidth/2 - p.x, mapHeight/2 - p.y);
			}
		}
	}	

	var previousWheelEvent:Float = 0;
	var minMouseWheelInterval:Float = 100;

	function onMouseWheel(event:MouseEvent):Void
	{
		if (getTimer() - previousWheelEvent > minMouseWheelInterval) {
			if (event.delta > 0) {
				zoomInAbout(new Point(mouseX, mouseY), 0);
			}
			else if (event.delta < 0) {
				zoomOutAbout(new Point(mouseX, mouseY), 0);
			}
			previousWheelEvent = getTimer(); 
		}
	}

}