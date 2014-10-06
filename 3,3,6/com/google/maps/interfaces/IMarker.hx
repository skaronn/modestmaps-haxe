package com.google.maps.interfaces;

import com.google.maps.*;
import com.google.maps.overlays.*;

interface IMarker extends com.google.maps.interfaces.IOverlay
{
function setOptions(arg1:com.google.maps.overlays.MarkerOptions):Void;

function getLatLng():com.google.maps.LatLng;

function setLatLng(arg1:com.google.maps.LatLng):Void;

function openInfoWindow(arg1:com.google.maps.InfoWindowOptions=null):com.google.maps.interfaces.IInfoWindow;

function getOptions():com.google.maps.overlays.MarkerOptions;

function closeInfoWindow():Void;
}