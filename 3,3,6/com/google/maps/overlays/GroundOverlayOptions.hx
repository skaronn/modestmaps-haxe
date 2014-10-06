package com.google.maps.overlays;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import com.google.maps.styles.*;
import com.google.maps.wrappers.*;

class GroundOverlayOptions 
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

public function copyFromObject(arg1:Dynamic):Void
{
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["rotation"], Number);
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

public function toString():String
{
	return "GroundOverlayOptions:\n\t{ strokeStyle: " + this._strokeStyle + "\n\t  rotation: " + this._rotation + " }";
}

public var strokeStyle(null, setStrokeStyle):com;
 	private function setStrokeStyle(arg1:com.google.maps.styles.StrokeStyle):Void
{
	this._strokeStyle = arg1;
	return;
}

public function get_strokeStyle():com.google.maps.styles.StrokeStyle
{
	return this._strokeStyle;
}

private function setRotation(arg1:Dynamic):Void
{
	this._rotation = arg1 as Number;
	return;
}

public var rotation(getRotation, setRotation):Dynamic;
 	private function getRotation():Dynamic
{
	return this._rotation;
}

public static function merge(arg1:Array<Dynamic>):com.google.maps.overlays.GroundOverlayOptions
{
	return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.overlays.GroundOverlayOptions, arg1) as com.google.maps.overlays.GroundOverlayOptions;
}

public static function fromObject(arg1:Dynamic):com.google.maps.overlays.GroundOverlayOptions
{
	var loc1:Dynamic;
	loc1 = null;
	if (arg1 == null)
	{
	return null;
	}
	loc1 = new GroundOverlayOptions();
	loc1.copyFromObject(arg1);
	return loc1;
}

public static function getDefaultOptions():com.google.maps.overlays.GroundOverlayOptions
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance().getMapsFactory();
	return loc1.getDefaultGroundOverlayOptions();
}

public static function setDefaultOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):Void
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance().getMapsFactory();
	loc1.setDefaultGroundOverlayOptions(arg1);
	return;
}

private var _strokeStyle:com.google.maps.styles.StrokeStyle;

private var _rotation:Dynamic;
}