package com.google.maps.wrappers;

import com.google.maps.interfaces.*;

class WrapperBase implements com.google.maps.interfaces.IWrappable
{
	public function new()
	{
		return;
	}

	function initializeWrapper(arg1:Dynamic, arg2:Dynamic):Void
	{
		this.instance = arg1;
		this.extWrapper = arg2;
		return;
	}

	private function setWrapper(arg1:Dynamic):Void
	{
		return;
	}

	public var interfaceChain(getInterfaceChain, setInterfaceChain):Array<Dynamic>;
		private function getInterfaceChain():Array
	{
		return null;
	}

	public var wrapper(getWrapper, setWrapper):Dynamic;
		private function getWrapper():Dynamic
	{
		return this.instance;
	}

	private var extWrapper:Dynamic;

	private var instance:Dynamic;
}