package com.google.maps.wrappers;

import com.google.maps.interfaces.*;
import flash.geom.*;

class IOverviewMapControlWrapper extends com.google.maps.wrappers.IControlWrapper implements com.google.maps.interfaces.IOverviewMapControl
{
public function new()
{
	super();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IOverviewMapControl", "IControl"];
}

public function setSize(arg1:openfl.geom.Point):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setSize(arg1);
	return;
}
}