package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;

class ICopyrightCollectionWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.ICopyrightCollection
{
public function new()
{
	super();
	return;
}

public function getCopyrightsAtLatLng(arg1:com.google.maps.LatLng):Array
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapCopyrightArray(this.instance.getCopyrightsAtLatLng(this.extWrapper.wrapLatLng(arg1)));
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["ICopyrightCollection"];
}

public function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Float):Array
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getCopyrights(this.extWrapper.wrapLatLngBounds(arg1), arg2);
}

public function getCopyrightNotice(arg1:com.google.maps.LatLngBounds, arg2:Float):com.google.maps.CopyrightNotice
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapCopyrightNotice(this.instance.getCopyrightNotice(this.extWrapper.wrapLatLngBounds(arg1), arg2));
}

public function addCopyright(arg1:com.google.maps.Copyright):Bool
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.addCopyright(this.extWrapper.wrapCopyright(arg1));
}
}