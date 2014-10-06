package com.google.maps.controls;

@:final class ControlPosition 
{
	public function ControlPosition(arg1:Float, arg2:Float=0, arg3:Float=NaN)
	{
		super();
		internalPaddingX = arg2;
		internalPaddingY = isNaN(arg3) ? internalPaddingX : arg3;
		internalAnchor = arg1 == ANCHOR_TOP_LEFT || arg1 == ANCHOR_BOTTOM_RIGHT || arg1 == ANCHOR_BOTTOM_LEFT ? arg1 : ANCHOR_TOP_RIGHT;
		return;
	}

	public function getOffsetX():Float
	{
		return internalPaddingX;
	}

	public function getOffsetY():Float
	{
		return internalPaddingY;
	}

	public function getAnchor():Float
	{
		return internalAnchor;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.controls.ControlPosition
	{
		return new ControlPosition(arg1.getAnchor(), arg1.getOffsetX(), arg1.getOffsetY());
	}

	public static inline var ANCHOR_BOTTOM_LEFT:Float=32;

	public static inline var ANCHOR_TOP_RIGHT:Float=1;

	public static inline var ANCHOR_BOTTOM_RIGHT:Float=33;

	public static inline var ANCHOR_TOP_LEFT:Float=0;

	private var internalPaddingX:Float;

	private var internalPaddingY:Float;

	private var internalAnchor:Float;
}