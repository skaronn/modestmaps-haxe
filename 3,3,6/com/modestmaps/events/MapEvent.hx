/*
 * $Id$
 */

package com.modestmaps.events;

import openfl.events.Event;
import openfl.geom.Point;
//import openfl.utils.Object;

import com.modestmaps.core.MapExtent;
import com.modestmaps.mapproviders.IMapProvider;
import com.modestmaps.util.DebugUtil;

class MapEvent extends Event
{
	public static inline var INITIALIZED:String = 'mapInitialized';
	public static inline var CHANGED:String = 'mapChanged';

	public static inline var START_ZOOMING:String = 'startZooming';
	public static inline var STOP_ZOOMING:String = 'stopZooming';
	public var zoomLevel:Float;

	public static inline var ZOOMED_BY:String = 'zoomedBy';
	public var zoomDelta:Float;

	public static inline var START_PANNING:String = 'startPanning';
	public static inline var STOP_PANNING:String = 'stopPanning';

	public static inline var PANNED:String = 'panned';
	public var panDelta:Point;

	public static inline var RESIZED:String = 'resized';
	public var newSize:Array<Dynamic>;
		
	public static inline var COPYRIGHT_CHANGED:String = 'copyrightChanged';
	public var newCopyright:String;

	public static inline var BEGIN_EXTENT_CHANGE:String = 'beginExtentChange';
	public var oldExtent:MapExtent;

	public static inline var EXTENT_CHANGED:String = 'extentChanged';
	public var newExtent:MapExtent;

	public static inline var MAP_PROVIDER_CHANGED:String = 'mapProviderChanged';
	public var newMapProvider:IMapProvider;

	public static inline var BEGIN_TILE_LOADING:String = 'beginTileLoading';
	public static inline var ALL_TILES_LOADED:String = 'alLTilesLoaded';

	/** listen out for this if you want to be sure map is in its final state before reprojecting markers etc. */
	public static inline var RENDERED:String = 'rendered';

	public function new(type:String, rest:Array<Dynamic> = null)	
	{
		super(type, true, true);
		
		if (type == RENDERED) {
			//trace("new - type : RENDERED, rest : " + rest);
			//DebugUtil.dumpStack(this, "new");
		}
		
		switch(type)
		{
			case PANNED:
				if (rest.length > 0 && Std.is(rest[0], Point))
				{
					//trace("PANNED - rest[0] : " + rest[0]);
					panDelta = cast(rest[0],Point);
				}
			case ZOOMED_BY:
				if (rest.length > 0 && Std.is(rest[0], Float))
				{
					//trace("ZOOMED_BY - rest[0] : "+rest[0]);
					zoomDelta = cast(rest[0],Float);
				}
			case EXTENT_CHANGED:
				if (rest.length > 0 && Std.is(rest[0], MapExtent))
				{
					//trace("EXTENT_CHANGED - rest[0] : "+rest[0]);
					newExtent = cast(rest[0],MapExtent);
				}
			case START_ZOOMING:
				if (rest.length > 0 && Std.is(rest[0], Float))
				{
					//trace("START_ZOOMING - rest[0] : "+rest[0]);
					zoomLevel = cast(rest[0],Float);
				}
			case STOP_ZOOMING:				
				if (rest.length > 0 && Std.is(rest[0], Float))
				{	
					//trace("STOP_ZOOMING - rest[0] : "+rest[0]);				
					zoomLevel = cast(rest[0],Float);
				}			
			case RESIZED:
				if (rest.length > 0 && Std.is(rest, Array))
				{
					//trace("RESIZED - rest : "+rest);
					newSize = cast(rest,Array<Dynamic>);
				}
			case COPYRIGHT_CHANGED:
				if (rest.length > 0 && Std.is(rest[0], String))
				{
					//trace("COPYRIGHT_CHANGED - rest[0] : "+rest[0]);
					newCopyright = cast(rest[0],String);
				}	
			case BEGIN_EXTENT_CHANGE:
				if (rest.length > 0 && Std.is(rest[0], MapExtent))
				{
					//trace("BEGIN_EXTENT_CHANGE - rest[0] : "+rest[0]);
					oldExtent = cast(rest[0],MapExtent);
				}		
			case MAP_PROVIDER_CHANGED:
				if (rest.length > 0 && Std.is(rest[0], IMapProvider))
				{
					//trace("MAP_PROVIDER_CHANGED - rest[0] : "+rest[0]);
					newMapProvider = cast(rest[0],IMapProvider);
				}
		}
	}

	override public function clone():Event
	{
		return new MapEvent(this.type);
	}
}