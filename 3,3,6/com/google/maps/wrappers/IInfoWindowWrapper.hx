package com.google.maps.wrappers;

import com.google.maps.interfaces.*;

class IInfoWindowWrapper extends com.google.maps.wrappers.IOverlayWrapper implements com.google.maps.interfaces.IInfoWindow
{
public function new()
{
	super();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IInfoWindow", "IOverlay"];
}

public var removed(getRemoved, null):Bool;
 	private function getRemoved():Bool
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.removed;
}
}