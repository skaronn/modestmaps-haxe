package com.google.maps.wrappers;

import com.google.maps.interfaces.*;

class IOverlayWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.IOverlay
{
public function new()
{
	super();
	return;
}

public function hide():Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.hide();
	return;
}

public function isHidden():Bool
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.isHidden();
}

public function remove():Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.remove();
	return;
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IOverlay"];
}

public function initialize(arg1:com.google.maps.interfaces.IMap, arg2:Float=NaN):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.initialize(this.extWrapper.wrapIMap(arg1), arg2);
	return;
}

public function redraw(arg1:Bool):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.redraw(arg1);
	return;
}

public function show():Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.show();
	return;
}
}