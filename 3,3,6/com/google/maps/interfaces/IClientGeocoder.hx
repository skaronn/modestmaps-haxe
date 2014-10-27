package com.google.maps.interfaces;

import com.google.maps.*;
import flash.events.*;

interface IClientGeocoder extends com.google.maps.interfaces.IWrappable implements flash.events.IEventDispatcher
{
	function getViewport():com.google.maps.LatLngBounds;

	function getBaseCountryCode():String;

	function setViewport(arg1:com.google.maps.LatLngBounds):Void;

	function setBaseCountryCode(arg1:String):Void;

	function resetCache():Void;

	function geocode(arg1:String):Void;
}