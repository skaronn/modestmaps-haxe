package com.google.maps.wrappers;

import com.google.maps.interfaces.*;

class IPositionControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IPositionControl
{
public function new()
{
	super();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IPositionControl", "IControl"];
}
}