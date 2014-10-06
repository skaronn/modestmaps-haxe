package com.google.maps.wrappers;

import flash.events.*;

class SpriteWrapperEventDispatcher extends com.google.maps.wrappers.WrapperBase implements flash.events.IEventDispatcher
{
public function new()
{
	super();
	return;
}

public function dispatchEvent(arg1:flash.events.Event):Bool
{
	return dispatchMethod(arg1);
}

public function willTrigger(arg1:String):Bool
{
	return willTriggerMethod(arg1);
}

public function removeEventListener(arg1:String, arg2:Dynamic, arg3:Bool=false):Void
{
	removeListenerMethod(arg1, arg2, arg3);
	return;
}

public function addEventListener(arg1:String, arg2:Dynamic, arg3:Bool=false, arg4:Int=0, arg5:Bool=false):Void
{
	addListenerMethod(arg1, arg2, arg3, arg4, arg5);
	return;
}

public function hasEventListener(arg1:String):Bool
{
	return hasListenerMethod(arg1);
}

public var willTriggerMethod:Dynamic;

public var removeListenerMethod:Dynamic;

public var hasListenerMethod:Dynamic;

public var addListenerMethod:Dynamic;

public var dispatchMethod:Dynamic;
}