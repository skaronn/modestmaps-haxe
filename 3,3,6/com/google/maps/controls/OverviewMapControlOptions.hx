package com.google.maps.controls;

import com.google.maps.styles.*;
import com.google.maps.wrappers.*;
import flash.geom.*;

class OverviewMapControlOptions 
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

	public var size(null, set):openfl.geom.Point;
	
	private function set_size(arg1:openfl.geom.Point):Void
	{
		if (arg1 == null)
		{
			this._size = null;
		}
		else 
		{
			this._size = new openfl.geom.Point(arg1.x, arg1.y);
		}
		return;
	}

	public function get_size():openfl.geom.Point
	{
		return this._size;
	}

	public var padding(null, setPadding):openfl.geom.Point;
	
	private function setPadding(arg1:openfl.geom.Point):Void
	{
		if (arg1 == null)
		{
			this._padding = null;
		}
		else 
		{
			this._padding = new openfl.geom.Point(arg1.x, arg1.y);
		}
		return;
	}

	public function toString():String
	{
		return "OverviewMapControlOptions: {" + "\n\tcontrolStyle: " + this.controlStyle + "\n\tsize: " + this.size + "\n\tpadding: " + this.padding + "\n\tnavigatorStyle: " + this.navigatorStyle + " }";
	}

	public function get_padding():openfl.geom.Point
	{
		return this._padding;
	}

	public function get_controlStyle():com.google.maps.styles.BevelStyle
	{
		return this._controlStyle;
	}

	public var controlStyle(null, setControlStyle):com.google.maps.styles.BevelStyle;
	
	private function setControlStyle(arg1:com.google.maps.styles.BevelStyle):Void
	{
		this._controlStyle = arg1;
		return;
	}

	public var navigatorStyle(null, setNavigatorStyle):com.google.maps.styles.RectangleStyle;
	
	private function setNavigatorStyle(arg1:com.google.maps.styles.RectangleStyle):Void
	{
		this._navigatorStyle = arg1;
		return;
	}

	public function get_navigatorStyle():com.google.maps.styles.RectangleStyle
	{
		return this._navigatorStyle;
	}

	public function copyFromObject(arg1:Dynamic):Void
	{
		if (arg1.size != null)
		{
			this.size = new openfl.geom.Point(arg1.size.x, arg1.size.y);
		}
		
		if (arg1.padding != null)
		{
			this.padding = new openfl.geom.Point(arg1.padding.x, arg1.padding.y);
		}
		
		if (arg1.controlStyle != null)
		{
			if (this.controlStyle == null)
			{
				this.controlStyle = new com.google.maps.styles.BevelStyle();
			}
			this.controlStyle.copyFromObject(arg1.controlStyle);
		}
		
		if (arg1.navigatorStyle != null)
		{
			if (this.navigatorStyle == null)
			{
				this.navigatorStyle = new com.google.maps.styles.RectangleStyle();
			}
			this.navigatorStyle.copyFromObject(arg1.navigatorStyle);
		}
		return;
	}

	public static function merge(arg1:Array<Dynamic>):com.google.maps.controls.OverviewMapControlOptions
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.controls.OverviewMapControlOptions, arg1), com.google.maps.controls.OverviewMapControlOptions);
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.controls.OverviewMapControlOptions
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new OverviewMapControlOptions();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	private var _size:openfl.geom.Point;

	private var _padding:openfl.geom.Point;

	private var _controlStyle:com.google.maps.styles.BevelStyle;

	private var _navigatorStyle:com.google.maps.styles.RectangleStyle;
}