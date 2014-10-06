package com.google.maps.styles;

import com.google.maps.wrappers.*;

class ButtonStyle 
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

	public function allStates():com.google.maps.styles.ButtonFaceStyle
	{
		return null;
	}

	public var downState(null, set):com.google.maps.styles.ButtonFaceStyle;
	
	private function set_downState(arg1:com.google.maps.styles.ButtonFaceStyle):Void
	{
		this._downState = arg1;
		return;
	}

	public function setAllStates(arg1:com.google.maps.styles.ButtonFaceStyle):Void
	{
		if (arg1 == null)
		{
			return;
		}
		if (this._upState == null)
		{
			this._upState = new com.google.maps.styles.ButtonFaceStyle();
		}
		this._upState.copyFromObject(arg1);
		if (this._overState == null)
		{
			this._overState = new com.google.maps.styles.ButtonFaceStyle();
		}
		this._overState.copyFromObject(arg1);
		if (this._downState == null)
		{
			this._downState = new com.google.maps.styles.ButtonFaceStyle();
		}
		this._downState.copyFromObject(arg1);
		return;
	}

	public var upState(null, set):com.google.maps.styles.ButtonFaceStyle;
	
	private function set_upState(arg1:com.google.maps.styles.ButtonFaceStyle):Void
	{
		this._upState = arg1;
		return;
	}

	public function copyFromObject(arg1:Dynamic):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1.allStates)
		{
			loc1 = new com.google.maps.styles.ButtonFaceStyle(arg1.allStates);
			this.setAllStates(loc1);
		}
		if (arg1.upState != null)
		{
			if (this.upState == null)
			{
				this.upState = new com.google.maps.styles.ButtonFaceStyle();
			}
			this.upState.copyFromObject(arg1.upState);
		}
		if (arg1.downState != null)
		{
			if (this.downState == null)
			{
				this.downState = new com.google.maps.styles.ButtonFaceStyle();
			}
			this.downState.copyFromObject(arg1.downState);
		}
		if (arg1.overState != null)
		{
			if (this.overState == null)
			{
				this.overState = new com.google.maps.styles.ButtonFaceStyle();
			}
			this.overState.copyFromObject(arg1.overState);
		}
		return;
	}

	public function get_downState():com.google.maps.styles.ButtonFaceStyle
	{
		return this._downState;
	}

	public function get_upState():com.google.maps.styles.ButtonFaceStyle
	{
		return this._upState;
	}

	public var overState(null, setOverState):com.google.maps.styles.ButtonFaceStyle;
	
	private function setOverState(arg1:com.google.maps.styles.ButtonFaceStyle):Void
	{
		this._overState = arg1;
		return;
	}

	public function toString():String
	{
		return "ButtonStyle: { upState: " + this._upState + ", overState: " + this._overState + ", downState: " + this._downState + " }";
	}

	public function get_overState():com.google.maps.styles.ButtonFaceStyle
	{
		return this._overState;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.styles.ButtonStyle
	{
		var loc1:Dynamic;
		loc1 = null;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = new ButtonStyle();
		loc1.copyFromObject(arg1);
		return loc1;
	}

	public static function mergeStyles(arg1:Array<Dynamic>):com.google.maps.styles.ButtonStyle
	{
		return cast(com.google.maps.wrappers.Wrapper.mergeStyles(com.google.maps.styles.ButtonStyle, arg1), com.google.maps.styles.ButtonStyle);
	}

	private var _downState:com.google.maps.styles.ButtonFaceStyle;

	private var _upState:com.google.maps.styles.ButtonFaceStyle;

	private var _overState:com.google.maps.styles.ButtonFaceStyle;
}