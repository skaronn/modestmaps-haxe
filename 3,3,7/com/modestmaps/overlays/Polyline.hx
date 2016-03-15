package com.modestmaps.overlays;

import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.utils.Object;
import com.modestmaps.geo.Location;
/**
 * Polyline class that takes polyline data and draws it in the given style.
 * 
 * Polylines can be added using:
 * 
 * <pre>
 *  var polylineClip:PolylineClip = new PolylineClip(map);
 *  map.addChild(polylineClip);
 *  
 *  var polyline:Polyline = new Polyline('poly-id-1', [ new Location(10,10), new Location (20,20) ]);
 *  polylineClip.addPolyline(polyline);
 * </pre>
 * 
 * @see PolylineClip
 * 
 * Originally contributed by simonoliver.
 * 
 */

class Polyline
{
	public var id:String;
	public var locationsArray:Array<Location>;
	public var lineThickness:Float;
	public var lineColor:Float;
	public var lineAlpha:Float;
	public var pixelHinting:Bool;
	public var scaleMode:LineScaleMode;
	public var caps:CapsStyle;
	public var joints:JointStyle;
	public var miterLimit:Float;
		
	public function new(id:String, 
				 locationsArray:Array<Location>,
				 lineThickness:Float = 3,
				 lineColor:Float = 0xFF0000,
				 lineAlpha:Float = 1,
				 pixelHinting:Bool = false, 
				 scaleMode:LineScaleMode = null,
				 caps:CapsStyle = null,
				 joints:JointStyle = null,
				 miterLimit:Float = 3)
	{
		this.id = id;
		this.locationsArray = locationsArray;
		this.lineThickness = lineThickness;
		this.lineColor = lineColor;
		this.lineAlpha = lineAlpha;
		this.pixelHinting = pixelHinting;
		this.scaleMode = scaleMode;
		this.caps = caps;
		this.joints = joints;
		this.miterLimit = miterLimit;
	}
}