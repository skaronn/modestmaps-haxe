package com.google.maps.controls;

import com.google.maps.styles.*;
import com.google.maps.wrappers.*;
import flash.geom.*;

class MapTypeControlOptions 
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

	public var buttonSpacing(null, setButtonSpacing):openfl.geom.Point;
	
	private function setButtonSpacing(arg1:openfl.geom.Point):Void
	{
		this._buttonSpacing = arg1;
		return;
	}

	public function copyFromObject(arg1:Dynamic):Void
	{
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["buttonAlignment"], Number);
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["buttonSpacing", "buttonSize"], openfl.geom.Point);
		if (arg1.buttonStyle != null)
		{
			if (this.buttonStyle == null)
			{
				this.buttonStyle = new com.google.maps.styles.ButtonStyle();
			}
			this.buttonStyle.copyFromObject(arg1.buttonStyle);
		}
		return;
	}

	public var buttonSize(null, setButtonSize):openfl.geom.Point;
	
	private function setButtonSize(arg1:openfl.geom.Point):Void
	{
		this._buttonSize = arg1;
		return;
	}

	private function setButtonAlignment(arg1:Dynamic):Void
	{
		this._buttonAlignment = cast(arg1, Float);
		return;
	}

	public function toString():String
	{
		return "MapTypeControlOptions:\n\t{ buttonSize: " + this._buttonSize + "\n\t  buttonStyle: " + this._buttonStyle + "\n\t  buttonSpacing: " + this._buttonSpacing + "\n\t  buttonAlignment: " + this._buttonAlignment + " }";
	}

	public function get_buttonSpacing():openfl.geom.Point
	{
		return this._buttonSpacing;
	}

	public function get_buttonSize():openfl.geom.Point
	{
		return this._buttonSize;
	}

	public var buttonAlignment(getButtonAlignment, setButtonAlignment):Dynamic;
	
	private function getButtonAlignment():Dynamic
	{
		return this._buttonAlignment;
	}

	public var buttonStyle(null, setButtonStyle):com.google.maps.styles.ButtonStyle;
	
	private function setButtonStyle(arg1:com.google.maps.styles.ButtonStyle):Void
	{
		this._buttonStyle = arg1;
		return;
	}

	public function get_buttonStyle():com.google.maps.styles.ButtonStyle
	{
		return this._buttonStyle;
	}

	public static function merge(arg1:Array<Dynamic>):com.google.maps.controls.MapTypeControlOptions
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.controls.MapTypeControlOptions, arg1), com.google.maps.controls.MapTypeControlOptions);
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.controls.MapTypeControlOptions
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new MapTypeControlOptions();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public static inline var ALIGN_HORIZONTALLY:Float=0;

	public static inline var ALIGN_VERTICALLY:Float=1;

	private var _buttonStyle:com.google.maps.styles.ButtonStyle;

	private var _buttonAlignment:Dynamic;

	private var _buttonSize:openfl.geom.Point;

	private var _buttonSpacing:openfl.geom.Point;
}