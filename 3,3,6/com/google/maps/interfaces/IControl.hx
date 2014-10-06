package com.google.maps.interfaces;

import com.google.maps.controls.*;
import flash.display.*;
import flash.events.*;
import flash.geom.*;

interface IControl extends flash.events.IEventDispatcher extends com.google.maps.interfaces.IWrappable
{
	function setControlPosition(arg1:com.google.maps.controls.ControlPosition):Void;

	function initControlWithMap(arg1:com.google.maps.interfaces.IMap):Void;

	function getDisplayObject():flash.display.DisplayObject;

	function getControlPosition():com.google.maps.controls.ControlPosition;

	function getSize():openfl.geom.Point;
}