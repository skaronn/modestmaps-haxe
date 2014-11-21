package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import openfl.geom.*;
import openfl.utils.Object;

class IMapTypeWrapper extends com.google.maps.wrappers.EventDispatcherWrapper implements com.google.maps.interfaces.IMapType
{
	public function new()
	{
		super();
		return;
	}

	public function getCopyrights(arg1:com.google.maps.LatLngBounds, arg2:Float):Array<Object>
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapCopyrightNoticeArray(this.instance.getCopyrights(this.extWrapper.wrapLatLngBounds(arg1), arg2));
	}

	//public override var interfaceChain(get, null):Array<Object>;
	
	//private function get_interfaceChain():Array<Object>
	//{
		//return ["IMapType"];
	//}

	public function getName(arg1:Bool=false):String
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getName(arg1);
	}

	public function getSpanZoomLevel(arg1:com.google.maps.LatLng, arg2:com.google.maps.LatLng, arg3:openfl.geom.Point):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getSpanZoomLevel(this.extWrapper.wrapLatLng(arg1), this.extWrapper.wrapLatLng(arg2), arg3);
	}

	public function getTextColor():Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getTextColor();
	}

	public function getMinimumResolution(arg1:com.google.maps.LatLng=null):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getMinimumResolution(this.extWrapper.wrapLatLng(arg1));
	}

	public function getTileLayers():Array<Object>
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapITileLayerArray(this.instance.getTileLayers());
	}

	public function getRadius():Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getRadius();
	}

	public function getMaximumResolution(arg1:com.google.maps.LatLng=null):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getMaximumResolution(this.extWrapper.wrapLatLng(arg1));
	}

	public function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds, arg2:openfl.geom.Point):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getBoundsZoomLevel(this.extWrapper.wrapLatLngBounds(arg1), arg2);
	}

	public function getProjection():com.google.maps.interfaces.IProjection
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapIProjection(this.instance.getProjection());
	}

	public function getLinkColor():Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getLinkColor();
	}

	public function getErrorMessage():String
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getErrorMessage();
	}

	public function getTileSize():Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getTileSize();
	}

	public function setMaxResolutionOverride(arg1:Float):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.setMaxResolutionOverride(arg1);
		return;
	}

	public function getMaxResolutionOverride():Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getMaxResolutionOverride();
	}

	public function getUrlArg():String
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getUrlArg();
	}

	public function getAlt():String
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getAlt();
	}
}