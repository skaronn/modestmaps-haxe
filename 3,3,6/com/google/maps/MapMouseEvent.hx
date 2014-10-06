package com.google.maps;

import flash.events.*;

class MapMouseEvent extends com.google.maps.MapEvent
{
public function new(arg1:String, arg2:Dynamic, arg3:com.google.maps.LatLng, arg4:Bool=false, arg5:Bool=false)
{
	super(arg1, arg2, arg4, arg5);
	this.eventLatLng = arg3;
	return;
}

public function get_latLng():com.google.maps.LatLng
{
	return this.eventLatLng;
}

public override var eventClassChain(getEventClassChain, null):Array<Dynamic>;
 	private function getEventClassChain():Array
{
	return ["MapMouseEvent", "MapEvent"];
}

public override function clone():flash.events.Event
{
	return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapMouseEvent(this.type, this.feature, this.latLng, this.bubbles, this.cancelable);
}

public override function toString():String
{
	return "[MapMouseEvent type=" + this.type + " feature=" + this.feature + " latLng=" + this.latLng + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
}

public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Dynamic):com.google.maps.MapMouseEvent
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = arg1 as com.google.maps.MapMouseEvent;
	if (loc1 != null)
	{
	return loc1;
	}
	loc1 = new MapMouseEvent(arg1.type, wrapFeature(Object(arg1).feature), com.google.maps.LatLng.fromObject(Object(arg1).latLng), arg1.bubbles, arg1.cancelable);
	loc1.copyEventData(arg1, arg2);
	return loc1;
}

public static inline var MOUSE_UP:String="mapevent_mouseup";

public static inline var CLICK:String="mapevent_click";

public static inline var MOUSE_MOVE:String="mapevent_mousemove";

public static inline var ROLL_OUT:String="mapevent_rollout";

public static inline var DRAG_START:String="mapevent_dragstart";

public static inline var DOUBLE_CLICK:String="mapevent_doubleclick";

public static inline var MOUSE_DOWN:String="mapevent_mousedown";

public static inline var ROLL_OVER:String="mapevent_rollover";

public static inline var DRAG_STEP:String="mapevent_dragstep";

public static inline var DRAG_END:String="mapevent_dragend";

private var eventLatLng:com.google.maps.LatLng;
}