package com.google.maps.interfaces;

import com.google.maps.*;
import com.google.maps.overlays.*;

interface IPolyline extends com.google.maps.interfaces.IOverlay
{
function getLength(arg1:Float=6378137):Float;

function setOptions(arg1:com.google.maps.overlays.PolylineOptions):Void;

function getOptions():com.google.maps.overlays.PolylineOptions;

function getVertexCount():Float;

function getVertex(arg1:Float):com.google.maps.LatLng;
}