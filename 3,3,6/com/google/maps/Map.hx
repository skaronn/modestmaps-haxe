package com.google.maps;

import com.google.maps.interfaces.*;
import com.google.maps.wrappers.*;
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;
import flash.utils.*;

class Map extends com.google.maps.wrappers.IMapWrapper implements com.google.maps.interfaces.IMap
{
	public function new()
	{
		super();
		this.controlList = [];
		this.delayedCalls = [];
		this.autoSize = true;
		this.size = new openfl.geom.Point(0, 0);
		this.addEventListener(flash.events.Event.ADDED_TO_STAGE, onAdded);
		return;
	}

	private function setChannel(arg1:String):Void
	{
		BootstrapConfiguration.getInstance().channel = arg1;
		return;
	}

	private function internalSetSize(arg1:openfl.geom.Point):Void
	{
		if (this.isLoaded())
		{
		super.setSize(arg1);
		}
		this.size = arg1;
		drawBackground();
		return;
	}

	private override function onObjectReady():Void
	{
		callLater(this.completeInitialization);
		return;
	}

	public override function removeControl(arg1:com.google.maps.interfaces.IControl):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = 0;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		if (loc1.isReady())
		{
		super.removeControl(arg1);
		}
		else 
		{
		loc2 = controlList.indexOf(arg1);
		if (loc2 >= 0)
		{
			controlList.splice(loc2, 1);
		}
		}
		return;
	}

	public var key(getKey, setKey):String;
		private function getKey():String
	{
		return BootstrapConfiguration.getInstance().key;
	}

	private function onBootstrapFailed(arg1:flash.events.Event):Void
	{
		bootstrapFailure("Initialization failed: please check the API key,\nswf location, " + "version and network availability.");
		return;
	}

	private function setLanguage(arg1:String):Void
	{
		BootstrapConfiguration.getInstance().language = arg1;
		return;
	}

	private function onAdded(arg1:flash.events.Event):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = null;
		this.removeEventListener(flash.events.Event.ADDED_TO_STAGE, onAdded);
		this.parent.addEventListener(flash.events.Event.RESIZE, this.onParentResize);
		loc1 = Std.as(this.parent, flash.display.Stage);
		if (!(loc1 == null) && this.autoSize)
		{
			loc1.scaleMode = flash.display.StageScaleMode.NO_SCALE;
			loc1.align = flash.display.StageAlign.TOP_LEFT;
			onParentResize();
		}
		drawBackground();
		loc2 = BootstrapConfiguration.getInstance();
		loc2.initialize(loaderInfo);
		loc2.lock();
		if (key != null)
		{
			com.google.maps.ClientBootstrap.getInstance().addEventListener(com.google.maps.ClientBootstrap.BOOTSTRAP_FAILED, onBootstrapFailed);
			com.google.maps.ClientBootstrap.getInstance().loadBootstrap();
			instantiateCrossDomainObject(com.google.maps.interfaces.IMap, com.google.maps.Map, "createMap");
		}
		else 
		{
			bootstrapFailure("Initialization failed: please specify an API key.");
		}
		return;
	}

	private function completeInitialization():Void
	{
		var loc1:Dynamic;
		loc1 = NaN;
		loc1 = 0;
		while (loc1 < controlList.length) 
		{
		super.addControl(controlList[loc1]);
		loc1 = (loc1 + 1);
		}
		controlList = [];
		internalSetSize(this.size);
		dispatchEvent(new com.google.maps.MapEvent(com.google.maps.MapEvent.MAP_READY, this));
		return;
	}

	private function setKey(arg1:String):Void
	{
		BootstrapConfiguration.getInstance().key = arg1;
		return;
	}

	private function callLater(arg1:Dynamic):Void
	{
		if (this.timer == null)
		{
		this.timer = new flash.utils.Timer(1, 1);
		this.timer.addEventListener(flash.events.TimerEvent.TIMER, this.executeDelayedCalls);
		this.timer.start();
		}
		this.delayedCalls.push(arg1);
		return;
	}

	public var version(getVersion, setVersion):String;
		private function getVersion():String
	{
		return BootstrapConfiguration.getInstance().version;
	}

	public function getInterfaceVersion():String
	{
		return com.google.maps.Release.version;
	}

	public var channel(getChannel, setChannel):String;
		private function getChannel():String
	{
		return BootstrapConfiguration.getInstance().channel;
	}

	private function bootstrapFailure(arg1:String):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		com.google.maps.Log.log0("Bootstrap failure: " + arg1);
		loc1 = new flash.text.TextField();
		loc1.background = true;
		loc1.autoSize = flash.text.TextFieldAutoSize.CENTER;
		loc1.defaultTextFormat = new openfl.text.TextFormat("_sans", 16);
		loc1.x = this.size.x / 2;
		loc1.y = this.size.y / 2;
		loc1.text = arg1;
		addChild(loc1);
		return;
	}

	public var language(getLanguage, setLanguage):String;
		private function getLanguage():String
	{
		return BootstrapConfiguration.getInstance().language;
	}

	public override function addControl(arg1:com.google.maps.interfaces.IControl):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = com.google.maps.ClientBootstrap.getInstance();
		if (loc1.isReady())
		{
		super.addControl(arg1);
		}
		else 
		{
		controlList.push(arg1);
		}
		return;
	}

	private function onParentResize(arg1:flash.events.Event=null):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		if (this.autoSize)
		{
			loc1 = Std.as(this.parent, flash.display.Stage);
			if (loc1 == null)
			{
				internalSetSize(new openfl.geom.Point(this.parent.width * this.parent.scaleX, this.parent.height * this.parent.scaleY));
			}
			else 
			{
				internalSetSize(new openfl.geom.Point(loc1.stageWidth, loc1.stageHeight));
			}
			drawBackground();
		}
		return;
	}

	public override function setSize(arg1:openfl.geom.Point):Void
	{
		this.autoSize = false;
		internalSetSize(arg1);
		return;
	}

	private function setClient(arg1:String):Void
	{
		BootstrapConfiguration.getInstance().client = arg1;
		return;
	}

	private function drawBackground():Void
	{
		this.graphics.clear();
		this.graphics.beginFill(12632256);
		this.graphics.lineStyle();
		this.graphics.drawRect(0, 0, this.size.x, this.size.y);
		this.graphics.endFill();
		this.scaleX = 1;
		this.scaleY = 1;
		return;
	}

	private function executeDelayedCalls(arg1:flash.events.Event):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = 0;
		this.timer = null;
		loc1 = this.delayedCalls;
		this.delayedCalls = [];
		if (loc1 == null)
		{
		return;
		}
		while (loc2 < loc1.length) 
		{
		var loc3:Dynamic;
		(loc3 = loc1)[loc2]();
		++loc2;
		}
		return;
	}

	private function setVersion(arg1:String):Void
	{
		BootstrapConfiguration.getInstance().version = arg1;
		return;
	}

	public override function isLoaded():Bool
	{
		return com.google.maps.ClientBootstrap.getInstance().isReady() && super.isLoaded();
	}

	public var client(getClient, setClient):String;
		private function getClient():String
	{
		return BootstrapConfiguration.getInstance().client;
	}

	private var size:openfl.geom.Point;

	private var autoSize:Bool;

	private var timer:flash.utils.Timer;

	private var delayedCalls:Array<Dynamic>;

	private var controlList:Array<Dynamic>;
}