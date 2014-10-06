package com.google.maps.interfaces;

import flash.display.*;
import flash.geom.*;

interface ITileLayer extends com.google.maps.interfaces.IWrappable
{
	function getMapType():com.google.maps.interfaces.IMapType;

	function getMinResolution():Float;

	function getAlpha():Float;

	function loadTile(arg1:openfl.geom.Point, arg2:Float):flash.display.DisplayObject;

	function getCopyrightCollection():com.google.maps.interfaces.ICopyrightCollection;

	function getMaxResolution():Float;

	function setMapType(arg1:com.google.maps.interfaces.IMapType):Void;
}