package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.controls.*;
import com.google.maps.interfaces.*;
import com.google.maps.overlays.*;
import flash.display.*;
import flash.events.*;

class IMapsFactoryWrapper extends com.google.maps.wrappers.WrapperBase implements com.google.maps.interfaces.IMapsFactory
{
public function new()
{
	super();
	return;
}

public function createMapTypeControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.MapTypeControlOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createMapTypeControl(arg1, this.extWrapper.wrapIEventDispatcher(arg2), this.extWrapper.wrapMapTypeControlOptions(arg3));
}

public function createPolygonFromEncoded(arg1:Array<Dynamic>, arg2:com.google.maps.overlays.PolygonOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createPolygonFromEncoded(arg1, this.extWrapper.wrapPolygonOptions(arg2));
}

public override var interfaceChain(getInterfaceChain, null):Array<Dynamic>;
 	private function getInterfaceChain():Array
{
	return ["IMapsFactory"];
}

public function setDefaultPolygonOptions(arg1:com.google.maps.overlays.PolygonOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setDefaultPolygonOptions(this.extWrapper.wrapPolygonOptions(arg1));
	return;
}

public function createPolylineFromEncoded(arg1:String, arg2:Float, arg3:String, arg4:Float, arg5:com.google.maps.overlays.PolylineOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createPolylineFromEncoded(arg1, arg2, arg3, arg4, this.extWrapper.wrapPolylineOptions(arg5));
}

public function createMapType(arg1:Array<Dynamic>, arg2:com.google.maps.interfaces.IProjection, arg3:String, arg4:com.google.maps.MapTypeOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createMapType(this.extWrapper.wrapITileLayerArray(arg1), this.extWrapper.wrapIProjection(arg2), arg3, this.extWrapper.wrapMapTypeOptions(arg4));
}

public function createPolygon(arg1:Array<Dynamic>, arg2:com.google.maps.overlays.PolygonOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createPolygon(this.extWrapper.wrapLatLngArray(arg1), this.extWrapper.wrapPolygonOptions(arg2));
}

public function createCopyrightCollection(arg1:String=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createCopyrightCollection(arg1);
}

public function getDefaultMapType(arg1:String):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getDefaultMapType(arg1);
}

public function createGroundOverlay(arg1:flash.display.DisplayObject, arg2:com.google.maps.LatLngBounds, arg3:com.google.maps.overlays.GroundOverlayOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createGroundOverlay(arg1, this.extWrapper.wrapLatLngBounds(arg2), this.extWrapper.wrapGroundOverlayOptions(arg3));
}

public function getDefaultMarkerOptions():com.google.maps.overlays.MarkerOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapMarkerOptions(this.instance.getDefaultMarkerOptions());
}

public function setDefaultGroundOverlayOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setDefaultGroundOverlayOptions(this.extWrapper.wrapGroundOverlayOptions(arg1));
	return;
}

public function setDefaultPolylineOptions(arg1:com.google.maps.overlays.PolylineOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setDefaultPolylineOptions(this.extWrapper.wrapPolylineOptions(arg1));
	return;
}

public function createMap(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createMap(arg1, this.extWrapper.wrapIEventDispatcher(arg2));
}

public function setDefaultInfoWindowOptions(arg1:com.google.maps.InfoWindowOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setDefaultInfoWindowOptions(this.extWrapper.wrapInfoWindowOptions(arg1));
	return;
}

public function getDefaultPolylineOptions():com.google.maps.overlays.PolylineOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapPolylineOptions(this.instance.getDefaultPolylineOptions());
}

public function getDefaultInfoWindowOptions():com.google.maps.InfoWindowOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapInfoWindowOptions(this.instance.getDefaultInfoWindowOptions());
}

public function setDefaultMarkerOptions(arg1:com.google.maps.overlays.MarkerOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setDefaultMarkerOptions(this.extWrapper.wrapMarkerOptions(arg1));
	return;
}

public function getDefaultGroundOverlayOptions():com.google.maps.overlays.GroundOverlayOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapGroundOverlayOptions(this.instance.getDefaultGroundOverlayOptions());
}

public function createOverviewMapControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.OverviewMapControlOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createOverviewMapControl(arg1, this.extWrapper.wrapIEventDispatcher(arg2), this.extWrapper.wrapOverviewMapControlOptions(arg3));
}

public function createPositionControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.PositionControlOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createPositionControl(arg1, this.extWrapper.wrapIEventDispatcher(arg2), this.extWrapper.wrapPositionControlOptions(arg3));
}

public function createPolyline(arg1:Array<Dynamic>, arg2:com.google.maps.overlays.PolylineOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createPolyline(this.extWrapper.wrapLatLngArray(arg1), this.extWrapper.wrapPolylineOptions(arg2));
}

public function createMarker(arg1:com.google.maps.LatLng, arg2:com.google.maps.overlays.MarkerOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createMarker(this.extWrapper.wrapLatLng(arg1), this.extWrapper.wrapMarkerOptions(arg2));
}

public function getDefaultMapTypesList():Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.getDefaultMapTypesList();
}

public function setDefaultMapTypeOptions(arg1:com.google.maps.MapTypeOptions):Void
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	this.instance.setDefaultMapTypeOptions(this.extWrapper.wrapMapTypeOptions(arg1));
	return;
}

public function createZoomControl(arg1:flash.display.Sprite, arg2:flash.events.IEventDispatcher, arg3:com.google.maps.controls.ZoomControlOptions=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createZoomControl(arg1, this.extWrapper.wrapIEventDispatcher(arg2), this.extWrapper.wrapZoomControlOptions(arg3));
}

public function getDefaultPolygonOptions():com.google.maps.overlays.PolygonOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapPolygonOptions(this.instance.getDefaultPolygonOptions());
}

public function getDefaultMapTypeOptions():com.google.maps.MapTypeOptions
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return com.google.maps.wrappers.Wrapper.instance().wrapMapTypeOptions(this.instance.getDefaultMapTypeOptions());
}

public function createClientGeocoder(arg1:String=null, arg2:com.google.maps.LatLngBounds=null):Dynamic
{
	com.google.maps.wrappers.Wrapper.checkValid(this.instance);
	return this.instance.createClientGeocoder(arg1, this.extWrapper.wrapLatLngBounds(arg2));
}
}