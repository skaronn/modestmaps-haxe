package com.google.maps;

import flash.display.*;

internal class BootstrapConfiguration 
{
public function BootstrapConfiguration()
{
	super();
	return;
}

public var channel(getChannel, setChannel):String;
 	private function getChannel():String
{
	return this._channel;
}

private function setChannel(arg1:String):Void
{
	checkLocked(this._channel, arg1);
	this._channel = arg1;
	return;
}

private var hl(getHl, setHl):String;
 	private function getHl():String
{
	return this.language;
}

public var key(getKey, setKey):String;
 	private function getKey():String
{
	return this._key;
}

public function initialize(arg1:flash.display.LoaderInfo):Void
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = NaN;
	var loc3:Dynamic;
	loc3 = null;
	var loc4:Dynamic;
	loc4 = null;
	loc1 = BootstrapConfiguration.HTML_PARAMS;
	loc2 = 0;
	while (loc2 != loc1.length) 
	{
	loc3 = loc1[loc2];
	if (loc4 = ClientUtil.getFlashVar(arg1, loc3))
	{
		this[loc3] = loc4;
	}
	loc2 = (loc2 + 1);
	}
	this._url = arg1.loaderURL;
	return;
}

public var version(getVersion, setVersion):String;
 	private function getVersion():String
{
	return this._version;
}

public var client(getClient, setClient):String;
 	private function getClient():String
{
	return this._client;
}

private function setLanguage(arg1:String):Void
{
	checkLocked(this._language, arg1);
	this._language = arg1;
	return;
}

public function getBootstrapUrl():String
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	var loc3:Dynamic;
	loc3 = 0;
	var loc4:Dynamic;
	loc4 = null;
	var loc5:Dynamic;
	loc5 = null;
	loc1 = "http://";
	loc1 = loc1 + com.google.maps.Release.mfeHost;
	loc1 = loc1 + BootstrapConfiguration.BOOTSTRAP_PATH;
	loc2 = BootstrapConfiguration.BOOTSTRAP_PARAMS;
	loc3 = 0;
	while (loc3 < loc2.length) 
	{
	loc4 = loc2[loc3];
	if ((loc5 = this[loc4]) != null)
	{
		loc1 = loc1 + "&" + loc4 + "=" + encodeURIComponent(loc5);
	}
	++loc3;
	}
	return loc1;
}

public function getMfeRequestParams():String
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	var loc3:Dynamic;
	loc3 = NaN;
	var loc4:Dynamic;
	loc4 = null;
	if (this._mfeRequestParams == null || !this._locked)
	{
	loc1 = "";
	loc2 = BootstrapConfiguration.MFE_REQUEST_PARAMS;
	loc3 = 0;
	while (loc3 != loc2.length) 
	{
		loc4 = loc2[loc3];
		if (this[loc4] != null)
		{
		loc1 = loc1 + "&" + loc4 + "=" + encodeURIComponent(this[loc4]);
		}
		loc3 = (loc3 + 1);
	}
	if (this._locked)
	{
		this._mfeRequestParams = loc1;
	}
	return loc1;
	}
	return this._mfeRequestParams;
}

private function setClient(arg1:String):Void
{
	checkLocked(this._client, arg1);
	this._client = arg1;
	return;
}

public function getClientVersion():String
{
	return com.google.maps.Release.version;
}

public function lock():Void
{
	this._locked = true;
	return;
}

public var url(getUrl, setUrl):String;
 	private function getUrl():String
{
	return this._url;
}

private var vlib(getVlib, setVlib):String;
 	private function getVlib():String
{
	return this.version;
}

private function checkLocked(arg1:Dynamic, arg2:Dynamic):Void
{
	if (this._locked && !(arg1 == arg2))
	{
	throw new Error("Configuration parameters can no longer be changed");
	}
	return;
}

private function get_v():String
{
	return "1." + com.google.maps.Release.version;
}

public var language(getLanguage, setLanguage):String;
 	private function getLanguage():String
{
	return this._language;
}

private function setKey(arg1:String):Void
{
	checkLocked(this._key, arg1);
	this._key = arg1;
	return;
}

private function setVersion(arg1:String):Void
{
	checkLocked(this._version, arg1);
	this._version = arg1;
	return;
}

public static function getInstance():BootstrapConfiguration
{
	if (BootstrapConfiguration.instance == null)
	{
	BootstrapConfiguration.instance = new BootstrapConfiguration();
	}
	return BootstrapConfiguration.instance;
}

private static inline var BOOTSTRAP_PATH:String="/mapsapi/publicapi?file=flashapi";

private static inline var BOOTSTRAP_PARAMS:Array=["url", "key", "client", "channel", "hl", "v", "vlib"];

private static inline var MFE_REQUEST_PARAMS:Array=["key", "client", "channel"];

private static inline var HTML_PARAMS:Array=["key", "client", "channel", "language", "version"];

private var _channel:String;

private var _mfeRequestParams:String;

private var _version:String;

private var _key:String;

private var _locked:Bool;

private var _client:String;

private var _url:String;

private var _language:String;

private static var instance:BootstrapConfiguration;
}