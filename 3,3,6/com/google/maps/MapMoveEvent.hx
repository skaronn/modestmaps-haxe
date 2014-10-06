package com.google.maps;

import flash.events.*;

class MapMoveEvent extends com.google.maps.MapEvent
{
public function new(arg1:String, arg2:com.google.maps.LatLng, arg3:Bool=false, arg4:Bool=false)
{
	super(arg1, null, arg3, arg4);
	this.eventLatLng = arg2;
	return;
}

public function get_latLng():com.google.maps.LatLng
{
	return this.eventLatLng;
}

public override var eventClassChain(getEventClassChain, null):Array<Dynamic>;
 	private function getEventClassChain():Array
{
	return ["MapMoveEvent", "MapEvent"];
}

public override function clone():flash.events.Event
{
	return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapMoveEvent(this.type, this.latLng, this.bubbles, this.cancelable);
}

public override function toString():String
{
	return "[MapMoveEvent type=" + this.type + " latLng=" + this.latLng + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
}

public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Dynamic):com.google.maps.MapMoveEvent
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = arg1 as com.google.maps.MapMoveEvent;
	if (loc1 != null)
	{
	return loc1;
	}
	loc1 = new MapMoveEvent(arg1.type, com.google.maps.LatLng.fromObject(Object(arg1).latLng), arg1.bubbles, arg1.cancelable);
	loc1.copyEventData(arg1, arg2);
	return loc1;
}

public static inline var MOVE_START:String="mapevent_movestart";

public static inline var MOVE_STEP:String="mapevent_movestep";

public static inline var MOVE_END:String="mapevent_moveend";

private var eventLatLng:com.google.maps.LatLng;
}