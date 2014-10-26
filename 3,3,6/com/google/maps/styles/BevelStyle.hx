package com.google.maps.styles;

import com.google.maps.wrappers.*;

class BevelStyle extends com.google.maps.styles.RectangleStyle
{
	public function new(arg1:Dynamic=null)
	{
		_highlightColor = null;
		_shadowColor = null;
		_bevelAlpha = null;
		_bevelStyle = null;
		_bevelThickness = null;
		super();
		if (arg1 != null)
		{
			copyFromObject(arg1);
		}
		return;
	}

	public var bevelAlpha(getBevelAlpha, setBevelAlpha):Dynamic;
	
	private function getBevelAlpha():Dynamic
	{
		return this._bevelAlpha;
	}

	private function setShadowColor(arg1:Dynamic):Void
	{
		if (arg1 == null)
		{
		this._shadowColor = null;
		}
		else 
		{
		this._shadowColor = cast(arg1, Float);
		}
		return;
	}

	public var highlightColor(getHighlightColor, setHighlightColor):Dynamic;
	
	private function getHighlightColor():Dynamic
	{
		return this._highlightColor;
	}

	public var bevelStyle(getBevelStyle, setBevelStyle):Dynamic;
	
	private function getBevelStyle():Dynamic
	{
		return this._bevelStyle;
	}

	public var bevelThickness(getBevelThickness, setBevelThickness):Dynamic;
	
	private function getBevelThickness():Dynamic
	{
		return this._bevelThickness;
	}

	private function setHighlightColor(arg1:Dynamic):Void
	{
		if (arg1 == null)
		{
			this._highlightColor = null;
		}
		else 
		{
			this._highlightColor = cast(arg1, Float);
		}
		return;
	}

	private function setBevelAlpha(arg1:Dynamic):Void
	{
		if (arg1 == null)
		{
			this._bevelAlpha = null;
		}
		else 
		{
			this._bevelAlpha = cast(arg1, Float);
		}
		return;
	}

	public override function copyFromObject(arg1:Dynamic):Void
	{
		super.copyFromObject(arg1);
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["bevelStyle", "highlightColor", "shadowColor", "bevelAlpha", "bevelThickness"], Number);
		return;
	}

	public var shadowColor(getShadowColor, setShadowColor):Dynamic;
	
	private function getShadowColor():Dynamic
	{
		return this._shadowColor;
	}

	public override function toString():String
	{
		return "BevelStyle: { " + "\n\t" + super.toString() + "\n\tbevelStyle: " + this._bevelStyle + "\n\tbevelThickness: " + this._bevelThickness + "\n\thighlightColor: " + this._highlightColor + "\n\tshadowColor: " + this._shadowColor + "\n\tbevelAlpha: " + this._bevelAlpha + " } ";
	}

	private function setBevelThickness(arg1:Dynamic):Void
	{
		if (arg1 == null)
		{
			this._bevelThickness = null;
		}
		else 
		{
			this._bevelThickness = cast(arg1, Float);
		}
		return;
	}

	private function setBevelStyle(arg1:Dynamic):Void
	{
		if (arg1 == null)
		{
			this._bevelStyle = null;
		}
		else 
		{
			this._bevelStyle = cast(arg1, Float);
		}
		return;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.styles.BevelStyle
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new BevelStyle();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public static function mergeStyles(arg1:Array<Dynamic>):com.google.maps.styles.BevelStyle
	{
		return com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.BevelStyle, arg1) as com.google.maps.styles.BevelStyle;
	}

	public static inline var BEVEL_NONE:Float=0;

	public static inline var BEVEL_LOWERED:Float=2;

	public static inline var BEVEL_RAISED:Float=1;

	private var _bevelAlpha:Dynamic=null;

	private var _shadowColor:Dynamic=null;

	private var _highlightColor:Dynamic=null;

	private var _bevelStyle:Dynamic=null;

	private var _bevelThickness:Dynamic=null;
}