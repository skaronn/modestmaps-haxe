package com.google.maps;

import com.google.maps.wrappers.*;

import openfl.utils.Object;

class MapTypeOptions 
{
	public function new(arg1:Object=null)
	{
		if (arg1 != null)
		{
			this.copyFromObject(arg1);
		}
		return;
	}

	private function setMinResolution(arg1:Object):Void
	{
		this._minResolution = cast(arg1, Float);
		return;
	}

	public var linkColor(getLinkColor, setLinkColor):Object;
	
	private function getLinkColor():Object
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

	private function setLinkColor(arg1:Object):Void
	{
		this._linkColor = cast(arg1, Float);
		return;
	}

	private function setUrlArg(arg1:String):Void
	{
		this._urlArg = arg1;
		return;
	}

	public var tileSize(getTileSize, setTileSize):Object;
	
	private function getTileSize():Object
	{
		return this._tileSize;
	}

	private function setAlt(arg1:String):Void
	{
		this._alt = arg1;
		return;
	}

	public var minResolution(getMinResolution, setMinResolution):Object;
	
	private function getMinResolution():Object
	{
		return this._minResolution;
	}

	private function setMaxResolution(arg1:Object):Void
	{
		this._maxResolution = cast(arg1, Float);
		return;
	}

	public var radius(getRadius, setRadius):Object;
	
	private function getRadius():Object
	{
		return this._radius;
	}

	private function setRadius(arg1:Object):Void
	{
		this._radius = cast(arg1, Float);
		return;
	}

	private function setTileSize(arg1:Object):Void
	{
		this._tileSize = cast(arg1, Float);
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

	private function setTextColor(arg1:Object):Void
	{
		_textColor = cast(arg1, Float);
	}

	public function copyFromObject(arg1:Object):Void
	{
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["maxResolution", "minResolution", "tileSize", "textColor", "linkColor", "radius"], Number);
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["shortName", "urlArg", "errorMessage", "alt"], String);
	}

	public var maxResolution(get, set):Object;
	
	private function get_maxResolution():Object
	{
		return _maxResolution;
	}

	public var urlArg(get, set):String;
	
	private function get_urlArg():String
	{
		return _urlArg;
	}

	public function toString():String
	{
		return "MapTypeOptions: { shortName: " + this.shortName + "\n\t  urlArg: " + this._urlArg + "\n\t  maxResolution: " + this._maxResolution + "\n\t  minResolution: " + this._minResolution + "\n\t  tileSize: " + this._tileSize + "\n\t  textColor: " + this._textColor + "\n\t  linkColor: " + this._linkColor + "\n\t  errorMessage: " + this._errorMessage + "\n\t  alt: " + this._alt + "\n\t  radius: " + this._radius + " }";
	}

	public var textColor(get, set):Object;
	
	private function get_textColor():Object
	{
		return this._textColor;
	}

	public static function merge(arg1:Array<Object>):com.google.maps.MapTypeOptions
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.MapTypeOptions, arg1), com.google.maps.MapTypeOptions);
	}

	public static function fromObject(arg1:Object):com.google.maps.MapTypeOptions
	{
		var loc1:Object;
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
		var loc1:Object;
		loc1 = null;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		return loc1.getMapsFactory().getDefaultMapTypeOptions();
	}

	public static function setDefaultOptions(arg1:com.google.maps.MapTypeOptions):Void
	{
		var loc1:Object;
		loc1 = null;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		loc1.getMapsFactory().setDefaultMapTypeOptions(arg1);
		return;
	}

	private var _urlArg:String;

	private var _linkColor:Object;

	private var _minResolution:Object;

	private var _shortName:String;

	private var _alt:String;

	private var _tileSize:Object;

	private var _maxResolution:Object;

	private var _textColor:Object;

	private var _radius:Object;

	private var _errorMessage:String;
}