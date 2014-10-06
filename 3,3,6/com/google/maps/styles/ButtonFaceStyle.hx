package com.google.maps.styles;

import com.google.maps.wrappers.*;
import flash.text.*;

class ButtonFaceStyle extends com.google.maps.styles.BevelStyle
{
	public function new(arg1:Dynamic=null)
	{
		_labelFormat = null;
		super(null);
		if (arg1 != null)
		{
		copyFromObject(arg1);
		}
		return;
	}

	public function get_labelFormat():openfl.text.TextFormat
	{
		return this._labelFormat;
	}

	public override function toString():String
	{
		return "ButtonFaceStyle: { " + "\n\t" + super.toString() + "\n\tlabelFormat: " + this._labelFormat + " } ";
	}

	public var labelFormat(null, setLabelFormat):openfl.text.TextFormat;
	
	private function setLabelFormat(arg1:openfl.text.TextFormat):Void
	{
		this._labelFormat = arg1;
		return;
	}

	public override function copyFromObject(arg1:Dynamic):Void
	{
		super.copyFromObject(arg1);
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

	public static function fromObject(arg1:Dynamic):com.google.maps.styles.ButtonFaceStyle
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new ButtonFaceStyle();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public static function mergeStyles(arg1:Array<Dynamic>):com.google.maps.styles.ButtonFaceStyle
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.ButtonFaceStyle, arg1), com.google.maps.styles.ButtonFaceStyle);
	}

	private var _labelFormat:openfl.text.TextFormat=null;
}