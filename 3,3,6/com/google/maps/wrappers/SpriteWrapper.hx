package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import openfl.display.*;
import openfl.events.*;

class SpriteWrapper extends flash.display.Sprite implements com.google.maps.interfaces.IWrappable
{
	public function new()
	{
		super();
		wrappedListenerCache = new com.google.maps.wrappers.WrappedListenerCache(this);
		return;
	}

	function initializeWrapper(arg1:Dynamic, arg2:Dynamic):Void
	{
		this.instance = arg1;
		this.extWrapper = arg2;
		return;
	}

	public var interfaceChain(getInterfaceChain, setInterfaceChain):Array<Dynamic>;
	
	private function getInterfaceChain():Array<Dynamic>
	{
		return null;
	}

	private function setWrapper(arg1:Dynamic):Void
	{
		return;
	}

	private function onObjectReady():Void
	{
		return;
	}

	public override function removeEventListener(arg1:String, arg2:Dynamic, arg3:Bool=false):Void
	{
		wrappedListenerCache.removeListener(super.removeEventListener, arg1, arg2, arg3);
		return;
	}

	public override function addEventListener(arg1:String, arg2:Dynamic, arg3:Bool=false, arg4:Int=0, arg5:Bool=false):Void
	{
		wrappedListenerCache.addListener(super.addEventListener, arg1, arg2, arg3, arg4, arg5);
		return;
	}

	private function isReady():Bool
	{
		return this.isObjectReady;
	}

	private function getBaseEventDispatcher():flash.events.IEventDispatcher
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = new com.google.maps.wrappers.SpriteWrapperEventDispatcher();
		loc1.addListenerMethod = super.addEventListener;
		loc1.removeListenerMethod = super.removeEventListener;
		loc1.willTriggerMethod = super.willTrigger;
		loc1.hasListenerMethod = super.hasEventListener;
		loc1.dispatchMethod = super.dispatchEvent;
		return loc1;
	}

	public var wrapper(getWrapper, setWrapper):Dynamic;
	
	private function getWrapper():Dynamic
	{
		return this.instance;
	}

	private function instantiateCrossDomainObject(arg1:Type, arg2:Type, arg3:String, arg4:Dynamic=null):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		this.interfaceClass = arg1;
		this.wrapperClass = arg2;
		this.createMethodName = arg3;
		this.initOptions = arg4;
		if (!(loc1 = com.google.maps.ClientBootstrap.getInstance()).isReady())
		{
			loc1.addEventListener(com.google.maps.ClientBootstrap.BOOTSTRAP_READY, this.completeInstantiation);
			return;
		}
		this.completeInstantiation();
		return;
	}

	private function completeInstantiation(arg1:flash.events.Event=null):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = null;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		loc2 = Reflect.field(loc1.getMapsFactory(), createMethodName);
		com.google.maps.wrappers.Wrapper.instance().wrap(this.initOptions == null ? loc2(this, this.getBaseEventDispatcher()) : loc2(this, this.getBaseEventDispatcher(), this.initOptions), this, interfaceClass, wrapperClass);
		isObjectReady = true;
		onObjectReady();
		return;
	}

	private var isObjectReady:Bool;

	private var extWrapper:Dynamic;

	private var createMethodName:String;

	private var initOptions:Dynamic;

	private var instance:Dynamic;

	private var wrappedListenerCache:com.google.maps.wrappers.WrappedListenerCache;

	private var wrapperClass:Type;

	private var interfaceClass:Type;
}