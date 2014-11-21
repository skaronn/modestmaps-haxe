package com.google.maps.wrappers;

import com.google.maps.*;
import com.google.maps.controls.*;
import com.google.maps.interfaces.*;
import com.google.maps.overlays.*;
import com.google.maps.services.*;
import com.google.maps.styles.*;
import flash.errors.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;
import haxe.ds.ObjectMap;

class Wrapper 
{
	public function new()
	{
		initializeObjectMaps();
		return;
	}

	public function wrapButtonStyle(arg1:Dynamic):com.google.maps.styles.ButtonStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.ButtonStyle.fromObject(arg1);
	}

	public function wrapICopyrightCollection(arg1:Dynamic, arg2:com.google.maps.wrappers.ICopyrightCollectionWrapper=null):com.google.maps.interfaces.ICopyrightCollection
	{
		return com.google.maps.interfaces.ICopyrightCollection(wrap(arg1, arg2, com.google.maps.interfaces.ICopyrightCollection, com.google.maps.wrappers.ICopyrightCollectionWrapper));
	}

	public function wrapLatLng(arg1:Dynamic):com.google.maps.LatLng
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.LatLng.fromObject(arg1);
	}

	public function wrapCopyrightNoticeArray(arg1:Dynamic):Array<Dynamic>
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = NaN;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = [];
		loc2 = arg1.length;
		loc3 = 0;
		while (loc3 < loc2) 
		{
			loc1.push(this.wrapCopyrightNotice(arg1[loc3]));
			loc3 = (loc3 + 1);
		}
		return loc1;
	}

	public function wrapITileLayerArray(arg1:Dynamic):Array<Dynamic>
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = NaN;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = [];
		loc2 = arg1.length;
		loc3 = 0;
		while (loc3 < loc2) 
		{
			loc1.push(this.wrapITileLayer(arg1[loc3]));
			loc3 = (loc3 + 1);
		}
		return loc1;
	}

	public function wrapIOverlay(arg1:Dynamic, arg2:com.google.maps.wrappers.IOverlayWrapper=null):com.google.maps.interfaces.IOverlay
	{
		return com.google.maps.interfaces.IOverlay(wrap(arg1, arg2, com.google.maps.interfaces.IOverlay, com.google.maps.wrappers.IOverlayWrapper));
	}

	public function wrapPolylineOptions(arg1:Dynamic):com.google.maps.overlays.PolylineOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.overlays.PolylineOptions.fromObject(arg1);
	}

	public function wrapIMap(arg1:Dynamic, arg2:com.google.maps.wrappers.IMapWrapper=null):com.google.maps.interfaces.IMap
	{
		return com.google.maps.interfaces.IMap(wrap(arg1, arg2, com.google.maps.interfaces.IMap, com.google.maps.wrappers.IMapWrapper));
	}

	public function wrapIControl(arg1:Dynamic, arg2:com.google.maps.wrappers.IControlWrapper=null):com.google.maps.interfaces.IControl
	{
		return com.google.maps.interfaces.IControl(wrap(arg1, arg2, com.google.maps.interfaces.IControl, com.google.maps.wrappers.IControlWrapper));
	}

	public function wrapIPolyline(arg1:Dynamic, arg2:com.google.maps.wrappers.IPolylineWrapper=null):com.google.maps.interfaces.IPolyline
	{
		return com.google.maps.interfaces.IPolyline(wrap(arg1, arg2, com.google.maps.interfaces.IPolyline, com.google.maps.wrappers.IPolylineWrapper));
	}

	public function wrapIEventDispatcher(arg1:Dynamic, arg2:com.google.maps.wrappers.EventDispatcherWrapper=null):flash.events.IEventDispatcher
	{
		return flash.events.IEventDispatcher(wrap(arg1, arg2, flash.events.IEventDispatcher, com.google.maps.wrappers.EventDispatcherWrapper));
	}

	public function wrapTextField(arg1:flash.text.TextField):flash.text.TextField
	{
		return arg1;
	}

	public function wrapCopyright(arg1:Dynamic):com.google.maps.Copyright
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.Copyright.fromObject(arg1);
	}

	public function wrapZoomControlOptions(arg1:Dynamic):com.google.maps.controls.ZoomControlOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.controls.ZoomControlOptions.fromObject(arg1);
	}

	private function initializeObjectMaps():Void
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = {};
		loc1["IControl"] = com.google.maps.wrappers.IControlWrapper;
		loc1["ICopyrightCollection"] = com.google.maps.wrappers.ICopyrightCollectionWrapper;
		loc1["IClientGeocoder"] = com.google.maps.wrappers.IClientGeocoderWrapper;
		loc1["IGroundOverlay"] = com.google.maps.wrappers.IGroundOverlayWrapper;
		loc1["IInfoWindow"] = com.google.maps.wrappers.IInfoWindowWrapper;
		loc1["IClientFactory"] = com.google.maps.wrappers.IClientFactoryWrapper;
		loc1["IMap"] = com.google.maps.wrappers.IMapWrapper;
		loc1["IMapsFactory"] = com.google.maps.wrappers.IMapsFactoryWrapper;
		loc1["IMapType"] = com.google.maps.wrappers.IMapTypeWrapper;
		loc1["IMapTypeControl"] = com.google.maps.wrappers.IMapTypeControlWrapper;
		loc1["IMarker"] = com.google.maps.wrappers.IMarkerWrapper;
		loc1["IOverviewMapControl"] = com.google.maps.wrappers.IOverviewMapControlWrapper;
		loc1["IPolygon"] = com.google.maps.wrappers.IPolygonWrapper;
		loc1["IPolyline"] = com.google.maps.wrappers.IPolylineWrapper;
		loc1["IPositionControl"] = com.google.maps.wrappers.IPositionControlWrapper;
		loc1["IProjection"] = com.google.maps.wrappers.IProjectionWrapper;
		loc1["IOverlay"] = com.google.maps.wrappers.IOverlayWrapper;
		loc1["ITileLayer"] = com.google.maps.wrappers.ITileLayerWrapper;
		loc1["IZoomControl"] = com.google.maps.wrappers.IZoomControlWrapper;
		this.wrappersMap = loc1;
		loc1 = {};
		loc1["MapEvent"] = com.google.maps.MapEvent.fromCrossDomainEvent;
		loc1["MapMouseEvent"] = com.google.maps.MapMouseEvent.fromCrossDomainEvent;
		loc1["MapMoveEvent"] = com.google.maps.MapMoveEvent.fromCrossDomainEvent;
		loc1["MapZoomEvent"] = com.google.maps.MapZoomEvent.fromCrossDomainEvent;
		loc1["GeocodingEvent"] = com.google.maps.services.GeocodingEvent.fromCrossDomainEvent;
		this.eventMap = loc1;
		return;
	}

	public function wrapButtonFaceStyle(arg1:Dynamic):com.google.maps.styles.ButtonFaceStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.ButtonFaceStyle.fromObject(arg1);
	}

	public function wrapIMapTypeArray(arg1:Dynamic):Array<Dynamic>
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = NaN;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = [];
		loc2 = arg1.length;
		loc3 = 0;
		while (loc3 < loc2) 
		{
			loc1.push(this.wrapIMapType(arg1[loc3]));
			loc3 = (loc3 + 1);
		}
		return loc1;
	}

	public function wrapPlacemark(arg1:Dynamic):com.google.maps.services.Placemark
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.services.Placemark.fromObject(arg1);
	}

	public function wrapMapTypeControlOptions(arg1:Dynamic):com.google.maps.controls.MapTypeControlOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.controls.MapTypeControlOptions.fromObject(arg1);
	}

	public function wrapStrokeStyle(arg1:Dynamic):com.google.maps.styles.StrokeStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.StrokeStyle.fromObject(arg1);
	}

	public function wrapGeocodingResponse(arg1:Dynamic):com.google.maps.services.GeocodingResponse
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.services.GeocodingResponse.fromObject(arg1);
	}

	public function wrapIMapsFactory(arg1:Dynamic, arg2:com.google.maps.wrappers.IMapsFactoryWrapper=null):com.google.maps.interfaces.IMapsFactory
	{
		return com.google.maps.interfaces.IMapsFactory(wrap(arg1, arg2, com.google.maps.interfaces.IMapsFactory, com.google.maps.wrappers.IMapsFactoryWrapper));
	}

	public function wrapIPositionControl(arg1:Dynamic, arg2:com.google.maps.wrappers.IPositionControlWrapper=null):com.google.maps.interfaces.IPositionControl
	{
		return com.google.maps.interfaces.IPositionControl(wrap(arg1, arg2, com.google.maps.interfaces.IPositionControl, com.google.maps.wrappers.IPositionControlWrapper));
	}

	public function wrapGradientStyle(arg1:Dynamic):com.google.maps.styles.GradientStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.GradientStyle.fromObject(arg1);
	}

	public function wrapColor(arg1:Dynamic):com.google.maps.Color
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.Color.fromObject(arg1);
	}

	public function wrapEventHandler(arg1:Dynamic, arg2:Dynamic=null):Dynamic
	{
		var handler:Dynamic;
		var target:Dynamic=null;

		var loc1:Dynamic;
		handler = arg1;
		target = arg2;
		return function (arg1:flash.events.Event):Void
		{
			handler(wrapEvent(arg1, target ? target : arg1.target));
			return;
		}
	}

	public function wrapCopyrightArray(arg1:Dynamic):Array<Dynamic>
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = NaN;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = [];
		loc2 = arg1.length;
		loc3 = 0;
		while (loc3 < loc2) 
		{
			loc1.push(this.wrapCopyright(arg1[loc3]));
			loc3 = (loc3 + 1);
		}
		return loc1;
	}

	public function wrapIClientFactory(arg1:Dynamic, arg2:com.google.maps.wrappers.IClientFactoryWrapper=null):com.google.maps.interfaces.IClientFactory
	{
		return com.google.maps.interfaces.IClientFactory(wrap(arg1, arg2, com.google.maps.interfaces.IClientFactory, com.google.maps.wrappers.IClientFactoryWrapper));
	}

	public function wrapBevelStyle(arg1:Dynamic):com.google.maps.styles.BevelStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.BevelStyle.fromObject(arg1);
	}

	public function wrapLatLngBounds(arg1:Dynamic):com.google.maps.LatLngBounds
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.LatLngBounds.fromObject(arg1);
	}

	public function wrapLatLngArray(arg1:Dynamic):Array<Dynamic>
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = NaN;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = [];
		loc2 = arg1.length;
		loc3 = 0;
		while (loc3 < loc2) 
		{
			loc1.push(this.wrapLatLng(arg1[loc3]));
			loc3 = (loc3 + 1);
		}
		return loc1;
	}

	public function wrap(arg1:Dynamic, arg2:Dynamic, arg3:Type, arg4:Type):Dynamic
	{
		var loc1:haxe.ds.ObjectMapDynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = null;
		var loc3:Dynamic;
		loc3 = NaN;
		var loc4:Dynamic;
		loc4 = null;
		var loc5:Dynamic;
		loc5 = null;
		if (arg1 == null)
		{
			return null;
		}
		if (arg2 == null)
		{
			//if ((loc1 = cast(arg1.wrapper, Type.getClassName(Type.getClass(arg3))))) != null)
			if (loc1 != null)
			{
					return loc1;
			}
			if ((loc2 = arg1.interfaceChain) != null)
			{
				loc3 = 0;
				while (loc3 < loc2.length) 
				{
					loc4 = loc2[loc3];
					
					if ((loc5 = cast(wrappersMap[loc4], Type)) != null)
					{
						//arg2 = new loc5() as arg3;
						if (arg2 != null)
						{
							trace("Created wrapper for: " + loc4);
						}
					}
					loc3 = (loc3 + 1);
				}
			}
			if (arg2 == null)
			{
				//arg2 = new arg4();
			}
		}
		arg2.initializeWrapper(arg1, this.alienWrapper);
		arg1.wrapper = arg2;
		return arg2;
	}

	public function wrapITileLayer(arg1:Dynamic, arg2:com.google.maps.wrappers.ITileLayerWrapper=null):com.google.maps.interfaces.ITileLayer
	{
		return com.google.maps.interfaces.ITileLayer(wrap(arg1, arg2, com.google.maps.interfaces.ITileLayer, com.google.maps.wrappers.ITileLayerWrapper));
	}

	public function setAlienWrapper(arg1:Dynamic):Void
	{
		if (this.alienWrapper == null)
		{
			this.alienWrapper = arg1;
			arg1.setAlienWrapper(this);
		}
		return;
	}

	public function wrapPlacemarkArray(arg1:Dynamic):Array<Dynamic>
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = NaN;
		if (arg1 == null)
		{
			return null;
		}
		loc1 = [];
		loc2 = arg1.length;
		loc3 = 0;
		while (loc3 < loc2) 
		{
			loc1.push(this.wrapPlacemark(arg1[loc3]));
			loc3 = (loc3 + 1);
		}
		return loc1;
	}

	public function wrapIGroundOverlay(arg1:Dynamic, arg2:com.google.maps.wrappers.IGroundOverlayWrapper=null):com.google.maps.interfaces.IGroundOverlay
	{
		return com.google.maps.interfaces.IGroundOverlay(wrap(arg1, arg2, com.google.maps.interfaces.IGroundOverlay, com.google.maps.wrappers.IGroundOverlayWrapper));
	}

	public function wrapIZoomControl(arg1:Dynamic, arg2:com.google.maps.wrappers.IZoomControlWrapper=null):com.google.maps.interfaces.IZoomControl
	{
		return com.google.maps.interfaces.IZoomControl(wrap(arg1, arg2, com.google.maps.interfaces.IZoomControl, com.google.maps.wrappers.IZoomControlWrapper));
	}

	public function wrapFillStyle(arg1:Dynamic):com.google.maps.styles.FillStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.FillStyle.fromObject(arg1);
	}

	public function wrapR1Interval(arg1:Dynamic):com.google.maps.R1Interval
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.R1Interval.fromObject(arg1);
	}

	public function wrapInfoWindowOptions(arg1:Dynamic):com.google.maps.InfoWindowOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.InfoWindowOptions.fromObject(arg1);
	}

	public function wrapIMarker(arg1:Dynamic, arg2:com.google.maps.wrappers.IMarkerWrapper=null):com.google.maps.interfaces.IMarker
	{
		return com.google.maps.interfaces.IMarker(wrap(arg1, arg2, com.google.maps.interfaces.IMarker, com.google.maps.wrappers.IMarkerWrapper));
	}

	public function wrapOverviewMapControlOptions(arg1:Dynamic):com.google.maps.controls.OverviewMapControlOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.controls.OverviewMapControlOptions.fromObject(arg1);
	}

	public function wrapCopyrightNotice(arg1:Dynamic):com.google.maps.CopyrightNotice
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.CopyrightNotice.fromObject(arg1);
	}

	public function wrapIInfoWindow(arg1:Dynamic, arg2:com.google.maps.wrappers.IInfoWindowWrapper=null):com.google.maps.interfaces.IInfoWindow
	{
		return com.google.maps.interfaces.IInfoWindow(wrap(arg1, arg2, com.google.maps.interfaces.IInfoWindow, com.google.maps.wrappers.IInfoWindowWrapper));
	}

	public function wrapIOverviewMapControl(arg1:Dynamic, arg2:com.google.maps.wrappers.IOverviewMapControlWrapper=null):com.google.maps.interfaces.IOverviewMapControl
	{
		return com.google.maps.interfaces.IOverviewMapControl(wrap(arg1, arg2, com.google.maps.interfaces.IOverviewMapControl, com.google.maps.wrappers.IOverviewMapControlWrapper));
	}

	public function wrapMarkerOptions(arg1:Dynamic):com.google.maps.overlays.MarkerOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.overlays.MarkerOptions.fromObject(arg1);
	}

	public function wrapIMapTypeControl(arg1:Dynamic, arg2:com.google.maps.wrappers.IMapTypeControlWrapper=null):com.google.maps.interfaces.IMapTypeControl
	{
		return com.google.maps.interfaces.IMapTypeControl(wrap(arg1, arg2, com.google.maps.interfaces.IMapTypeControl, com.google.maps.wrappers.IMapTypeControlWrapper));
	}

	public function wrapRectangleStyle(arg1:Dynamic):com.google.maps.styles.RectangleStyle
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.styles.RectangleStyle.fromObject(arg1);
	}

	public function wrapS1Interval(arg1:Dynamic):com.google.maps.S1Interval
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.S1Interval.fromObject(arg1);
	}

	public function wrapIProjection(arg1:Dynamic, arg2:com.google.maps.wrappers.IProjectionWrapper=null):com.google.maps.interfaces.IProjection
	{
		return com.google.maps.interfaces.IProjection(wrap(arg1, arg2, com.google.maps.interfaces.IProjection, com.google.maps.wrappers.IProjectionWrapper));
	}

	private function wrapEvent(arg1:flash.events.Event, arg2:Dynamic):flash.events.Event
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = null;
		var loc3:Dynamic;
		loc3 = Math.NaN;
		var loc4:Dynamic;
		loc4 = null;
		var loc5:Dynamic;
		loc5 = null;
		loc1 = arg1;
		if (!loc1.hasOwnProperty("eventClassChain"))
		{
			return arg1;
		}
		if ((loc2 = loc1.eventClassChain) != null)
		{
			loc3 = 0;
			while (loc3 < loc2.length) 
			{
				loc4 = loc2[loc3];
				if ((loc5 = cast(eventMap.get(loc4), Dynamic)) != null)
				{
					return loc5(arg1, arg2);
				}
				loc3 = (loc3 + 1);
			}
		}
		return arg1;
	}

	public function wrapMapTypeOptions(arg1:Dynamic):com.google.maps.MapTypeOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.MapTypeOptions.fromObject(arg1);
	}

	public function wrapPositionControlOptions(arg1:Dynamic):com.google.maps.controls.PositionControlOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.controls.PositionControlOptions.fromObject(arg1);
	}

	public function wrapPolygonOptions(arg1:Dynamic):com.google.maps.overlays.PolygonOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.overlays.PolygonOptions.fromObject(arg1);
	}

	public function wrapIMapType(arg1:Dynamic, arg2:com.google.maps.wrappers.IMapTypeWrapper=null):com.google.maps.interfaces.IMapType
	{
		return com.google.maps.interfaces.IMapType(wrap(arg1, arg2, com.google.maps.interfaces.IMapType, com.google.maps.wrappers.IMapTypeWrapper));
	}

	public function wrapIPolygon(arg1:Dynamic, arg2:com.google.maps.wrappers.IPolygonWrapper=null):com.google.maps.interfaces.IPolygon
	{
		return com.google.maps.interfaces.IPolygon(wrap(arg1, arg2, com.google.maps.interfaces.IPolygon, com.google.maps.wrappers.IPolygonWrapper));
	}

	public function wrapControlPosition(arg1:Dynamic):com.google.maps.controls.ControlPosition
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.controls.ControlPosition.fromObject(arg1);
	}

	public function wrapIClientGeocoder(arg1:Dynamic, arg2:com.google.maps.wrappers.IClientGeocoderWrapper=null):com.google.maps.interfaces.IClientGeocoder
	{
		return com.google.maps.interfaces.IClientGeocoder(wrap(arg1, arg2, com.google.maps.interfaces.IClientGeocoder, com.google.maps.wrappers.IClientGeocoderWrapper));
	}

	public function wrapGroundOverlayOptions(arg1:Dynamic):com.google.maps.overlays.GroundOverlayOptions
	{
		if (arg1 == null)
		{
			return null;
		}
		return com.google.maps.overlays.GroundOverlayOptions.fromObject(arg1);
	}

	public static function cloneArray(arg1:Array<Dynamic, Dynamic>, arg2:Bool=false):Array
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = NaN;
		var loc3:Dynamic;
		loc3 = undefined;
		var loc4:Dynamic;
		loc4 = null;
		if (!arg2)
		{
			return [].concat(arg1);
		}
		loc1 = [];
		loc2 = 0;
		while (loc2 < arg1.length) 
		{
			//loc3 = cast(arg1.get(loc2)), Array<Dynamic>;
			if ((loc4 = loc3) == null)
			{
				loc1.push(loc3);
			}
			else 
			{
				loc1.push(cloneArray(loc4));
			}
			loc2 = (loc2 + 1);
		}
		return loc1;
	}

	public static function checkValid(arg1:Dynamic):Void
	{
		if (arg1 == null)
		{
			throw new flash.errors.IllegalOperationError("Object not initialized");
		}
		return;
	}

	public static function instance():com.google.maps.wrappers.Wrapper
	{
		if (com.google.maps.wrappers.Wrapper.nativeWrapper == null)
		{
			com.google.maps.wrappers.Wrapper.nativeWrapper = new Wrapper();
		}
		return com.google.maps.wrappers.Wrapper.nativeWrapper;
	}

	public static function copyStyleSheetProperties(arg1:flash.text.StyleSheet, arg2:Dynamic):Void
	{
		var loc1:Dynamic;
		loc1 = 0;
		var loc2:Dynamic;
		loc2 = null;
		if (!(arg2.styleNames == null) && cast(arg2.styleNames, Array<Dynamic>) != null)
		{
			loc1 = 0;
			while (loc1 < arg2.styleNames.length) 
			{
				loc2 = arg2.styleNames[loc1];
				arg1.setStyle(loc2, arg2.getStyle(loc2));
				++loc1;
			}
		}
		return;
	}

	public static function mergeStyles(arg1:Type, arg2:Array<Dynamic>):Dynamic
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = false;
		var loc3:Dynamic;
		loc3 = Math.NaN;
		if (arg2 == null)
		{
			return null;
		}
		//loc1 = new arg1();
		loc1 = arg1;
		loc2 = false;
		loc3 = 0;
		while (loc3 < arg2.length) 
		{
			if (arg2[loc3] != null)
			{
				loc1.copyFromObject(arg2[loc3]);
				loc2 = true;
			}
			loc3 = (loc3 + 1);
		}
		return loc2 ? loc1 : null;
	}

	public static function copyObject(arg1:Dynamic, arg2:Dynamic):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = 0;
		var loc3:Dynamic;
		loc3 = arg2;
		for (loc1 in loc3)
		{
			if (arg1[loc1] != null)
			{
				continue;
			}
			arg1[loc1] = arg2[loc1];
		}
		return;
	}

	public static function copyPointProperties(arg1:openfl.geom.Point, arg2:Dynamic):Void
	{
		copyProperties(arg1, arg2, ["x", "y"], Number);
		return;
	}

	public static function copyTextFormatProperties(arg1:openfl.text.TextFormat, arg2:Dynamic):Void
	{
		copyProperties(arg1, arg2, ["align", "font", "target", "url"], String);
		copyProperties(arg1, arg2, ["bold", "bullet", "italic", "kerning", "underline"], Bool);
		copyProperties(arg1, arg2, ["blockIndent", "color", "indent", "leading", "leftMargin", "letterSpacing", "rightMargin", "size"], Number);
		if (!(arg2.tabStops == null) && cast(arg2.tabStops, Array<Dynamic>))
		{
			arg1.tabStops = cloneArray(arg2.tabStops);
		}
		return;
	}

	public static function copyProperties(arg1:Dynamic, arg2:Dynamic, arg3:Array<Dynamic>, arg4:Type=null):Void
	{
		var loc1:Dynamic;
		loc1 = NaN;
		var loc2:Dynamic;
		loc2 = null;
		var loc3:Dynamic;
		loc3 = null;
		var loc4:Dynamic;
		loc4 = null;
		loc1 = 0;
		while (loc1 < arg3.length) 
		{
		loc2 = arg3[loc1];
		loc3 = arg2[loc2];
		if (arg4 == null)
		{
			arg1[loc2] = loc3;
		}
		else 
		{
			loc3 = cast arg4;
			if ((loc4 = loc3) != null)
			{
				arg1[loc2] = loc3;
			}
		}
		loc1 = (loc1 + 1);
		}
		return;
	}

	private var wrappersMap:Dynamic;

	private var alienWrapper:Dynamic;

	private var eventMap:ObjectMap<Dynamic, Dynamic>;

	private static var nativeWrapper:com.google.maps.wrappers.Wrapper;
}