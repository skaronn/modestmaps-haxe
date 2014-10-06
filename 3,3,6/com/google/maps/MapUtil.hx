package com.google.maps;

class MapUtil 
{
public function new()
{
	super();
	return;
}

public static function radiansToDegrees(arg1:Float):Float
{
	return arg1 / (Math.PI / 180);
}

public static function copyObject(arg1:Dynamic, arg2:Dynamic):Void
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = 0;
	var loc3:Dynamic;
	loc3 = arg2;
	for (loc1 in loc3)
	{
	arg1[loc1] = arg2[loc1];
	}
	return;
}

public static function wrapHalfOpen(arg1:Float, arg2:Float, arg3:Float):Float
{
	while (arg1 >= arg3) 
	{
	arg1 = arg1 - (arg3 - arg2);
	}
	while (arg1 < arg2) 
	{
	arg1 = arg1 + arg3 - arg2;
	}
	return arg1;
}

public static function approxEquals(arg1:Float, arg2:Float, arg3:Float=1e-009):Bool
{
	return Math.abs(arg1 - arg2) <= arg3;
}

public static function wrap(arg1:Float, arg2:Float, arg3:Float):Float
{
	while (arg1 > arg3) 
	{
	arg1 = arg1 - (arg3 - arg2);
	}
	while (arg1 < arg2) 
	{
	arg1 = arg1 + arg3 - arg2;
	}
	return arg1;
}

public static function cloneObject(arg1:Dynamic):Dynamic
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	loc1 = new Object();
	var loc3:Dynamic;
	loc3 = 0;
	var loc4:Dynamic;
	loc4 = arg1;
	for (loc2 in loc4)
	{
	loc1[loc2] = arg1[loc2];
	}
	return loc1;
}

public static function bound(arg1:Float, arg2:Float=NaN, arg3:Float=NaN):Float
{
	if (!isNaN(arg2))
	{
	arg1 = Math.max(arg1, arg2);
	}
	if (!isNaN(arg3))
	{
	arg1 = Math.min(arg1, arg3);
	}
	return arg1;
}

public static function degreesToRadians(arg1:Float):Float
{
	return arg1 * Math.PI / 180;
}

public static inline var FLOAT_ERROR_MARGIN:Float=1e-009;
}