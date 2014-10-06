package com.google.maps.styles;

import com.google.maps.wrappers.*;

class FillStyle 
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

	public var gradient(null, setGradient):com.google.maps.styles.GradientStyle;
	
	private function setGradient(arg1:com.google.maps.styles.GradientStyle):Void
	{
		this._gradient = arg1;
		return;
	}

	public var color(getColor, setColor):Dynamic;
	
	private function getColor():Dynamic
	{
		return this._color;
	}

	private function setColor(arg1:Dynamic):Void
	{
		this._color = cast(arg1, Number);
		if (this._color != null)
		{
			this._gradient = null;
		}
		return;
	}

	public function copyFromObject(arg1:Dynamic):Void
	{
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["color", "alpha"], Number);
		if (arg1.gradient != null)
		{
			this.gradient = com.google.maps.styles.GradientStyle.fromObject(arg1.gradient);
		}
		return;
	}

	public function toString():String
	{
		return "FillStyle: { color: " + this._color + ", alpha: " + this._alpha + ", gradient: " + this._gradient + "} ";
	}

	public var alpha(getAlpha, setAlpha):Dynamic;
	
	private function getAlpha():Dynamic
	{
		return this._alpha;
	}
	
	private function setAlpha(arg1:Dynamic):Void
	{
		this._alpha = cast(arg1, Number);
		if (this._alpha != null)
		{
			this._gradient = null;
		}
		return;
	}

	public function get_gradient():com.google.maps.styles.GradientStyle
	{
		return this._gradient;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.styles.FillStyle
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new FillStyle();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public static function mergeStyles(arg1:Array<Dynamic>):com.google.maps.styles.FillStyle
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.FillStyle, arg1), com.google.maps.styles.FillStyle);
	}

	private var _color:Dynamic;

	private var _gradient:com.google.maps.styles.GradientStyle;

	private var _alpha:Dynamic;
}