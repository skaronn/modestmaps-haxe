package com.google.maps.interfaces;

import com.google.maps.*;
import flash.geom.*;

interface IProjection extends com.google.maps.interfaces.IWrappable
{
function getWrapWidth(arg1:Float):Float;

function tileCheckRange(arg1:openfl.geom.Point, arg2:Float, arg3:Float):Bool;

function fromLatLngToPixel(arg1:com.google.maps.LatLng, arg2:Float):openfl.geom.Point;

function fromPixelToLatLng(arg1:openfl.geom.Point, arg2:Float, arg3:Bool=false):com.google.maps.LatLng;
}