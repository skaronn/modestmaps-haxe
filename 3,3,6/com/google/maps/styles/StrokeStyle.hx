package com.google.maps.styles;

import com.google.maps.wrappers.*;

class StrokeStyle 
{
	public function new(arg1:Dynamic=null)
	{
		super();
		if (arg1 != null)
		{
			copyFromObject(arg1);
		}
		return;
	}

	public var color(getColor, setColor):Dynamic;
		private function getColor():Dynamic
	{
		return this._color;
	}

	public var alpha(getAlpha, setAlpha):Dynamic;
		private function getAlpha():Dynamic
	{
		return this._alpha;
	}

	private function setColor(arg1:Dynamic):Void
	{
		this._color = cast(arg1, Number);
		return;
	}

	public function toString():String
	{
		return "StrokeStyle: { thickness: " + this._thickness + ", color: " + this._color + ", alpha: " + this._alpha + "} ";
	}

	public function copyFromObject(arg1:Dynamic):Void
	{
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["thickness", "color", "alpha"], Number);
		return;
	}

	public var thickness(getThickness, setThickness):Dynamic;
		private function getThickness():Dynamic
	{
		return this._thickness;
	}

	private function setThickness(arg1:Dynamic):Void
	{
		this._thickness = cast(arg1, Number);
		return;
	}

	private function setAlpha(arg1:Dynamic):Void
	{
		this._alpha = cast(arg1, Number);
		return;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.styles.StrokeStyle
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new StrokeStyle();
		com.google.maps.wrappers.Wrapper.copyProperties(loc1, arg1, ["thickness", "color", "alpha"], Number);
		return loc1;
	}

	public static function mergeStyles(arg1:Array<Dynamic>):com.google.maps.styles.StrokeStyle
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.StrokeStyle, arg1), com.google.maps.styles.StrokeStyle);
	}

	private var _color:Dynamic;

	private var _thickness:Dynamic;

	private var _alpha:Dynamic;
}