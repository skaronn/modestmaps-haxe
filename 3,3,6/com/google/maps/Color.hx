package com.google.maps;

@:final class Color 
{
	public function Color(arg1:Float)
	{
		super();
		_r = arg1 >> 16;
		_g = (arg1 & 65280) >> 8;
		_b = arg1 & 255;
		return;
	}

	public function get_b():Float
	{
		return Math.round(_b);
	}

	public var r(null, setR):Float;
		private function setR(arg1:Float):Void
	{
		_r = arg1 > 255 ? 255 : arg1 < 0 ? 0 : arg1;
		return;
	}

	public var b(null, setB):Float;
		private function setB(arg1:Float):Void
	{
		_b = arg1 > 255 ? 255 : arg1 < 0 ? 0 : arg1;
		return;
	}

	public function toString():String
	{
		return "R:" + r + "/G:" + g + "/B:" + b;
	}

	public function get_g():Float
	{
		return Math.round(_g);
	}

	public function get_r():Float
	{
		return Math.round(_r);
	}

	public var rgb(getRgb, setRgb):Float;
		private function getRgb():Float
	{
		return (r << 16) + (g << 8) + b;
	}

	public var g(null, setG):Float;
		private function setG(arg1:Float):Void
	{
		_g = arg1 > 255 ? 255 : arg1 < 0 ? 0 : arg1;
		return;
	}

	public function incRGB(arg1:Float, arg2:Float, arg3:Float):Void
	{
		r = _r + arg1;
		g = _g + arg2;
		b = _b + arg3;
		return;
	}

	public function setRGB(arg1:Float, arg2:Float, arg3:Float):Void
	{
		r = arg1;
		g = arg2;
		b = arg3;
		return;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.Color
	{
		return new Color(arg1.rgb);
	}

	public static function toHtml(arg1:Float):String
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = null;
		if (!("number" == "number") || isNaN(arg1))
		{
		arg1 = 0;
		}
		loc1 = "#000000";
		loc2 = Math.floor(com.google.maps.MapUtil.bound(arg1, 0, 16777215));
		loc3 = loc2.toString(16);
		return loc1.substr(0, 7 - loc3.length) + loc3;
	}

	public static inline var GRAY10:Float=10526880;

	public static inline var GRAY7:Float=7368816;

	public static inline var GRAY13:Float=13684944;

	public static inline var GRAY15:Float=15790320;

	public static inline var MAGENTA:Float=16711935;

	public static inline var GRAY11:Float=11579568;

	public static inline var GRAY12:Float=12632256;

	public static inline var WHITE:Float=16777215;

	public static inline var BLUE:Float=255;

	public static inline var DEFAULTLINK:Float=7829452;

	public static inline var BLACK:Float=0;

	public static inline var GREEN:Float=65280;

	public static inline var CYAN:Float=65535;

	public static inline var GRAY1:Float=1052688;

	public static inline var GRAY2:Float=2105376;

	public static inline var GRAY3:Float=3158064;

	public static inline var RED:Float=16711680;

	public static inline var GRAY5:Float=5263440;

	public static inline var GRAY6:Float=6316128;

	public static inline var YELLOW:Float=16776960;

	public static inline var GRAY8:Float=8421504;

	public static inline var GRAY9:Float=9474192;

	public static inline var GRAY4:Float=4210752;

	public static inline var GRAY14:Float=14737632;

	private var _b:Float;

	private var _g:Float;

	private var _r:Float;
}