package com.google.maps.wrappers;

import com.google.maps.interfaces.*;

class IZoomControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IZoomControl
{
public function new()
{
	super();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IZoomControl", "IControl"];
}
}