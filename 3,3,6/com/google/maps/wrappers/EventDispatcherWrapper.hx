package com.google.maps.wrappers;

import flash.events.*;

class EventDispatcherWrapper extends com.google.maps.wrappers.WrapperBase implements flash.events.IEventDispatcher
{
public function new()
{
	super();
	wrappedListenerCache = new com.google.maps.wrappers.WrappedListenerCache(this);
	return;
}

public function dispatchEvent(arg1:flash.events.Event):Bool
{
	return this.instance.dispatchEvent(arg1);
}

public function willTrigger(arg1:String):Bool
{
	return this.instance.willTrigger(arg1);
}

public function addEventListener(arg1:String, arg2:Dynamic, arg3:Bool=false, arg4:Int=0, arg5:Bool=false):Void
{
	wrappedListenerCache.addListener(this.instance.addEventListener, arg1, arg2, arg3, arg4, arg5);
	return;
}

public function removeEventListener(arg1:String, arg2:Dynamic, arg3:Bool=false):Void
{
	wrappedListenerCache.removeListener(this.instance.removeEventListener, arg1, arg2, arg3);
	return;
}

public function hasEventListener(arg1:String):Bool
{
	return this.instance.hasEventListener(arg1);
}

private var wrappedListenerCache:com.google.maps.wrappers.WrappedListenerCache;
}