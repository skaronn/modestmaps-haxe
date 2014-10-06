package com.google.maps;

import flash.events.*;

class MapZoomEvent extends com.google.maps.MapEvent
{
public function new(arg1:String, arg2:Float, arg3:Bool=false, arg4:Bool=false)
{
	super(arg1, null, arg3, arg4);
	this.eventZoomLevel = arg2;
	return;
}

public override function clone():flash.events.Event
{
	return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapZoomEvent(this.type, this.zoomLevel, this.bubbles, this.cancelable);
}

public override var eventClassChain(getEventClassChain, null):Array<Dynamic>;
 	private function getEventClassChain():Array
{
	return ["MapZoomEvent", "MapEvent"];
}

public var zoomLevel(getZoomLevel, null):Float;
 	private function getZoomLevel():Float
{
	return this.eventZoomLevel;
}

public override function toString():String
{
	return "[MapZoomEvent type=" + this.type + " zoomLevel=" + this.zoomLevel + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
}

public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Dynamic):com.google.maps.MapZoomEvent
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = arg1 as com.google.maps.MapZoomEvent;
	if (loc1 != null)
	{
	return loc1;
	}
	loc1 = new MapZoomEvent(arg1.type, Object(arg1).zoomLevel, arg1.bubbles, arg1.cancelable);
	loc1.copyEventData(arg1, arg2);
	return loc1;
}

public static inline var ZOOM_RANGE_CHANGED:String="mapevent_zoomrangechanged";

public static inline var ZOOM_STEP:String="mapevent_zoomstep";

public static inline var ZOOM_START:String="mapevent_zoomstart";

public static inline var ZOOM_END:String="mapevent_zoomend";

private var eventZoomLevel:Float;
}