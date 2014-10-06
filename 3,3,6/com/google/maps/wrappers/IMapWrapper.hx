package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.controls.*;
import com.google.maps.interfaces.*;
import flash.display.*;
import flash.geom.*;
import flash.utils.*;

import openfl.errors.Error;

class IMapWrapper extends com.google.maps.wrappers.SpriteWrapper implements com.google.maps.interfaces.IMap
{
	public function new()
	{
		super();
		if (flash.utils.getQualifiedClassName(this).indexOf("::IMapWrapper") != -1)
		{
		throw new Error("Abstract class - " + "Cannot instantiate objects of import flash.Error;

	class IMapWrapper directly");
		}
		return;
	}

	public function getCurrentMapType():com.google.maps.interfaces.IMapType
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapIMapType(this.instance.getCurrentMapType());
	}

	public function setMapType(arg1:com.google.maps.interfaces.IMapType):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.setMapType(this.extWrapper.wrapIMapType(arg1));
		return;
	}

	public function getBoundsZoomLevel(arg1:com.google.maps.LatLngBounds):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getBoundsZoomLevel(this.extWrapper.wrapLatLngBounds(arg1));
	}

	public function openInfoWindow(arg1:com.google.maps.LatLng, arg2:com.google.maps.InfoWindowOptions=null):com.google.maps.interfaces.IInfoWindow
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapIInfoWindow(this.instance.openInfoWindow(this.extWrapper.wrapLatLng(arg1), this.extWrapper.wrapInfoWindowOptions(arg2)));
	}

	public function removeControl(arg1:com.google.maps.interfaces.IControl):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.removeControl(this.extWrapper.wrapIControl(arg1));
		return;
	}

	public function getZoom():Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getZoom();
	}

	public function getProjection():com.google.maps.interfaces.IProjection
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapIProjection(this.instance.getProjection());
	}

	public function disableDragging():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.disableDragging();
		return;
	}

	public function zoomIn(arg1:com.google.maps.LatLng=null, arg2:Bool=false, arg3:Bool=false):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.zoomIn(this.extWrapper.wrapLatLng(arg1), arg2, arg3);
		return;
	}

	public function fromViewPortPointToLatLng(arg1:openfl.geom.Point, arg2:Bool=false):com.google.maps.LatLng
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.fromViewPortPointToLatLng(arg1, arg2));
	}

	public function placeControl(arg1:com.google.maps.interfaces.IControl, arg2:com.google.maps.controls.ControlPosition):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.placeControl(this.extWrapper.wrapIControl(arg1), this.extWrapper.wrapControlPosition(arg2));
		return;
	}

	public function loadResourceString(arg1:String):String
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.loadResourceString(arg1);
	}

	public function displayHint(arg1:String):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.displayHint(arg1);
		return;
	}

	public function addOverlay(arg1:com.google.maps.interfaces.IOverlay):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.addOverlay(this.extWrapper.wrapIOverlay(arg1));
		return;
	}

	public function registerOverlayOnPane(arg1:Float, arg2:com.google.maps.interfaces.IOverlay):flash.display.Sprite
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.registerOverlayOnPane(arg1, this.extWrapper.wrapIOverlay(arg2));
	}

	public function getSize():openfl.geom.Point
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getSize();
	}

	public function zoomOut(arg1:com.google.maps.LatLng=null, arg2:Bool=false):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.zoomOut(this.extWrapper.wrapLatLng(arg1), arg2);
		return;
	}

	public function scrollWheelZoomEnabled():Bool
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.scrollWheelZoomEnabled();
	}

	public function disableContinuousZoom():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.disableContinuousZoom();
		return;
	}

	public function closeInfoWindow():Bool
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.closeInfoWindow();
	}

	public function fromLatLngToPoint(arg1:com.google.maps.LatLng, arg2:Float=NaN):openfl.geom.Point
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.fromLatLngToPoint(this.extWrapper.wrapLatLng(arg1), arg2);
	}

	public function returnToSavedPosition():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.returnToSavedPosition();
		return;
	}

	public function addMapType(arg1:com.google.maps.interfaces.IMapType):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.addMapType(this.extWrapper.wrapIMapType(arg1));
		return;
	}

	public function getMaxZoomLevel(arg1:com.google.maps.interfaces.IMapType=null, arg2:com.google.maps.LatLng=null):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getMaxZoomLevel(this.extWrapper.wrapIMapType(arg1), this.extWrapper.wrapLatLng(arg2));
	}

	public function draggingEnabled():Bool
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.draggingEnabled();
	}

	public function getDisplayObject():flash.display.DisplayObject
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getDisplayObject();
	}

	//public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
	
	private function getInterfaceChain():Array<Dynamic>
	{
		return ["IMap"];
	}

	public function getImplementationVersion():String
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getImplementationVersion();
	}

	public function removeOverlay(arg1:com.google.maps.interfaces.IOverlay):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.removeOverlay(this.extWrapper.wrapIOverlay(arg1));
		return;
	}

	public function getCenter():com.google.maps.LatLng
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.getCenter());
	}

	public function setZoom(arg1:Float):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.setZoom(arg1);
		return;
	}

	public function setCenter(arg1:com.google.maps.LatLng, arg2:Float=NaN, arg3:com.google.maps.interfaces.IMapType=null):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.setCenter(this.extWrapper.wrapLatLng(arg1), arg2, this.extWrapper.wrapIMapType(arg3));
		return;
	}

	public function continuousZoomEnabled():Bool
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.continuousZoomEnabled();
	}

	public function addControl(arg1:com.google.maps.interfaces.IControl):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.addControl(this.extWrapper.wrapIControl(arg1));
		return;
	}

	public function enableScrollWheelZoom():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.enableScrollWheelZoom();
		return;
	}

	public function fromPointToLatLng(arg1:openfl.geom.Point, arg2:Float=NaN, arg3:Bool=false):com.google.maps.LatLng
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapLatLng(this.instance.fromPointToLatLng(arg1, arg2, arg3));
	}

	public function setSize(arg1:openfl.geom.Point):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.setSize(arg1);
		return;
	}

	public function clearOverlays():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.clearOverlays();
		return;
	}

	public function disableScrollWheelZoom():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.disableScrollWheelZoom();
		return;
	}

	public function removeMapType(arg1:com.google.maps.interfaces.IMapType):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.removeMapType(this.extWrapper.wrapIMapType(arg1));
		return;
	}

	public function monitorCopyright(arg1:com.google.maps.interfaces.IMap):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.monitorCopyright(this.extWrapper.wrapIMap(arg1));
		return;
	}

	public function getMinZoomLevel(arg1:com.google.maps.interfaces.IMapType=null, arg2:com.google.maps.LatLng=null):Float
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.getMinZoomLevel(this.extWrapper.wrapIMapType(arg1), this.extWrapper.wrapLatLng(arg2));
	}

	public function savePosition():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.savePosition();
		return;
	}

	public function isLoaded():Bool
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return this.instance.isLoaded();
	}

	public function getLatLngBounds():com.google.maps.LatLngBounds
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapLatLngBounds(this.instance.getLatLngBounds());
	}

	public function panBy(arg1:openfl.geom.Point):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.panBy(arg1);
		return;
	}

	public function enableContinuousZoom():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.enableContinuousZoom();
		return;
	}

	public function getMapTypes():Array<Dynamic>
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapIMapTypeArray(this.instance.getMapTypes());
	}

	public function getMercatorProjection():com.google.maps.interfaces.IProjection
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		return com.google.maps.wrappers.Wrapper.instance().wrapIProjection(this.instance.MERCATOR_PROJECTION);
	}

	public function enableDragging():Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.enableDragging();
		return;
	}

	public function panTo(arg1:com.google.maps.LatLng):Void
	{
		com.google.maps.wrappers.Wrapper.checkValid(this.instance);
		this.instance.panTo(this.extWrapper.wrapLatLng(arg1));
		return;
	}
}