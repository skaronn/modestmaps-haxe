package com.google.maps;

import com.google.maps.interfaces.*;
import flash.text.*;

class ClientFactory  implements com.google.maps.interfaces.IClientFactory
{
public function new()
{
	super();
	return;
}

private function setWrapper(arg1:Dynamic):Void
{
	this._wrapper = arg1;
	return;
}

public function getSwcVersion():String
{
	return com.google.maps.Release.VERSION;
}

public function createTextField():flash.text.TextField
{
	return new flash.text.TextField();
}

public var wrapper(getWrapper, setWrapper):Dynamic;
 	private function getWrapper():Dynamic
{
	return this._wrapper;
}

public var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IClientFactory"];
}

private var _wrapper:Dynamic;
}