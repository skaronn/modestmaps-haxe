package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import com.google.maps.overlays.*;

class IPolylineWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IPolyline
{
public function new()
{
	super();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IPolyline", "IOverlay"];
}

public function getVertexCount():Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getVertexCount();
}

public function getVertex(arg1:Float):com.google.maps.LatLng
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getVertex(arg1));
}

public function getOptions():com.google.maps.overlays.PolylineOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapPolylineOptions(this.instance.getOptions());
}

public function getLength(arg1:Float=6378137):Float
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getLength(arg1);
}

public function setOptions(arg1:com.google.maps.overlays.PolylineOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setOptions(this.extWrapper.wrapPolylineOptions(arg1));
	return;
}
}