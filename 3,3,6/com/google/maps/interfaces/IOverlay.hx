package com.google.maps.interfaces;

import flash.events.*;

interface IOverlay extends flash.events.IEventDispatcher extends com.google.maps.interfaces.IWrappable
{
	function hide():Void;

	function remove():Void;

	function initialize(arg1:com.google.maps.interfaces.IMap, arg2:Float=NaN):Void;

	function redraw(arg1:Bool):Void;

	function isHidden():Bool;

	function show():Void;
}