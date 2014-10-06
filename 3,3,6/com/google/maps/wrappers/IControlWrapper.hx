package com.google.maps.wrappers;

import com.google.maps.controls.*;
import com.google.maps.interfaces.*;
import flash.display.*;
import flash.geom.*;

class IControlWrapper extends com.google.maps.wrappers.SpriteWrapper implements com.google.maps.interfaces.IControl
{
public function new()
{
	super();
	return;
}

public function setControlPosition(arg1:com.google.maps.controls.ControlPosition):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setControlPosition(this.extWrapper.wrapControlPosition(arg1));
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IControl"];
}

public function getControlPosition():com.google.maps.controls.ControlPosition
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapControlPosition(this.instance.getControlPosition());
}

public function getSize():openfl.geom.Point
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getSize();
}

public function initControlWithMap(arg1:com.google.maps.interfaces.IMap):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.initControlWithMap(this.extWrapper.wrapIMap(arg1));
	return;
}

public function getDisplayObject():flash.display.DisplayObject
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getDisplayObject();
}
}