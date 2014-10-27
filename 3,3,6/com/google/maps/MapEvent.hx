package com.google.maps;

import com.google.maps.interfaces.*;
import com.google.maps.wrappers.*;
import flash.events.*;

class MapEvent extends flash.events.Event
{
	public function new(arg1:String, arg2:Dynamic, arg3:Bool=false, arg4:Bool=false)
	{
		super(arg1, arg3, arg4);
		this.eventFeature = arg2;
		return;
	}

	public override function isDefaultPrevented():Bool
	{
		return this.crossDomainEvent ? this.crossDomainEvent.isDefaultPrevented() : super.isDefaultPrevented();
	}

	public override var eventPhase(getEventPhase, null):UInt;
	
	private function getEventPhase():UInt
	{
		return this.crossDomainEvent ? this.crossDomainEvent.eventPhase : super.eventPhase;
	}

	public override function formatToString(arg1:String, rest:Array<Dynamic>=null):String
	{
		return this.crossDomainEvent ? this.crossDomainEvent.formatToString(arg1, rest) : super.formatToString(arg1, rest);
	}

	public override function preventDefault():Void
	{
		if (this.crossDomainEvent)
		{
			this.crossDomainEvent.preventDefault();
		}
		else 
		{
			super.preventDefault();
		}
		return;
	}

	public override var target(getTarget, null):Dynamic;
	
	private function getTarget():Dynamic
	{
		return this.localTarget ? this.localTarget : super.target;
	}

	public override var cancelable(getCancelable, null):Bool;
	
	private function getCancelable():Bool
	{
		return this.crossDomainEvent ? this.crossDomainEvent.cancelable : super.cancelable;
	}

	public override function clone():flash.events.Event
	{
		return this.crossDomainEvent ? fromCrossDomainEvent(crossDomainEvent.clone(), null) : new com.google.maps.MapEvent(this.type, this.feature, this.bubbles, this.cancelable);
	}

	public var eventClassChain(getEventClassChain, null):Array<Dynamic>;
	
	private function getEventClassChain():Array
	{
		return ["MapEvent"];
	}

	public override var bubbles(getBubbles, null):Bool;
	
	private function getBubbles():Bool
	{
		return this.crossDomainEvent ? this.crossDomainEvent.bubbles : super.bubbles;
	}

	public override function stopPropagation():Void
	{
		if (this.crossDomainEvent)
		{
			this.crossDomainEvent.stopPropagation();
		}
		else 
		{
			super.stopPropagation();
		}
		return;
	}

	public override function toString():String
	{
		return "[MapEvent type=" + this.type + " feature=" + this.feature + " bubbles=" + this.bubbles + " cancellable=" + this.cancelable + "]";
	}

	private function copyEventData(arg1:flash.events.Event, arg2:Dynamic):Void
	{
		this.crossDomainEvent = arg1;
		this.localTarget = arg2;
		return;
	}

	public override var currentTarget(getCurrentTarget, null):Dynamic;
	
	private function getCurrentTarget():Dynamic
	{
		return this.crossDomainEvent ? this.crossDomainEvent.currentTarget : super.currentTarget;
	}

	public var feature(getFeature, null):Dynamic;
	
	private function getFeature():Dynamic
	{
		return this.eventFeature;
	}

	public override var type(getType, null):String;
	
	private function getType():String
	{
		return this.crossDomainEvent ? this.crossDomainEvent.type : super.type;
	}

	public override function stopImmediatePropagation():Void
	{
		if (this.crossDomainEvent)
		{
			this.crossDomainEvent.stopImmediatePropagation();
		}
		else 
		{
			super.stopImmediatePropagation();
		}
		return;
	}

	private static function wrapFeature(arg1:Dynamic):Dynamic
	{
		return arg1 == null ? null : com.google.maps.wrappers.Wrapper.instance().wrap(arg1, null, com.google.maps.interfaces.IWrappable, Object);
	}

	public static function fromCrossDomainEvent(arg1:flash.events.Event, arg2:Dynamic):com.google.maps.MapEvent
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = arg1 as com.google.maps.MapEvent;
		if (loc1 != null)
		{
			return loc1;
		}
		loc1 = new MapEvent(arg1.type, wrapFeature(getEventFeature(arg1)), arg1.bubbles, arg1.cancelable);
		loc1.copyEventData(arg1, arg2);
		return loc1;
	}

	public static function getEventFeature(arg1:flash.events.Event):Dynamic
	{
		return Object(arg1).feature;
	}

	public static inline var MAP_READY:String="mapevent_mapready";

	public static inline var OVERLAY_CHANGED:String="mapevent_overlaychanged";

	public static inline var MAPTYPE_CHANGED:String="maptypechanged";

	public static inline var OVERLAY_ADDED:String="mapevent_overlayadded";

	public static inline var SIZE_CHANGED:String="mapevent_sizechanged";

	public static inline var MAPTYPE_ADDED:String="mapevent_maptypeadded";

	public static inline var MAP_READY_INTERNAL:String="readyinternal";

	public static inline var CONTROL_ADDED:String="mapevent_controladded";

	public static inline var VISIBILITY_CHANGED:String="mapevent_visibilitychanged";

	public static inline var COPYRIGHTS_UPDATED:String="mapevent_copyrightsupdated";

	public static inline var INFOWINDOW_OPENED:String="mapevent_infowindowopened";

	public static inline var INFOWINDOW_CLOSED:String="mapevent_infowindowclosed";

	public static inline var OVERLAY_REMOVED:String="mapevent_overlayremoved";

	public static inline var INFOWINDOW_CLOSING:String="mapevent_infowindowclosing";

	public static inline var MAPTYPE_REMOVED:String="mapevent_maptyperemoved";

	public static inline var OVERLAY_ANIMATE_END:String="mapevent_overlayanimateend";

	public static inline var CONTROL_REMOVED:String="mapevent_controlremoved";

	private var crossDomainEvent:flash.events.Event;

	private var localTarget:Dynamic;

	private var eventFeature:Dynamic;
}