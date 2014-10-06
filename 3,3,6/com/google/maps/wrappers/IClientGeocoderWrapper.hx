package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;

class IClientGeocoderWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.IClientGeocoder
{
public function new()
{
	super();
	return;
}

public function geocode(arg1:String):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.geocode(arg1);
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IClientGeocoder"];
}

public function setBaseCountryCode(arg1:String):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setBaseCountryCode(arg1);
	return;
}

public function getViewport():com.google.maps.LatLngBounds
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapLatLngBounds(this.instance.getViewport());
}

public function setViewport(arg1:com.google.maps.LatLngBounds):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setViewport(this.extWrapper.wrapLatLngBounds(arg1));
	return;
}

public function resetCache():Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.resetCache();
	return;
}

public function getBaseCountryCode():String
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getBaseCountryCode();
}
}