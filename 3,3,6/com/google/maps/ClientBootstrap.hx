package com.google.maps;

import com.google.maps.interfaces.*;
import com.google.maps.wrappers.*;
import flash.display.*;
import flash.events.*;
import flash.net.*;
import flash.system.*;
import flash.utils.*;

class ClientBootstrap extends flash.display.Sprite
{
public function new()
{
	super();
	this.bootstrapLoader = null;
	this.librarySwfLoader = null;
	this.factory = null;
	this.isInitialized = false;
	this.name = com.google.maps.Constants.MASTER_NAME;
	return;
}

public function getBootstrapConfiguration():Dynamic
{
	return BootstrapConfiguration.getInstance();
}

public function loadBootstrap():Void
{
	if (this.isInitialized)
	{
	return;
	}
	this.isInitialized = true;
	scheduleForNextFrame(internalLoadBootstrap);
	return;
}

public function getMapsFactory():com.google.maps.interfaces.IMapsFactory
{
	return this.factory;
}

private function internalLoadBootstrap(arg1:flash.events.Event):Void
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	var loc3:Dynamic;
	loc3 = null;
	loc1 = BootstrapConfiguration.getInstance();
	loc2 = loc1.getBootstrapUrl();
	(loc3 = new flash.display.Loader()).contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.onBootstrapFailed);
	this.bootstrapLoader = loadUrl(loc3, loc2);
	return;
}

private function createFactory(arg1:flash.events.Event):Void
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	loc1 = this.librarySwfLoader.content as Object;
	loc2 = loc1.getWrapper();
	com.google.maps.wrappers.Wrapper.instance().setAlienWrapper(loc2);
	loc2.setClientFactory(new com.google.maps.ClientFactory());
	this.factory = com.google.maps.wrappers.Wrapper.instance().wrapIMapsFactory(loc1.getFactory());
	this.dispatchEvent(new flash.events.Event(com.google.maps.ClientBootstrap.BOOTSTRAP_READY));
	return;
}

private function onBootstrapFailed(arg1:flash.events.Event):Void
{
	this.dispatchEvent(new flash.events.Event(com.google.maps.ClientBootstrap.BOOTSTRAP_FAILED));
	return;
}

private function allowLibraryDomain(arg1:String):Void
{
	var loc1:Dynamic;
	loc1 = NaN;
	loc1 = arg1.lastIndexOf("/");
	if (loc1 >= 0)
	{
	arg1 = arg1.substring(0, loc1);
	}
	flash.system.Security.allowDomain(arg1);
	return;
}

public function isReady():Bool
{
	return !(this.factory == null);
}

private function scheduleForNextFrame(arg1:Dynamic):Void
{
	this.timer = new flash.utils.Timer(1, 1);
	this.timer.addEventListener(flash.events.TimerEvent.TIMER, arg1);
	this.timer.start();
	return;
}

private function loadUrl(arg1:flash.display.Loader, arg2:String):flash.display.Loader
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	var loc3:Dynamic;
	loc3 = null;
	com.google.maps.Log.log0("ClientBootstrap - loading: " + arg2);
	loc1 = new flash.net.URLRequest(arg2);
	this.addChild(arg1);
	loc2 = new RegExp(":\\d+");
	allowLibraryDomain(arg2.replace(loc2, ""));
	(loc3 = new flash.system.LoaderContext()).applicationDomain = new flash.system.ApplicationDomain(null);
	arg1.load(loc1, loc3);
	return arg1;
}

public function setUrl(arg1:String):Void
{
	var loc1:Dynamic;
	loc1 = null;
	loc1 = new flash.display.Loader();
	loc1.contentLoaderInfo.addEventListener(flash.events.Event.COMPLETE, this.onLibrarySwfLoaded);
	loc1.contentLoaderInfo.addEventListener(flash.events.IOErrorEvent.IO_ERROR, this.onBootstrapFailed);
	this.librarySwfLoader = loadUrl(loc1, arg1);
	return;
}

private function onLibrarySwfLoaded(arg1:flash.events.Event):Void
{
	scheduleForNextFrame(createFactory);
	return;
}

public function getBootstrapLoader():flash.display.Loader
{
	return this.bootstrapLoader;
}

public static function getInstance():com.google.maps.ClientBootstrap
{
	if (com.google.maps.ClientBootstrap.instance == null)
	{
	com.google.maps.ClientBootstrap.instance = new ClientBootstrap();
	}
	return com.google.maps.ClientBootstrap.instance;
}

public static inline var BOOTSTRAP_READY:String="bootstrapready";

public static inline var BOOTSTRAP_FAILED:String="bootstrapfailed";

private var factory:com.google.maps.interfaces.IMapsFactory;

private var bootstrapLoader:flash.display.Loader;

private var timer:flash.utils.Timer;

private var isInitialized:Bool;

private var librarySwfLoader:flash.display.Loader;

private static var instance:com.google.maps.ClientBootstrap;
}