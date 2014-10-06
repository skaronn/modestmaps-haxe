package com.google.maps.interfaces;

import com.google.maps.*;
import com.google.maps.overlays.*;

interface IPolygon extends com.google.maps.interfaces.IOverlay
{
function getOuterVertex(arg1:Float):com.google.maps.LatLng;

function getInnerVertexCount(arg1:Float):Float;

function getOuterVertexCount():Float;

function setOptions(arg1:com.google.maps.overlays.PolygonOptions):Void;

function getInnerVertex(arg1:Float, arg2:Float):com.google.maps.LatLng;

function getOptions():com.google.maps.overlays.PolygonOptions;

function getInnerPolylineCount():Float;
}