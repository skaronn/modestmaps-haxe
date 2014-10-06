package com.google.maps;

import com.google.maps.styles.*;
import com.google.maps.wrappers.*;
import openfl.geom.*;
import openfl.text.*;

class InfoWindowOptions 
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

	public function copyFromObject(arg1:Dynamic):Void
	{
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["width", "height", "cornerRadius", "padding", "tailWidth", "tailHeight", "tailOffset", "tailAlign"], Number);
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["hasCloseButton", "hasTail", "hasShadow"], Bool);
		com.google.maps.wrappers.Wrapper.copyProperties(this, arg1, ["title", "titleHTML", "content", "contentHTML"], String);
		
		if (arg1._strokeStyle != null)
		{
			if (this._strokeStyle == null)
			{
				this._strokeStyle = new com.google.maps.styles.StrokeStyle();
			}
			this._strokeStyle.copyFromObject(arg1._strokeStyle);
		}
		if (arg1._fillStyle != null)
		{
			if (this._fillStyle == null)
			{
				this._fillStyle = new com.google.maps.styles.FillStyle();
			}
			this._fillStyle.copyFromObject(arg1._fillStyle);
		}
		if (arg1._titleFormat != null)
		{
			if (this._titleFormat == null)
			{
				this._titleFormat = new openfl.text.TextFormat();
			}
			com.google.maps.wrappers.Wrapper.copyTextFormatProperties(this._titleFormat, arg1._titleFormat);
		}
		if (arg1._titleStyleSheet != null)
		{
			if (this._titleStyleSheet == null)
			{
				this._titleStyleSheet = new flash.text.StyleSheet();
			}
			com.google.maps.wrappers.Wrapper.copyStyleSheetProperties(this._titleStyleSheet, arg1._titleStyleSheet);
		}
		if (arg1._contentFormat != null)
		{
			if (this._contentFormat == null)
			{
				this._contentFormat = new openfl.text.TextFormat();
			}
			com.google.maps.wrappers.Wrapper.copyTextFormatProperties(this._contentFormat, arg1._contentFormat);
		}
		if (arg1._contentStyleSheet != null)
		{
			if (this._contentStyleSheet == null)
			{
				this._contentStyleSheet = new flash.text.StyleSheet();
			}
			com.google.maps.wrappers.Wrapper.copyStyleSheetProperties(this._contentStyleSheet, arg1._contentStyleSheet);
		}
		if (arg1._pointOffset != null)
		{
			if (this._pointOffset == null)
			{
				this._pointOffset = new openfl.geom.Point();
			}
			com.google.maps.wrappers.Wrapper.copyPointProperties(this._pointOffset, arg1._pointOffset);
		}
		return;
	}

	public var tailOffset(get, set):Dynamic;
	
	private function get_tailOffset():Dynamic
	{
		return this._tailOffset;
	}

	private function set_tailOffset(arg1:Dynamic):Void
	{
		this._tailOffset = cast(arg1, Number);
		return;
	}

	public var hasTail(get, set):Dynamic;
	
	private function get_hasTail():Dynamic
	{
		return this._hasTail;
	}
	
	private function set_hasTail(arg1:Dynamic):Void
	{
		this._hasTail = cast(arg1, Bool);
		return;
	}

	public var pointOffset(null, set):openfl.geom.Point;
	
	private function set_pointOffset(arg1:openfl.geom.Point):Void
	{
		this._pointOffset = arg1;
		return;
	}

	public var padding(get, set):Dynamic;
	
	private function get_padding():Dynamic
	{
		return this._padding;
	}
	
	private function set_padding(arg1:Dynamic):Void
	{
		this._padding = cast(arg1, Number);
		return;
	}

	public var titleHTML(getTitleHTML, setTitleHTML):String;
	
	private function getTitleHTML():String
	{
		return this._titleHTML;
	}
	
	private function setTitleHTML(arg1:String):Void
	{
		this._titleHTML = arg1;
		if (this._titleHTML != null)
		{
			this._title = null;
		}
		return;
	}
	
	public var title(getTitle, setTitle):String;

	public var tailAlign(getTailAlign, setTailAlign):Dynamic;
	
	private function getTailAlign():Dynamic
	{
		return this._tailAlign;
	}

	public var tailHeight(getTailHeight, setTailHeight):Dynamic;
	
	private function getTailHeight():Dynamic
	{
		return this._tailHeight;
	}

	public var content(getContent, setContent):String;
	
	private function getContentStyleSheet():flash.text.StyleSheet
	{
		return this._contentStyleSheet;
	}
	
	private function setContentStyleSheet(arg1:flash.text.StyleSheet):Void
	{
		this._contentStyleSheet = arg1;
		return;
	}

	private function setContentFormat(arg1:openfl.text.TextFormat):Void
	{
		this._contentFormat = arg1;
		return;
	}

	private function setTailAlign(arg1:Dynamic):Void
	{
		this._tailAlign = cast(arg1, Number);
		return;
	}
	
	//public var content(getContent, setContent):String;

	public var contentHTML(get, set):String;
	
	private function get_contentHTML():String
	{
		return this._contentHTML;
	}

	private function set_contentHTML(arg1:String):Void
	{
		this._contentHTML = arg1;
		if (this._contentHTML != null)
		{
			this._content = null;
		}
		return;
	}
	
	//public var title(getTitle, setTitle):String;
	
	private function setTitle(arg1:String):Void
	{
		this._title = arg1;
		if (this._title != null)
		{
			this._titleHTML = null;
		}
		return;
	}
	
	private function getTitleStyleSheet():flash.text.StyleSheet
	{
		return this._titleStyleSheet;
	}

	private function setTailHeight(arg1:Dynamic):Void
	{
		this._tailHeight = cast(arg1, Number);
		return;
	}

	public var strokeStyle(null, setStrokeStyle):com.google.maps.styles.StrokeStyle;
	
	private function setStrokeStyle(arg1:com.google.maps.styles.StrokeStyle):Void
	{
		this._strokeStyle = arg1;
		return;
	}

	private function setCornerRadius(arg1:Dynamic):Void
	{
		this._cornerRadius = cast(arg1, Number);
		return;
	}

	public var height(getHeight, setHeight):Dynamic;
	
	private function getHeight():Dynamic
	{
		return this._height;
	}

	//public function pointOffset():openfl.geom.Point
	//{
		//return this._pointOffset;
	//}

	public var width(get, set):Dynamic;
	
	private function get_width():Dynamic
	{
		return this._width;
	}
	
	private function set_width(arg1:Dynamic):Void
	{
		this._width = cast(arg1, Number);
		return;
	}

	//public var content(getContent, setContent):String;
	
	private function getContentFormat():openfl.text.TextFormat
	{
		return this._contentFormat;
	}

	private function setTitleStyleSheet(arg1:flash.text.StyleSheet):Void
	{
		this._titleStyleSheet = arg1;
		return;
	}

	private function setHeight(arg1:Dynamic):Void
	{
		this._height = cast(arg1, Number);
		return;
	}

	public var cornerRadius(getCornerRadius, setCornerRadius):Dynamic;
	
	private function getCornerRadius():Dynamic
	{
		return this._cornerRadius;
	}

	//public var title(get, set):String;
	//
	//private function get_title():String
	//{
		//return this._title;
	//}

	public var hasShadow(get, set):Dynamic;
	
	private function get_hasShadow():Dynamic
	{
		return this._hasShadow;
	}
	
	private function set_hasShadow(arg1:Dynamic):Void
	{
		this.hasShadow = cast(arg1, Bool);
		return;
	}

	//public var fillStyle(null, set):com.google.maps.styles.FillStyle
	//
	//private function set_fillStyle(arg1:com.google.maps.styles.FillStyle)
	//{
		//this.fillStyle = arg1;
		//return;
	//}

	public var tailWidth(get, set):Dynamic;
	
	private function get_tailWidth():Dynamic
	{
		return this.tailWidth;
	}
	
	private function set_tailWidth(arg1:Dynamic):Void
	{
		this.tailWidth = cast(arg1, Number);
		return;
	}

	public var hasCloseButton(getHasCloseButton, setHasCloseButton):Dynamic;
	
	private function getHasCloseButton():Dynamic
	{
		return this.hasCloseButton;
	}	
	
	private function setHasCloseButton(arg1:Dynamic):Void
	{
		this.hasCloseButton = cast(arg1, Bool);
		return;
	}

	public function get_strokeStyle():com.google.maps.styles.StrokeStyle
	{
		return this.strokeStyle;
	}

	private function setTitleFormat(arg1:openfl.text.TextFormat):Void
	{
		this.titleFormat = arg1;
		return;
	}

	public function get_fillStyle():com.google.maps.styles.FillStyle
	{
		return this.fillStyle;
	}

	//public var content(get, set):String;
	//
	//private function get_content():String
	//{
		//return this._content;
	//}
	
	private function set_content(arg1:String):Void
	{
		this.content = arg1;
		if (this.content != null)
		{
			this.contentHTML = null;
		}
		return;
	}

	//public var title(get, set):String;
	
	private function getTitleFormat():openfl.text.TextFormat
	{
		return this._titleFormat;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.InfoWindowOptions
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new InfoWindowOptions();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public static function getDefaultOptions():com.google.maps.InfoWindowOptions
	{
		var loc1:Dynamic = null;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		return loc1.getMapsFactory().getDefaultInfoWindowOptions();
	}

	public static function mergeOptions(arg1:Array<Dynamic>):com.google.maps.InfoWindowOptions
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.InfoWindowOptions, arg1), com.google.maps.InfoWindowOptions);
	}

	public static function setDefaultOptions(arg1:com.google.maps.InfoWindowOptions):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		loc1.getMapsFactory().setDefaultInfoWindowOptions(arg1);
		return;
	}

	public static inline var ALIGN_LEFT:Float=0;

	public static inline var ALIGN_RIGHT:Float=2;

	public static inline var ALIGN_CENTER:Float=1;

	private var _pointOffset:openfl.geom.Point;

	private var _contentStyleSheet:flash.text.StyleSheet;

	private var _titleHTML:String;

	private var _strokeStyle:com.google.maps.styles.StrokeStyle;

	private var _tailAlign:Dynamic;

	private var _cornerRadius:Dynamic;

	private var _tailOffset:Dynamic;

	private var _titleFormat:openfl.text.TextFormat;

	private var _content:String;

	private var _tailHeight:Dynamic;

	private var _height:Dynamic;

	private var _width:Dynamic;

	private var _hasTail:Dynamic;

	private var _contentFormat:openfl.text.TextFormat;

	private var _padding:Dynamic;

	private var _tailWidth:Dynamic;

	private var _title:String;

	private var _hasShadow:Dynamic;

	private var _titleStyleSheet:flash.text.StyleSheet;

	private var _contentHTML:String;

	private var _hasCloseButton:Dynamic;

	private var _fillStyle:com.google.maps.styles.FillStyle;
}