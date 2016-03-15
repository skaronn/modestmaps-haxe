package com.modestmaps.extras;

import openfl.display.CapsStyle;
import openfl.display.Graphics;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;

class LineStyle {
	
	public var thickness:Float;
	public var color:UInt;
	public var alpha:Float;
	public var pixelHinting:Bool;
	public var scaleMode:LineScaleMode;
	public var caps:CapsStyle;
	public var joints:JointStyle;
	public var miterLimit:Float;

	public function new(thickness:Float = 0, color:UInt = 0, alpha:Float = 1, pixelHinting:Bool = false, scaleMode:LineScaleMode = null, caps:CapsStyle = null, joints:JointStyle = null, miterLimit:Float = 3.0)
	{
		this.thickness = thickness;
		this.color = color;
		this.alpha = alpha;
		this.pixelHinting = pixelHinting;
		this.scaleMode = scaleMode;
		this.caps = caps;
		this.joints = joints;
		this.miterLimit = miterLimit;
	}

	public function apply(graphics:Graphics, thicknessMod:Float = 1, alphaMod:Float = 1):Void
	{
		graphics.lineStyle(thickness * thicknessMod, color, alpha * alphaMod, pixelHinting, scaleMode, caps, joints, miterLimit);
	}
}