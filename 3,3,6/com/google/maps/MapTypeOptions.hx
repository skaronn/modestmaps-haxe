package com.google.maps;

import com.google.maps.wrappers.*;

class MapTypeOptions 
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

private function setMinResolution(arg1:Dynamic):Void
{
	this._minResolution = arg1 as Number;
	return;
}

public var linkColor(getLinkColor, setLinkColor):Dynamic;
 	private function getLinkColor():Dynamic
{
	return this._linkColor;
}

public var alt(getAlt, setAlt):String;
 	private function getAlt():String
{
	return this._alt;
}

private function setErrorMessage(arg1:String):Void
{
	this._errorMessage = arg1;
	return;
}

private function setShortName(arg1:String):Void
{
	this._shortName = arg1;
	return;
}

private function setLinkColor(arg1:Dynamic):Void
{
	this._linkColor = arg1 as Number;
	return;
}

private function setUrlArg(arg1:String):Void
{
	this._urlArg = arg1;
	return;
}

public var tileSize(getTileSize, setTileSize):Dynamic;
 	private function getTileSize():Dynamic
{
	return this._tileSize;
}

private function setAlt(arg1:String):Void
{
	this._alt = arg1;
	return;
}

public var minResolution(getMinResolution, setMinResolution):Dynamic;
 	private function getMinResolution():Dynamic
{
	return this._minResolution;
}

private function setMaxResolution(arg1:Dynamic):Void
{
	this._maxResolution = arg1 as Number;
	return;
}

public var radius(getRadius, setRadius):Dynamic;
 	private function getRadius():Dynamic
{
	return this._radius;
}

private function setRadius(arg1:Dynamic):Void
{
	this._radius = arg1 as Number;
	return;
}

private function setTileSize(arg1:Dynamic):Void
{
	this._tileSize = arg1 as Number;
	return;
}

public var errorMessage(getErrorMessage, setErrorMessage):String;
 	private function getErrorMessage():String
{
	return this._errorMessage;
}

public var shortName(getShortName, setShortName):String;
 	private function getShortName():String
{
	return this._shortName;
}

private function setTextColor(arg1:Dynamic):Void
{
	this._textColor = arg1 as Number;
	return;
}

public function copyFromObject(arg1:Dynamic):Void
{
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["maxResolution", "minResolution", "tileSize", "textColor", "linkColor", "radius"], Number);
	com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["shortName", "urlArg", "errorMessage", "alt"], String);
	return;
}

public var maxResolution(getMaxResolution, setMaxResolution):Dynamic;
 	private function getMaxResolution():Dynamic
{
	return this._maxResolution;
}

public var urlArg(getUrlArg, setUrlArg):String;
 	private function getUrlArg():String
{
	return this._urlArg;
}

public function toString():String
{
	return "MapTypeOptions: { shortName: " + this.shortName + "\n\t  urlArg: " + this._urlArg + "\n\t  maxResolution: " + this._maxResolution + "\n\t  minResolution: " + this._minResolution + "\n\t  tileSize: " + this._tileSize + "\n\t  textColor: " + this._textColor + "\n\t  linkColor: " + this._linkColor + "\n\t  errorMessage: " + this._errorMessage + "\n\t  alt: " + this._alt + "\n\t  radius: " + this._radius + " }";
}

public var textColor(getTextColor, setTextColor):Dynamic;
 	private function getTextColor():Dynamic
{
	return this._textColor;
}

public static function merge(arg1:Array<Dynamic>):com.google.maps.MapTypeOptions
{
	return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.MapTypeOptions, arg1) as com.google.maps.MapTypeOptions;
}

public static function fromObject(arg1:Dynamic):com.google.maps.MapTypeOptions
{
	var loc1:Dynamic;
	loc1 = null;
	if (arg1 == null)
	{
	return null;
	}
	loc1 = new MapTypeOptions();
	loc1.copyFromObject(arg1);
	return loc1;
}

public static function getDefaultOptions():com.google.maps.MapTypeOptions
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance();
	return loc1.getMapsFactory().getDefaultMapTypeOptions();
}

public static function setDefaultOptions(arg1:com.google.maps.MapTypeOptions):Void
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = com.google.maps.ClientBootstrap.getInstance();
	loc1.getMapsFactory().setDefaultMapTypeOptions(arg1);
	return;
}

private var _urlArg:String;

private var _linkColor:Dynamic;

private var _minResolution:Dynamic;

private var _shortName:String;

private var _alt:String;

private var _tileSize:Dynamic;

private var _maxResolution:Dynamic;

private var _textColor:Dynamic;

private var _radius:Dynamic;

private var _errorMessage:String;
}