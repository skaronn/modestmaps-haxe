package com.google.maps.interfaces;

import com.google.maps.*;
import com.google.maps.controls.*;
import com.google.maps.overlays.*;
import flash.display.*;
import flash.events.*;

interface IMapsFactory extends com.google.maps.interfaces.IWrappable
{
function createMap(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher):Dynamic;

function setDefaultGroundOverlayOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):Void;

function setDefaultMarkerOptions(arg1:com.google.maps.overlays.MarkerOptions):Void;

function createPolygonFromEncoded(arg1:Array<Dynamic>, arg2:com.google.maps.overlays.PolygonOptions=null):Dynamic;

function setDefaultInfoWindowOptions(arg1:com.google.maps.InfoWindowOptions):Void;

function createOverviewMapControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.OverviewMapControlOptions=null):Dynamic;

function createPolylineFromEncoded(arg1:String, arg2:Float, arg3:String, arg4:Float, arg5:com.google.maps.overlays.PolylineOptions=null):Dynamic;

function createPositionControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.PositionControlOptions=null):Dynamic;

function createMapType(arg1:Array<Dynamic>, arg2:com.google.maps.interfaces.IProjection, arg3:String, arg4:com.google.maps.MapTypeOptions=null):Dynamic;

function createPolyline(arg1:Array<Dynamic>, arg2:com.google.maps.overlays.PolylineOptions=null):Dynamic;

function createMarker(arg1:com.google.maps.LatLng, arg2:com.google.maps.overlays.MarkerOptions=null):Dynamic;

function createPolygon(arg1:Array<Dynamic>, arg2:com.google.maps.overlays.PolygonOptions=null):Dynamic;

function getDefaultGroundOverlayOptions():com.google.maps.overlays.GroundOverlayOptions;

function createMapTypeControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.MapTypeControlOptions=null):Dynamic;

function setDefaultMapTypeOptions(arg1:com.google.maps.MapTypeOptions):Void;

function createCopyrightCollection(arg1:String=null):Dynamic;

function setDefaultPolygonOptions(arg1:com.google.maps.overlays.PolygonOptions):Void;

function getDefaultMapType(arg1:String):Dynamic;

function getDefaultMapTypesList():Dynamic;

function createZoomControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.ZoomControlOptions=null):Dynamic;

function getDefaultPolygonOptions():com.google.maps.overlays.PolygonOptions;

function getDefaultMapTypeOptions():com.google.maps.MapTypeOptions;

function createGroundOverlay(arg1:flash.display.DisplayObject, arg2:com.google.maps.LatLngBounds, arg3:com.google.maps.overlays.GroundOverlayOptions=null):Dynamic;

function getDefaultInfoWindowOptions():com.google.maps.InfoWindowOptions;

function getDefaultMarkerOptions():com.google.maps.overlays.MarkerOptions;

function getDefaultPolylineOptions():com.google.maps.overlays.PolylineOptions;

function createClientGeocoder(arg1:String=null, arg2:com.google.maps.LatLngBounds=null):Dynamic;

function setDefaultPolylineOptions(arg1:com.google.maps.overlays.PolylineOptions):Void;
}