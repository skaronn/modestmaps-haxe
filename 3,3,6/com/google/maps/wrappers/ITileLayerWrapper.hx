package com.google.maps.wrappers;

import com.google.maps.interfaces.*;
import flash.display.*;
import flash.geom.*;

class ITileLayerWrapper extends com.google.maps.wrappers.WrapperBase implements com.google.maps.interfaces.ITileLayer
{
public function new()
{
	super();
	return;
}

public function setMapType(arg1:com.google.maps.interfaces.IMapType):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setMapType(this.extWrapper.wrapIMapType(arg1));
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["ITileLayer"];
}

public function getCopyrightCollection():com.google.maps.interfaces.ICopyrightCollection
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapICopyrightCollection(this.instance.getCopyrightCollection());
}

public function getMapType():com.google.maps.interfaces.IMapType
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapIMapType(this.instance.getMapType());
}

public function getMinResolution():Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getMinResolution();
}

public function getAlpha():Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getAlpha();
}

public function loadTile(arg1:openfl.geom.Point, arg2:Float):flash.display.DisplayObject
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.loadTile(arg1, arg2);
}

public function getMaxResolution():Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getMaxResolution();
}
}