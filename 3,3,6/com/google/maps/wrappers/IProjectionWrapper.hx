package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import flash.geom.*;

class IProjectionWrapper extends com.google.maps.wrappers.WrapperBase implements com.google.maps.interfaces.IProjection
{
public function new()
{
	super();
	return;
}

public function tileCheckRange(arg1:openfl.geom.Point, arg2:Float, arg3:Float):Bool
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.tileCheckRange(arg1, arg2, arg3);
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IProjection"];
}

public function fromPixelToLatLng(arg1:openfl.geom.Point, arg2:Float, arg3:Bool=false):com.google.maps.LatLng
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.fromPixelToLatLng(arg1, arg2, arg3));
}

public function fromLatLngToPixel(arg1:com.google.maps.LatLng, arg2:Float):openfl.geom.Point
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.fromLatLngToPixel(this.extWrapper.wrapLatLng(arg1), arg2);
}

public function getWrapWidth(arg1:Float):Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getWrapWidth(arg1);
}
}