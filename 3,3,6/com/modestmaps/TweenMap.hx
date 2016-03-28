/**
 * vim:et sts=4 sw=4 cindent:
 * @ignore
 *
 * @author tom
 *
 * com.modestmaps.TweenMap adds smooth animated panning and zooming to the basic Map class
 *
 */
package com.modestmaps;

import motion.easing.IEasing;
import openfl.events.MouseEvent;
import openfl.geom.Matrix;
import openfl.geom.Point;
//import openfl.utils.Object;

import motion.Actuate;
import motion.easing.Quad;

import com.modestmaps.core.Coordinate;
import com.modestmaps.core.MapExtent;
import com.modestmaps.core.TweenTile;
import com.modestmaps.geo.Location;
import com.modestmaps.mapproviders.IMapProvider;
import com.modestmaps.util.DebugUtil;

class TweenMap extends Map
{

	/** easing function used for panLeft, panRight, panUp, panDown */
	public var panEase:IEasing = Quad.easeOut;
	
	/** time to pan using panLeft, panRight, panUp, panDown */
	public var panDuration:Float = 0.5;

	/** easing function used for zoomIn, zoomOut */
	public var zoomEase:IEasing = Quad.easeOut;
	
	/** time to zoom using zoomIn, zoomOut */
	public var zoomDuration:Float = 0.2;

	/** time to pan and zoom using, uh, panAndZoom */
	public var panAndZoomDuration:Float = 0.3;

	private var mouseWheelingIn:Bool = false;
	private var mouseWheelingOut:Bool = false;

	/**
	* Initialize the map: set properties, add a tile grid, draw it.
	* Default extent covers the entire globe, (+/-85, +/-180).
	*
	* @param	Width of map, in pixels.
	* @param	Height of map, in pixels.
	* @param	Whether the map can be dragged or not.
	* @param	Desired map provider, e.g. Blue Marble.
	*
	* @see com.modestmaps.core.TileGrid
	*/
	public function new(width:Float = 320, height:Float = 240, draggable:Bool = true, provider:IMapProvider = null, rest:Array<Dynamic> = null)
	{
		trace("new : "+width+", "+height+", "+draggable+", "+provider+", "+rest);
		super(width, height, draggable, provider, rest);
		grid.setTileClass(TweenTile);
	}

	/** 
	* Pan by px and py, in panDuration (used by panLeft, panRight, panUp and panDown)
	*/
	override public function panBy(px:Float, py:Float):Void
	{
		trace("grid.panning : " + grid.panning + " && grid.zooming : " + grid.zooming);
		if (!grid.panning && !grid.zooming)
		{
			grid.prepareForPanning();
			//trace("panBy - grid : " + grid + ", panDuration : " + panDuration + ", tx : " + cast(grid.tx + px, Float) + ", ty : " + cast(grid.ty + py, Float) + ", onComplete : " + grid.donePanning + ", ease : " +panEase);
			//TweenLite.to(grid, panDuration, { tx: grid.tx + px, ty: grid.ty + py, onComplete: grid.donePanning, ease: panEase } );
			Actuate.tween(grid, panDuration, { tx: grid.tx + px, ty: grid.ty + py }).ease(panEase).onComplete(grid.donePanning);
		}
	}	  
		
	/** 
	* default easing function for panUp, panDown, panLeft, panRight, etc.
	*/
	private static function quadraticEaseOut(t:Float, b:Float, c:Float, d:Float):Float	
	{
		return -c * (t /= d) * (t - 2) + b;
	}

	private var enforceToRestore:Bool = false;

	public function tweenToMatrix(m:Matrix, duration:Float):Void
	{
		trace("tweenToMatrix");
		grid.prepareForZooming();
		grid.prepareForPanning();		
		enforceToRestore = grid.enforceBoundsEnabled;		
		grid.enforceBoundsEnabled = false;
		grid.enforceBoundsOnMatrix(m);
		
		//TweenLite.to(grid, duration, { a: m.a, b: m.b, c: m.c, d: m.d, tx: m.tx, ty: m.ty, onComplete: panAndZoomComplete });		
		Actuate.tween(grid, duration, { a: m.a, b: m.b, c: m.c, d: m.d, tx: m.tx, ty: m.ty}).ease(zoomEase).onComplete(panAndZoomComplete);		
		//grid.setMatrix(m);
		//panAndZoomComplete();
	}

	/** 
	* call grid.donePanning() and grid.doneZooming(), used by tweenExtent, 
	*  panAndZoomBy and zoomByAbout as a TweenLite onComplete function
	*/
	private function panAndZoomComplete():Void
	{
		grid.enforceBoundsEnabled = enforceToRestore;		
		grid.donePanning();
		grid.doneZooming();
	}	

	/** zoom in or out by sc, moving the given location to the requested target (or map center, if omitted) */	
	override public function panAndZoomBy(sc:Float, location:Location, targetPoint:Point = null, duration:Float = -1):Void	
	{
		if (duration < 0) duration = panAndZoomDuration;
		if (targetPoint == null) targetPoint = new Point(mapWidth / 2, mapHeight / 2);		
		
		var p:Point = locationPoint(location);
		
		var constrainedDelta:Float = Math.log(sc) / Math.log(2);

		if (grid.zoomLevel + constrainedDelta < grid.minZoom) {
			constrainedDelta = grid.minZoom - grid.zoomLevel;		
		}
		else if (grid.zoomLevel + constrainedDelta > grid.maxZoom) {
			constrainedDelta = grid.maxZoom - grid.zoomLevel; 
		}
		
		// round the zoom delta up or down so that we end up at a power of 2
		var preciseZoomDelta:Float = constrainedDelta + (Math.round(grid.zoomLevel + constrainedDelta) - (grid.zoomLevel + constrainedDelta));		
		
		sc = Math.pow(2, preciseZoomDelta);
		
		var m:Matrix = grid.getMatrix();
		
		m.translate(-p.x, -p.y);
		m.scale(sc, sc);
		m.translate(targetPoint.x, targetPoint.y);
		
		tweenToMatrix(m, duration);
	}

	/** zoom in or out by zoomDelta, keeping the requested point in the same place */	
	override public function zoomByAbout(zoomDelta:Float, targetPoint:Point = null, duration:Float = -1):Void	
	{
		if (duration < 0) duration = panAndZoomDuration;
		if (targetPoint == null) targetPoint = new Point(mapWidth / 2, mapHeight / 2);		

		var constrainedDelta:Float = zoomDelta;

		if (grid.zoomLevel + constrainedDelta < grid.minZoom) {
			constrainedDelta = grid.minZoom - grid.zoomLevel;		
		}
		else if (grid.zoomLevel + constrainedDelta > grid.maxZoom) {
			constrainedDelta = grid.maxZoom - grid.zoomLevel; 
		}
		
		// round the zoom delta up or down so that we end up at a power of 2
		var preciseZoomDelta:Float = constrainedDelta + (Math.round(grid.zoomLevel + constrainedDelta) - (grid.zoomLevel + constrainedDelta));		

		var sc:Float = Math.pow(2, preciseZoomDelta);
		
		var m:Matrix = grid.getMatrix();
		
		m.translate(-targetPoint.x, -targetPoint.y);
		m.scale(sc, sc);
		m.translate(targetPoint.x, targetPoint.y);
		
		tweenToMatrix(m, duration);
	}

	/** EXPERIMENTAL! */
	public function tweenExtent(extent:MapExtent, duration:Float = -1):Void
	{
		if (duration < 0) duration = panAndZoomDuration;

		var coord:Coordinate = locationsCoordinate([extent.northWest, extent.southEast]);

		var sc:Float = Math.pow(2, coord.zoom-grid.zoomLevel);
		
		var p:Point = grid.coordinatePoint(coord, grid);
		
		var m:Matrix = grid.getMatrix();
		
		m.translate(-p.x, -p.y);
		m.scale(sc, sc);
		m.translate(mapWidth / 2, mapHeight / 2);		
		
		tweenToMatrix(m, duration); 
	}

	/**
	* Put the given location in the middle of the map, animated in panDuration using panEase.
	* 
	* Use setCenter or setCenterZoom for big jumps, set forceAnimate to true
	* if you really want to animate to a location that's currently off screen.
	* But no promises! 
	* 
	* @see com.modestmaps.TweenMap#panDuration
	* @see com.modestmaps.TweenMap#panEase
	* @see com.modestmaps.TweenMap#tweenTo
	*/
	public function panTo(location:Location, forceAnimate:Bool = false):Void
	{
		var p:Point = locationPoint(location, grid);

		if (forceAnimate || (p.x >= 0 && p.x <= mapWidth && p.y >= 0 && p.y <= mapHeight))
		{
			var centerPoint:Point = new Point(mapWidth / 2, mapHeight / 2);
			var pan:Point = centerPoint.subtract(p);

			grid.prepareForPanning();
			//TweenLite.to(grid, panDuration, {ty: grid.ty + pan.y,
			//				 tx: grid.tx + pan.x,
			//				 ease: panEase,
			//				 onStart: grid.prepareForPanning,
			//				 onComplete: grid.donePanning});
			Actuate.tween(grid, panDuration, {ty: grid.ty + pan.y,
							 tx: grid.tx + pan.x})
							 .ease(panEase)
							 .onComplete(grid.donePanning);

		}
		else{
			setCenter(location);
		}
	}

	/**
	* Animate to put the given location in the middle of the map.
	* Use setCenter or setCenterZoom for big jumps, or panTo for pre-defined animation.
	* 
	* @see com.modestmaps.Map#panTo
	*/
	public function tweenTo(location:Location, duration:Float, easing:IEasing = null):Void
	{
		var pan:Point = new Point(mapWidth / 2, mapHeight / 2).subtract(locationPoint(location, grid));
		// grid.prepareForPanning();
		/*TweenLite.to(grid, duration, { ty: grid.ty + pan.y,
					   tx: grid.tx + pan.x,
					   ease: easing,
					   onStart: grid.prepareForPanning,
					   onComplete: grid.donePanning }); */
		if (easing == null) easing = Quad.easeOut;
		grid.prepareForPanning();
		Actuate.tween(grid, duration, { ty: grid.ty + pan.y,
					tx: grid.tx + pan.x})
					.ease(easing)
					.onComplete(grid.donePanning);
	}

	/**
	 * keeping it DRY, as they say	
	 * dir should be 1, for in, or -1, for out
	 * @param	dir
	 */
	override public function zoomBy(dir:Int):Void
	{
		if (!grid.panning)
		{
			var target:Float = (dir < 0) ? Math.floor(grid.zoomLevel + dir) : Math.ceil(grid.zoomLevel + dir);
			target = Math.max(grid.minZoom, Math.min(grid.maxZoom, target));
			trace("zoomBy : " + Std.string(dir));
			
			/*TweenLite.to(grid, zoomDuration, { zoomLevel: target,
							   onStart: grid.prepareForZooming,
							   onComplete: grid.doneZooming,
							   ease: zoomEase }); */
			grid.prepareForZooming;
			Actuate.tween(grid, zoomDuration, { zoomLevel: target})
				.ease(zoomEase)
				.onComplete(grid.doneZooming);
		}
	}

	/** 
	 * Zooms in or out of mouse-wheeled location, rounded off to nearest whole zoom level when zooming ends.
	 *
	 * @see http://blog.pixelbreaker.com/flash/swfmacmousewheel/ for Mac mouse wheel support  
	 */
	override public function onMouseWheel(event:MouseEvent):Void
	{	   	
		if (!__draggable || grid.panning) return;

		//TweenLite.killTweensOf(grid);
		//TweenLite.killDelayedCallsTo(doneMouseWheeling);
		Actuate.stop(grid);

		var sc:Float = 0;
		
		if (event.delta < 0) {
			
			if (grid.zoomLevel > grid.minZoom) {
				mouseWheelingOut = true;
				mouseWheelingIn = false;
				sc = Math.max(0.5, 1.0 + event.delta / 20.0);
			}
		}
		else if (event.delta > 0)
		{
			if (grid.zoomLevel < grid.maxZoom)
			{
				mouseWheelingIn = true;
				mouseWheelingOut = false;			
				sc = Math.min(2.0, 1.0 + event.delta / 20.0);
			}
		}

		/* trace('scale', sc);
		trace('delta', event.delta);
		trace('mouseWheelingIn', mouseWheelingIn);
		trace('mouseWheelingOut', mouseWheelingOut); */
		
		if (sc != 0)
		{
			var p:Point = grid.globalToLocal(new Point(event.stageX, event.stageY));		
			var m:Matrix = grid.getMatrix();
			m.translate(-p.x, -p.y);
			m.scale(sc, sc);
			m.translate(p.x, p.y);
			grid.setMatrix(m);		
		}
		
		//TweenLite.delayedCall(0.1, doneMouseWheeling);
		Actuate.timer(0.1).onComplete(doneMouseWheeling);
		
		event.updateAfterEvent();		
	}

	/**
	 * 
	 */
	private function doneMouseWheeling():Void
	{
		var p:Point = grid.globalToLocal(new Point(stage.mouseX, stage.mouseY));
		if (mouseWheelingIn) { 
			zoomByAbout(Math.ceil(grid.zoomLevel) - grid.zoomLevel, p, 0.15); // round off to whole value up
		}
		else if (mouseWheelingOut) { 
			zoomByAbout(Math.floor(grid.zoomLevel) - grid.zoomLevel, p, 0.15); // round off to whole value down
		}
		else {
			zoomByAbout(Math.round(grid.zoomLevel) - grid.zoomLevel, p, 0.15); // round off to whole value down
		}
		mouseWheelingOut = false;
		mouseWheelingIn = false;
	}

}