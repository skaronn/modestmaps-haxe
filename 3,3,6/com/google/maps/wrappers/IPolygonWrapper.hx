package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import com.google.maps.overlays.*;

class IPolygonWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IPolygon
{
public function new()
{
	super();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IPolygon", "IOverlay"];
}

public function getInnerVertexCount(arg1:Float):Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getInnerVertexCount(arg1);
}

public function getOuterVertex(arg1:Float):com.google.maps.LatLng
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getOuterVertex(arg1));
}

public function setOptions(arg1:com.google.maps.overlays.PolygonOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setOptions(this.extWrapper.wrapPolygonOptions(arg1));
	return;
}

public function getOuterVertexCount():Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getOuterVertexCount();
}

public function getOptions():com.google.maps.overlays.PolygonOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapPolygonOptions(this.instance.getOptions());
}

public function getInnerPolylineCount():Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getInnerPolylineCount();
}

public function getInnerVertex(arg1:Float, arg2:Float):com.google.maps.LatLng
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getInnerVertex(arg1, arg2));
}
}