package com.google.maps.overlays;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import com.google.maps.styles.*;
import com.google.maps.wrappers.*;
import flash.display.*;
import flash.geom.*;
import flash.text.*;

import flash.Error;

class MarkerOptions 
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

public var tooltip(getTooltip, setTooltip):String;
 	private function getTooltip():String
{
	return this._tooltip;
}

private function setTooltip(arg1:String):Void
{
	this._tooltip = arg1;
	return;
}

public var draggable(getDraggable, setDraggable):Dynamic;
 	private function getDraggable():Dynamic
{
	return this._draggable;
}

public var label(getLabel, setLabel):String;
 	private function getLabelFormat():openfl.text.TextFormat
{
	return this._labelFormat;
}

public var radius(getRadius, setRadius):Dynamic;
 	private function getRadius():Dynamic
{
	return this._radius;
}

private function setDraggable(arg1:Dynamic):Void
{
	this._draggable = arg1 as Bool;
	return;
}

private function setGravity(arg1:Dynamic):Void
{
	this._gravity = arg1 as Number;
	return;
}

private function setRadius(arg1:Dynamic):Void
{
	this._radius = arg1 as Number;
	return;
}

private function setLabelFormat(arg1:openfl.text.TextFormat):Void
{
	this._labelFormat = arg1;
	return;
}

public var strokeStyle(null, setStrokeStyle):com;
 	private function setStrokeStyle(arg1:com.google.maps.styles.StrokeStyle):Void
{
	this._strokeStyle = arg1;
	return;
}

private function setHasShadow(arg1:Dynamic):Void
{
	this._hasShadow = arg1 as Bool;
	return;
}

public var gravity(getGravity, setGravity):Dynamic;
 	private function getGravity():Dynamic
{
	return this._gravity;
}

public var icon(null, setIcon):flash;
 	private function setIconAlignment(arg1:Dynamic):Void
{
	this._iconAlignment = arg1;
	return;
}

public function get_strokeStyle():com.google.maps.styles.StrokeStyle
{
	return this._strokeStyle;
}

public var hasShadow(getHasShadow, setHasShadow):Dynamic;
 	private function getHasShadow():Dynamic
{
	return this._hasShadow;
}

public var fillStyle(null, setFillStyle):com;
 	private function setFillStyle(arg1:com.google.maps.styles.FillStyle):Void
{
	this._fillStyle = arg1;
	return;
}

public var iconOffset(null, setIconOffset):flash;
 	public var icon(null, setIcon):flash;
 	private function setIconOffset(arg1:openfl.geom.Point):Void
{
	this._iconOffset = arg1 == null ? null : new openfl.geom.Point(arg1.x, arg1.y);
	return;
}

public function copyFromObject(arg1:Dynamic):Void
{
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["radius", "gravity", "iconAlignment"], Number);
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["hasShadow", "draggable"], Bool);
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["label", "tooltip"], String);
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["iconOffset"], openfl.geom.Point);
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["icon"], flash.display.DisplayObject);
	if (arg1.strokeStyle != null)
	{
	if (this.strokeStyle == null)
	{
		this.strokeStyle = new com.google.maps.styles.StrokeStyle();
	}
	this.strokeStyle.copyFromObject(arg1.strokeStyle);
	}
	if (arg1.fillStyle != null)
	{
	if (this.fillStyle == null)
	{
		this.fillStyle = new com.google.maps.styles.FillStyle();
	}
	this.fillStyle.copyFromObject(arg1.fillStyle);
	}
	if (arg1.labelFormat != null)
	{
	if (this.labelFormat == null)
	{
		this.labelFormat = new openfl.text.TextFormat();
	}
	com.google.maps.wrappers.Wrapper.copyTextFormatProperties(this.labelFormat, arg1.labelFormat);
	}
	return;
}

private function setLabel(arg1:String):Void
{
	this._label = arg1;
	if (this._label != null)
	{
	this._icon = null;
	}
	return;
}

public var iconAlignment(getIconAlignment, setIconAlignment):Dynamic;
 	private function getIconAlignment():Dynamic
{
	return this._iconAlignment;
}

public function get_iconOffset():openfl.geom.Point
{
	return this._iconOffset == null ? null : new openfl.geom.Point(this._iconOffset.x, this._iconOffset.y);
}

public function get_fillStyle():com.google.maps.styles.FillStyle
{
	return this._fillStyle;
}

public var icon(null, setIcon):flash;
 	private function setIcon(arg1:flash.display.DisplayObject):Void
{
	this._icon = arg1;
	if (this._icon != null)
	{
	this._label = null;
	}
	return;
}

public function toString():String
{
	return "MarkerOptions:\n\t{ strokeStyle: " + this._strokeStyle + "\n\t  fillStyle: " + this._fillStyle + "\n\t  label: " + this._label + "\n\t  labelFormat: " + this._labelFormat + "\n\t  tooltip: " + this._tooltip + "\n\t  radius: " + this._radius + "\n\t  hasShadow: " + this._hasShadow + "\n\t  draggable: " + this._draggable + "\n\t  gravity: " + this._gravity + "\n\t  icon: " + this._icon + "\n\t  iconAlignment: " + this._iconAlignment + "\n\t  iconOffset: " + this._iconOffset + " }";
}

public var label(getLabel, setLabel):String;
 	private function getLabel():String
{
	return this._label;
}

public function get_icon():flash.display.DisplayObject
{
	return this._icon;
}

public static function fromObject(arg1:Dynamic):com.google.maps.overlays.MarkerOptions
{
	var loc1:Dynamic;
	loc1 = null;
	if (arg1 == null)
	{
	return null;
	}
	loc1 = new MarkerOptions();
	loc1.copyFromObject(arg1);
	return loc1;
}

public static function getDefaultOptions():com.google.maps.overlays.MarkerOptions
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance().getMapsFactory();
	return loc1.getDefaultMarkerOptions();
}

public static function merge(arg1:Array<Dynamic>):com.google.maps.overlays.MarkerOptions
{
	return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.overlays.MarkerOptions, arg1) as com.google.maps.overlays.MarkerOptions;
}

public static function setDefaultOptions(arg1:com.google.maps.overlays.MarkerOptions):Void
{
	var loc1:Dynamic;
	loc1 = null;
	if (arg1._icon != null)
	{
	throw new Error("Cannot specify a custom icon in default MarkerOptions");
	}
	loc1 = com.google.maps.ClientBootstrap.getInstance().getMapsFactory();
	loc1.setDefaultMarkerOptions(arg1);
	return;
}

public static inline var ALIGN_LEFT:Float=0;

public static inline var ALIGN_VERTICAL_CENTER:Float=16;

public static inline var ALIGN_BOTTOM:Float=32;

public static inline var ALIGN_RIGHT:Float=2;

public static inline var ALIGN_HORIZONTAL_CENTER:Float=1;

public static inline var ALIGN_TOP:Float=0;

private var _iconOffset:openfl.geom.Point;

private var _draggable:Dynamic;

private var _gravity:Dynamic;

private var _strokeStyle:com.google.maps.styles.StrokeStyle;

private var _radius:Dynamic;

private var _tooltip:String;

private var _labelFormat:openfl.text.TextFormat;

private var _icon:flash.display.DisplayObject;

private var _hasShadow:Dynamic;

private var _iconAlignment:Dynamic;

private var _fillStyle:com.google.maps.styles.FillStyle;

private var _label:String;
}