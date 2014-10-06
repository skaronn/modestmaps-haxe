package com.google.maps.interfaces;

import com.google.maps.*;
import com.google.maps.controls.*;
import flash.display.*;
import flash.events.*;
import flash.geom.*;

interface IMap extends flash.events.IEventDispatcher extends com.google.maps.interfaces.IWrappable
{
	function scrollWheelZoomEnabled():Bool;

	function setSize(arg1:openfl.geom.Point):Void;

	function disableContinuousZoom():Void;

	function setMapType(arg1:com.google.maps.interfaces.IMapType):Void;

	function monitorCopyright(arg1:com.google.maps.interfaces.IMap):Void;

	function fromPointToLatLng(arg1:openfl.geom.Point, arg2:Float=NaN, arg3:Bool=false):com.google.maps.LatLng;

	function clearOverlays():Void;

	function removeMapType(arg1:com.google.maps.interfaces.IMapType):Void;

	function draggingEnabled():Bool;

	function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds):Float;

	function registerOverlayOnPane(arg1:Float, arg2:com.google.maps.interfaces.IOverlay):flash.display.Sprite;

	function getImplementationVersion():String;

	function openInfoWindow(arg1:com.google.maps.LatLng, arg2:com.google.maps.InfoWindowOptions=null):com.google.maps.interfaces.IInfoWindow;

	function removeOverlay(arg1:com.google.maps.interfaces.IOverlay):Void;

	function getMinZoomLevel(arg1:com.google.maps.interfaces.IMapType=null, arg2:com.google.maps.LatLng=null):Float;

	function removeControl(arg1:com.google.maps.interfaces.IControl):Void;

	function getProjection():com.google.maps.interfaces.IProjection;

	function savePosition():Void;

	function getZoom():Float;

	function getCenter():com.google.maps.LatLng;

	function loadResourceString(arg1:String):String;

	function isLoaded():Bool;

	function getLatLngBounds():com.google.maps.LatLngBounds;

	function returnToSavedPosition():Void;

	function addMapType(arg1:com.google.maps.interfaces.IMapType):Void;

	function placeControl(arg1:com.google.maps.interfaces.IControl, arg2:com.google.maps.controls.ControlPosition):Void;

	function setCenter(arg1:com.google.maps.LatLng, arg2:Float=NaN, arg3:com.google.maps.interfaces.IMapType=null):Void;

	function zoomIn(arg1:com.google.maps.LatLng=null, arg2:Bool=false, arg3:Bool=false):Void;

	function panBy(arg1:openfl.geom.Point):Void;

	function setZoom(arg1:Float):Void;

	function closeInfoWindow():Bool;

	function disableDragging():Void;

	function continuousZoomEnabled():Bool;

	function fromViewPortPointToLatLng(arg1:openfl.geom.Point, arg2:Bool=false):com.google.maps.LatLng;

	function getMaxZoomLevel(arg1:com.google.maps.interfaces.IMapType=null, arg2:com.google.maps.LatLng=null):Float;

	function enableContinuousZoom():Void;

	function displayHint(arg1:String):Void;

	function getDisplayObject():flash.display.DisplayObject;

	function fromLatLngToPoint(arg1:com.google.maps.LatLng, arg2:Float=NaN):openfl.geom.Point;

	function getMercatorProjection():com.google.maps.interfaces.IProjection;

	function enableDragging():Void;

	function getMapTypes():Array<Dynamic>;

	function addOverlay(arg1:com.google.maps.interfaces.IOverlay):Void;

	function getSize():openfl.geom.Point;

	function panTo(arg1:com.google.maps.LatLng):Void;

	function disableScrollWheelZoom():Void;

	function getCurrentMapType():com.google.maps.interfaces.IMapType;

	function zoomOut(arg1:com.google.maps.LatLng=null, arg2:Bool=false):Void;

	function addControl(arg1:com.google.maps.interfaces.IControl):Void;

	function enableScrollWheelZoom():Void;
}