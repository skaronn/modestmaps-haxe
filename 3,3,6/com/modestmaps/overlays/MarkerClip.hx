package com.modestmaps.overlays;

import com.modestmaps.Map;
import com.modestmaps.core.Coordinate;
import com.modestmaps.events.MapEvent;
import com.modestmaps.events.MarkerEvent;
import com.modestmaps.geo.Location;
import com.modestmaps.mapproviders.IMapProvider;
import com.modestmaps.util.DebugUtil;
import haxe.Timer;

import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.utils.Object;
import haxe.ds.ObjectMap;

@:meta(Event(name="markerRollOver",	type="com.modestmaps.events.MarkerEvent"))
@:meta(Event(name="markerRollOut",	 type="com.modestmaps.events.MarkerEvent"))
@:meta(Event(name="markerClick",	   type="com.modestmaps.events.MarkerEvent"))
class MarkerClip extends Sprite
{
	public static inline var DEFAULT_ZOOM_TOLERANCE:Int = 4;

	private var map:Map;

	private var drawCoord:Coordinate;
	private var locations:ObjectMap<DisplayObject, Location> = new ObjectMap<DisplayObject, Location>();
	private var coordinates:ObjectMap<DisplayObject, Coordinate> = new ObjectMap<DisplayObject, Coordinate>();
	private var markers:Array<Object> = new Array<Object>(); // all markers
	private var markersByName:Object = {};

	/** enable this if you want intermediate zooming steps to
	 * stretch your graphics instead of reprojecting the points
	 * it's useful for polygons, but for points 
	 * it looks worse and probably isn't faster, but there it is :) */
	public var scaleZoom:Bool = false;

	/** if autoCache is true, we turn on cacheAsBitmap while panning, but off while zooming */
	public var autoCache:Bool = true;

	/** if scaleZoom is true, this is how many zoom levels you
	 * can zoom by before things will be reprojected regardless */
	public var zoomTolerance:Float = DEFAULT_ZOOM_TOLERANCE; 

	// enable this if you want marker locations snapped to pixels
	public var snapToPixels:Bool = false;

	// the function used to sort the markers array before re-ordering them
	// on the z plane (by child index)
	public var markerSortFunction:Object = sortMarkersByYPosition;

	// the projection of the current map's provider
	// if this changes we need to recache coordinates
	private var previousGeometry:String;

	// setting this.dirty = true will redraw an MapEvent.RENDERED
	private var _dirty:Bool;

	/**
	 * This is the function provided to markers.sort() in order to determine which
	 * markers should go in front of the others. The default behavior is to place
	 * markers further down on the screen (with higher y values) frontmost. You
	 * can modify this behavior by specifying a different value for
	 * MarkerClip.markerSortFunction
	 */
	public static function sortMarkersByYPosition(a:DisplayObject, b:DisplayObject):Int
	{
		var diffY:Float = a.y - b.y;
		return (diffY > 0) ? 1 : (diffY < 0) ? -1 : 0;
	}

	public function new(map:Map)
	{
		super();
		// client code can listen to mouse events on this clip
		// to get all events bubbled up from the markers
		buttonMode = false;
		mouseEnabled = false;
		mouseChildren = true;
			
		this.map = map;
		this.x = map.getWidth() / 2;
		this.y = map.getHeight() / 2;
		
		previousGeometry = map.getMapProvider().geometry();

		map.addEventListener(MapEvent.START_ZOOMING, onMapStartZooming);
		map.addEventListener(MapEvent.STOP_ZOOMING, onMapStopZooming);
		map.addEventListener(MapEvent.ZOOMED_BY, onMapZoomedBy);
		map.addEventListener(MapEvent.START_PANNING, onMapStartPanning);
		map.addEventListener(MapEvent.STOP_PANNING, onMapStopPanning);
		map.addEventListener(MapEvent.PANNED, onMapPanned);
		map.addEventListener(MapEvent.RESIZED, onMapResized);
		map.addEventListener(MapEvent.EXTENT_CHANGED, onMapExtentChanged);
		map.addEventListener(MapEvent.RENDERED, updateClips);
		map.addEventListener(MapEvent.MAP_PROVIDER_CHANGED, onMapProviderChanged);

		// these were previously in Map, but now MarkerEvents bubble it makes more sense to have them here
		addEventListener(MouseEvent.CLICK, onMarkerClick);
		addEventListener(MouseEvent.ROLL_OVER, onMarkerRollOver, true);	
		addEventListener(MouseEvent.ROLL_OUT, onMarkerRollOut, true);
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function getMarkerCount():Int
	{
		return markers.length;
	}
	
	private var _absciss: Float;

	public var absciss(null, set):Float;
	
	private function set_absciss(value:Float):Float
	{
		super.x = snapToPixels ? Math.round(value) : value;
		_absciss = super.x;
		DebugUtil.dumpStack(this, "set_absciss : "+_absciss);
		return _absciss;
	}
	
	private var _ordinate: Float;

	public var ordinate(null, set):Float;
	
	private function set_ordinate(value:Float):Float
	{
		super.y = snapToPixels ? Math.round(value) : value;
		_ordinate = super.y;
		DebugUtil.dumpStack(this, "set_ordinate : "+_ordinate);
		return _ordinate;
	}

	private function onAddedToStage(event:Event):Void
	{		
		dirty = true;
		updateClips();
		
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);		
	}

	private function onRemovedFromStage(event:Event):Void
	{		
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	public function attachMarker(marker:DisplayObject, location:Location):Void
	{
		if (markers.indexOf(marker) == -1)
		{
			locations.set(marker, location.clone());
			coordinates.set(marker, map.getMapProvider().locationCoordinate(location));
			Reflect.setField(markersByName, marker.name, marker);
			markers.push(marker);
			//trace("attachMarker - marker : "+ marker);
			var added:Bool = updateClip(marker);
			
			if (added) {
				requestSort(true);
			}
		}
	}

	private function markerInBounds(marker:DisplayObject, w:Float, h:Float):Bool
	{
		return marker.x > -w / 2 && marker.x < w / 2 && 
		marker.y > -h / 2 && marker.y < h / 2;
	}

	public function getMarker(id:String):DisplayObject
	{
		return cast(markersByName.get(id), DisplayObject);
	}

	public function getMarkerLocation( marker:DisplayObject ) : Location {
		return cast(locations.get(marker), Location);
	}

	public function hasMarker(marker:DisplayObject):Bool
	{
		return markers.indexOf(marker) != -1;
	}

	public function setMarkerLocation(marker:DisplayObject, location:Location):Void
	{
		locations.set(marker, new Location(location.lat, location.lon));
		coordinates.set(marker, map.getMapProvider().locationCoordinate(location));
		sortMarkers();
		dirty = true;
	}

	public function removeMarker(id:String):Void
	{
		var marker:DisplayObject = getMarker(id);
		if (marker!=null)
		{
			removeMarkerObject(marker);
		}
	}

	public function removeMarkerObject(marker:DisplayObject):Void
	{
		if (this.contains(marker)) {
			removeChild(marker);
		}
		
		var index:Int = markers.indexOf(marker);
		
		if (index >= 0) {
			markers.splice(index, 1);
		}

		locations.remove(marker);
		coordinates.remove(marker);
		markersByName.remove(marker.name);
	}

	/**
	* 
	* removeAllMarkers was implemented on trunk
	* meanwhile clearMarkers arrived in the tweening branch
	* let's go with the body from clearMarkers because it's shorter
	*/	
	public function removeAllMarkers():Void
	{
		while (markers.length > 0) {
			var marker:DisplayObject = markers.pop();
			removeMarkerObject(marker);
		}
	}
		
	public function updateClips(event:Event=null):Void
	{
		if (!dirty) {
			return;
		}
		
		var center:Coordinate = map.grid.centerCoordinate;
		
		if (center.equalTo(drawCoord)) {
			dirty = false;
			return;
		}
		
		drawCoord = center.copy();
		
		this.absciss = map.getWidth() / 2;
		this.ordinate = map.getHeight() / 2;		
		
		if (scaleZoom) {
			scaleX = scaleY = 1.0;
		}		
		
		var doSort:Bool = false;
		
		var marker:DisplayObject;		
		for (markerField in markers)
		{
			marker = cast(markerField, DisplayObject);
			var boolUpdateClip : Bool = updateClip(marker);
			doSort = boolUpdateClip ? boolUpdateClip : doSort; // wow! bad things did happen when this said doSort ||= updateClip(marker);
		}

		if (doSort) {
			requestSort(true); 
		}
		
		dirty = false;
	}

	/** 
	* call this if you've made a change to the underlying map geometry such that
	* provider.locationCoordinate(location) will return a different coordinate 
	**/
	public function resetCoordinates():Void
	{
		var provider:IMapProvider = map.getMapProvider();
		// I wish Array.map didn't require three parameters!
		var marker:DisplayObject;		
		for (markerField in markers)
		{
			marker = cast(markerField, DisplayObject);
			coordinates.set(marker, provider.locationCoordinate(locations.get(marker)));
		}
		dirty = true;
	}

	private var sortTimer:Timer;

	private function requestSort(updateOrder:Bool=false):Void
	{
		// use a timer so we don't do this every single frame, otherwise
		// sorting markers and applying depths pretty much doubles the 
		// time to run updateClips
		if (sortTimer != null)
		{
			sortTimer.stop();
			sortTimer = null;
		}	
		sortTimer = haxe.Timer.delay(function () { sortMarkers(updateOrder); }, 50);
	}	

	public function sortMarkers(updateOrder:Bool=false):Void
	{
		// only sort if we have a function:		
		if (updateOrder && markerSortFunction != null)
		{
			//markers.sort(markerSortFunction, Array.NUMERIC);
			markers.sort(markerSortFunction);
		}
		// apply depths to maintain the order things were added in
		var index:Int = 0;
		
		var marker:DisplayObject;		
		for (markerField in markers)
		{
			marker = cast(markerField, DisplayObject);
			if (contains(marker))
			{
				setChildIndex(marker, Std.int(Math.min(index, numChildren - 1)));
				index++;
			}
		}
	}

	/** 
	 * returns true if the marker was added to the stage, so that updateClips or attachMarker can sort the markers
	 */ 
	public function updateClip(marker:DisplayObject):Bool
	{
		if (marker.visible)
		{
			// this method previously used the location of the marker
			// but map.locationPoint hands off to grid to grid.coordinatePoint
			// in the end so we may as well cache the first step
			var point:Point = map.grid.coordinatePoint(cast(coordinates.get(marker), Coordinate), this);
			//trace("updateClip - point : "+point);
			marker.x = snapToPixels ? Math.round(point.x) : point.x;
			marker.y = snapToPixels ? Math.round(point.y) : point.y;

			var w:Float = map.getWidth() * 2;
			var h:Float = map.getHeight() * 2;
			
			if (markerInBounds(marker, w, h))
			{
				trace("updateClip - marker.markerInBounds");
				if (!contains(marker))
				{
					trace("updateClip - marker : "+ marker);
					addChild(marker);
					// notify the caller that we've added something and need to sort markers
					return true;
				}
			}
			else if (contains(marker))
			{
				removeChild(marker);
				// only need to sort if we've added something
				return false;
			}
		}
		
		return false;		
	}

	///// Events....

	private function onMapExtentChanged(event:MapEvent):Void
	{
		dirty = true;		
	}

	private function onMapPanned(event:MapEvent):Void
	{
		if (drawCoord != null) {
			var p:Point = map.grid.coordinatePoint(drawCoord);
			this.x = p.x;
			this.y = p.y;
		}
		else {
			dirty = true;
		}
	}

	private function onMapZoomedBy(event:MapEvent):Void
	{
		if (autoCache) cacheAsBitmap = false;
		if (scaleZoom && drawCoord != null)
		{
			if (Math.abs(map.grid.zoomLevel - drawCoord.zoom) < zoomTolerance)
			{
				scaleX = scaleY = Math.pow(2, map.grid.zoomLevel - drawCoord.zoom);
			}
			else {
				dirty = true;	
			}
		}
		else { 
			dirty = true;
		}
	}

	private function onMapStartPanning(event:MapEvent):Void
	{
		// optimistically, we set this to true in case we're just moving
		if (autoCache) cacheAsBitmap = true;
	}

	private function onMapStartZooming(event:MapEvent):Void
	{
		// overrule onMapStartPanning if there's scaling involved
		if (autoCache) cacheAsBitmap = false;
	}

	private function onMapStopPanning(event:MapEvent):Void
	{
		// tidy up
		if (autoCache) cacheAsBitmap = false;
		dirty = true;
	}

	private function onMapStopZooming(event:MapEvent):Void
	{
		dirty = true;
	}

	private function onMapResized(event:MapEvent):Void
	{
		x = map.getWidth() / 2;
		y = map.getHeight() / 2;
		dirty = true;
		updateClips(); // force redraw because flash seems stingy about it
	}

	private function onMapProviderChanged(event:MapEvent):Void
	{
		var mapProvider:IMapProvider = map.getMapProvider();	
		if (mapProvider.geometry() != previousGeometry)
		{
			resetCoordinates();
			previousGeometry = mapProvider.geometry();
		}
	}

	///// Invalidations...

	private var dirty(get, set):Bool;
	
	private function set_dirty(d:Bool)
	{
		_dirty = d;
		if (d) {
			if (stage != null) stage.invalidate();
		}
		return _dirty;
	}
	
	private function get_dirty():Bool
	{
		return _dirty;
	}

	////// Marker Events...

	/**
	* Dispatches MarkerEvent.CLICK when a marker is clicked.
	* 
	* The MarkerEvent includes a reference to the marker and its location.
	*
	* @see com.modestmaps.events.MarkerEvent.MARKER_CLICK
	*/
	private function onMarkerClick(event:MouseEvent):Void
	{
		var marker:DisplayObject = cast(event.target ,DisplayObject);
		var location:Location = getMarkerLocation(marker);
		dispatchEvent(new MarkerEvent(MarkerEvent.MARKER_CLICK, marker, location, true));
	}

	/**
	* Dispatches MarkerEvent.ROLL_OVER
	* 
	* The MarkerEvent includes a reference to the marker and its location.
	*
	* @see com.modestmaps.events.MarkerEvent.MARKER_ROLL_OVER
	*/
	private function onMarkerRollOver(event:MouseEvent):Void
	{
		var marker:DisplayObject = cast(event.target, DisplayObject);
		var location:Location = getMarkerLocation(marker);
		dispatchEvent(new MarkerEvent(MarkerEvent.MARKER_ROLL_OVER, marker, location, true));
	}

	/**
	* Dispatches MarkerEvent.ROLL_OUT
	* 
	* The MarkerEvent includes a reference to the marker and its location.
	*
	* @see com.modestmaps.events.MarkerEvent.MARKER_ROLL_OUT
	*/
	private function onMarkerRollOut(event:MouseEvent):Void
	{
		var marker:DisplayObject = cast(event.target, DisplayObject);
		var location:Location = getMarkerLocation(marker);
		dispatchEvent(new MarkerEvent(MarkerEvent.MARKER_ROLL_OUT, marker, location, true));
	}	
}