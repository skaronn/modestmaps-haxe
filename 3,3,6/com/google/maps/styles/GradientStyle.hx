package com.google.maps.styles;

import com.google.maps.wrappers.*;
import flash.geom.*;

class GradientStyle 
{
	public function new(arg1:Dynamic=null)
	{
		if (arg1 != null)
		{
			this.copyFromObject(arg1);
		}
		return;
	}

	public function toString():String
	{
		return "GradientStyle { type: " + this.type + " ... } ";
	}

	function copyFromObject(arg1:Dynamic):Void
	{
		this.type = arg1.type;
		this.colors = com.google.maps.wrappers.Wrapper.cloneArray(arg1.colors);
		this.alphas = com.google.maps.wrappers.Wrapper.cloneArray(arg1.alphas);
		this.ratios = com.google.maps.wrappers.Wrapper.cloneArray(arg1.ratios);
		this.matrix = arg1.matrix ? arg1.matrix.clone() : null;
		this.spreadMethod = arg1.spreadMethod;
		this.interpolationMethod = arg1.interpolationMethod;
		this.focalPointRatio = arg1.focalPointRatio;
		return;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.styles.GradientStyle
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new GradientStyle();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public var interpolationMethod:String;

	public var matrix:flash.geom.Matrix;

	public var ratios:Array<Dynamic>;

	public var colors:Array<Dynamic>;

	public var alphas:Array<Dynamic>;

	public var focalPointRatio:Float;

	public var type:String;

	public var spreadMethod:String;
}