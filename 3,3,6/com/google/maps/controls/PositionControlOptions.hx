package com.google.maps.controls;

import com.google.maps.styles.*;
import com.google.maps.wrappers.*;
import flash.geom.*;

class PositionControlOptions 
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

	public var buttonSpacing(null, set):openfl.geom.Point;
	
	private function set_buttonSpacing(arg1:openfl.geom.Point):Void
	{
		this._buttonSpacing = arg1;
		return;
	}

	public function copyFromObject(arg1:Dynamic):Void
	{
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["buttonSize", "buttonSpacing"], openfl.geom.Point);
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

	public var buttonSize(null, set):openfl.geom.Point;
	
	private function set_buttonSize(arg1:openfl.geom.Point):Void
	{
		this._buttonSize = arg1;
		return _buttonSize;
	}

	public function toString():String
	{
		return "PositionControlOptions:\n\t{ buttonSize: " + this._buttonSize + "\n\t  buttonStyle: " + this._buttonStyle + "\n\t  buttonSpacing: " + this._buttonSpacing + " }";
	}

	public function get_buttonSpacing():openfl.geom.Point
	{
		return this._buttonSpacing;
	}

	public function get_buttonSize():openfl.geom.Point
	{
		return this._buttonSize;
	}

	public var buttonStyle(null, set):com.google.maps.styles.ButtonStyle;
	
	private function set_buttonStyle(arg1:com.google.maps.styles.ButtonStyle):Void
	{
		this._buttonStyle = arg1;
		return _buttonStyle;
	}

	public function get_buttonStyle():com.google.maps.styles.ButtonStyle
	{
		return this._buttonStyle;
	}

	public static function merge(arg1:Array<Dynamic>):com.google.maps.controls.PositionControlOptions
	{
		return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.controls.PositionControlOptions, arg1) as com.google.maps.controls.PositionControlOptions;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.controls.PositionControlOptions
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new PositionControlOptions();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	private var _buttonStyle:com.google.maps.styles.ButtonStyle;

	private var _buttonSize:openfl.geom.Point;

	private var _buttonSpacing:openfl.geom.Point;
}