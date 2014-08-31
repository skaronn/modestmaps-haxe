/*
 * $Id$
 */

package com.modestmaps.events;

import flash.events.Event;
import com.modestmaps.geo.Location;

import flash.display.DisplayObject;	
	
class MarkerEvent extends Event
{
	// these are prefixed marker to avoid conflicts with MouseEvent
	public static inline var MARKER_ROLL_OVER:String = 'markerRollOver';
	public static inline var MARKER_ROLL_OUT:String = 'markerRollOut';
	public static inline var MARKER_CLICK:String = 'markerClick';

	private var _marker:DisplayObject;
	private var _location:Location;

	public function new(type:String, marker:DisplayObject, location:Location, bubbles:Bool=true, cancelable:Bool=false)
	{
		super(type, bubbles, cancelable);
		_marker = marker;
		_location = location;
	}

	public var marker(getMarker, null):DisplayObject;
	
	private function getMarker():DisplayObject
	{
		return _marker;
	}

	public var location(getLocation, null):Location;
	
	private function getLocation():Location
	{
		return _location;
	}
}