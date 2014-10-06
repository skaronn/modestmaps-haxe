package com.google.maps.overlays;

import com.google.maps.*;
import com.google.maps.styles.*;
import com.google.maps.wrappers.*;

class PolylineOptions 
{
public function new(arg1:Dynamic=null)
{
	super();
	if (arg1 != null)
	{
	this.copyFromObject(arg1);
	}
	return;
}

public function toString():String
{
	return "PolylineOptions: { strokeStyle: " + this.strokeStyle + " }";
}

public function copyFromObject(arg1:Dynamic):Void
{
	if (arg1.strokeStyle != null)
	{
	if (this.strokeStyle == null)
	{
		this.strokeStyle = new com.google.maps.styles.StrokeStyle();
	}
	this.strokeStyle.copyFromObject(arg1.strokeStyle);
	}
	return;
}

public static function merge(arg1:Array<Dynamic>):com.google.maps.overlays.PolylineOptions
{
	return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.overlays.PolylineOptions, arg1), com.google.maps.overlays.PolylineOptions);
}

public static function fromObject(arg1:Dynamic):com.google.maps.overlays.PolylineOptions
{
	var loc1:Dynamic;
	loc1 = null;
	if (arg1 == null)
	{
	return null;
	}
	loc1 = new PolylineOptions();
	loc1.copyFromObject(arg1);
	return loc1;
}

public static function getDefaultOptions():com.google.maps.overlays.PolylineOptions
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance();
	return loc1.getMapsFactory().getDefaultPolylineOptions();
}

public static function setDefaultOptions(arg1:com.google.maps.overlays.PolylineOptions):Void
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance();
	loc1.getMapsFactory().setDefaultPolylineOptions(arg1);
	return;
}

public var strokeStyle:com.google.maps.styles.StrokeStyle;
}