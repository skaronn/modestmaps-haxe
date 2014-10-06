package com.google.maps;

class Copyright 
{
	public function new(arg1:String, arg2:com.google.maps.LatLngBounds, arg3:Float, arg4:String, arg5:Float=NaN, arg6:Bool=false)
	{
		super();
		this.id = arg1;
		this.minZoom = arg3;
		this.bounds = arg2;
		this.text = arg4;
		this.maxZoom = arg5;
		this.supplemental = arg6;
		return;
	}

	public function getText():String
	{
		return this.text;
	}

	public function getBounds():com.google.maps.LatLngBounds
	{
		return this.bounds;
	}

	public function getMaxZoom():Float
	{
		return this.maxZoom;
	}

	public function getId():String
	{
		return id;
	}

	public function isSupplemental():Bool
	{
		return this.supplemental;
	}

	public function getMinZoom():Float
	{
		return this.minZoom;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.Copyright
	{
		return new Copyright(arg1.getId(), com.google.maps.LatLngBounds.fromObject(arg1.getBounds()), arg1.getMinZoom(), arg1.getText(), arg1.getMaxZoom(), arg1.isSupplemental());
	}

	private var supplemental:Bool;

	private var minZoom:Float;

	private var text:String;

	private var bounds:com.google.maps.LatLngBounds;

	private var maxZoom:Float;

	private var id:String;
}