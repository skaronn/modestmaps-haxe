package com.google.maps.interfaces;

import com.google.maps.*;
import flash.events.*;

interface ICopyrightCollection extends com.google.maps.interfaces.IWrappable extends flash.events.IEventDispatcher
{
	function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Float):Array<Dynamic>;

	function getCopyrightNotice(arg1:com.google.maps.LatLngBounds, arg2:Float):com.google.maps.CopyrightNotice;

	function addCopyright(arg1:com.google.maps.Copyright):Bool;

	function getCopyrightsAtLatLng(arg1:com.google.maps.LatLng):Array<Dynamic>;
}