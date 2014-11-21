package com.google.maps.wrappers;

import com.google.maps.interfaces.*;

import openfl.utils.Object;

class WrapperBase implements com.google.maps.interfaces.IWrappable
{
	public function new()
	{
		return;
	}

	function initializeWrapper(arg1:Object, arg2:Object):Void
	{
		this.instance = arg1;
		this.extWrapper = arg2;
		return;
	}

	private function setWrapper(arg1:Object):Void
	{
		return;
	}

	public var interfaceChain(getInterfaceChain, setInterfaceChain):Array<Object>;
	
	private function getInterfaceChain():Array<Object>
	{
		return null;
	}

	public var wrapper(getWrapper, setWrapper):Object;
	
	private function getWrapper():Object
	{
		return this.instance;
	}

	private var extWrapper:Object;

	private var instance:Object;
}