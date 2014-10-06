package com.google.maps.interfaces;

import com.google.maps.*;
import flash.events.*;
import flash.geom.*;

interface IMapType extends com.google.maps.interfaces.IWrappable extends flash.events.IEventDispatcher
{
	function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Float):Array<Dynamic>;

	function getProjection():com.google.maps.interfaces.IProjection;

	function getTileSize():Float;

	function getTileLayers():Array<Dynamic>;

	function getRadius():Float;

	function getName(arg1:Bool=false):String;

	function getSpanZoomLevel(arg1:com.google.maps.LatLng, arg2:com.google.maps.LatLng, arg3:openfl.geom.Point):Float;

	function getLinkColor():Float;

	function getErrorMessage():String;

	function getTextColor():Float;

	function getUrlArg():String;

	function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds, arg2:openfl.geom.Point):Float;

	function setMaxResolutionOverride(arg1:Float):Void;

	function getMinimumResolution(arg1:com.google.maps.LatLng=null):Float;

	function getMaxResolutionOverride():Float;

	function getAlt():String;

	function getMaximumResolution(arg1:com.google.maps.LatLng=null):Float;
}