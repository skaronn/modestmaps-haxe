/**
 * VERSION: 12.0
 * DATE: 2012-01-14
 * AS3
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.plugins;

import com.greensock.TweenLite;
/**
 * [AS3/AS2 only] Although hex colors are technically numbers, if you try to tween them conventionally, 
 * you'll notice that they don't tween smoothly. To tween them properly, the red, green, and 
 * blue components must be extracted and tweened independently. The HexColorsPlugin makes it easy. 
 * To tween a property of your object that's a hex color to another hex color, just pass a hexColors 
 * Object with properties named the same as your object's hex color properties. For example, 
 * if myObject has a "myHexColor" property that you'd like to tween to red (<code>0xFF0000</code>) over the 
 * course of 2 seconds, you'd do:<p><code>
 * 	
 * 	TweenMax.to(myObject, 2, {hexColors:{myHexColor:0xFF0000}});</code></p>
 * 	
 * <p>You can pass in any number of properties. </p>
 * 
 * <p><b>USAGE:</b></p>
 * <listing version="3.0">
import com.greensock.TweenLite; 
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.HexColorsPlugin;
TweenPlugin.activate([HexColorsPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.

TweenLite.to(myObject, 2, {hexColors:{myProperty:0xFF0000}});
</listing>
 * 
 * <p>Or if you just want to tween a color and apply it somewhere on every frame, you could do:</p>
 * <listing version="3.0">
var myColor:Object = {hex:0xFF0000};
TweenLite.to(myColor, 2, {hexColors:{hex:0x0000FF}, onUpdate:applyColor});
function applyColor() {
mc.graphics.clear();
mc.graphics.beginFill(myColor.hex, 1);
mc.graphics.drawRect(0, 0, 100, 100);
mc.graphics.endFill();
}
</listing>
 * 
 * <p><strong>Copyright 2008-2014, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for <a href="http://www.greensock.com/club/">Club GreenSock</a> members, the software agreement that was issued with the membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */
class HexColorsPlugin extends TweenPlugin {
/** @private **/
public static inline var API:Float = 2; //If the API/Framework for plugins changes in the future, this number helps determine compatibility

/** @private **/
private var _colors:Array;

/** @private **/
public function new() {
	super("hexColors");
	_overwriteProps = [];
	_colors = [];
}

/** @private **/
override public function _onInitTween(target:Object, value:Dynamic, tween:TweenLite):Bool {
	for (var p:String in value) {
	_initColor(target, p, uint(value[p]));
	}
	return true;
}

/** @private **/
public function _initColor(target:Object, p:String, end:UInt):Void {
	var isFunc:Bool = (typeof(target[p]) == "function"),
	start:UInt = (!isFunc) ? target[p] : target[ ((p.indexOf("set") || !("get" + p.substr(3) in target)) ? p : "get" + p.substr(3)) ]();
	if (start != end) {
	var r:UInt = start >> 16,
		g:UInt = (start >> 8) & 0xff,
		b:UInt = start & 0xff;
	_colors[_colors.length] = new ColorProp(target, p, isFunc, r, (end >> 16) - r, g, ((end >> 8) & 0xff) - g, b, (end & 0xff) - b);
	_overwriteProps[_overwriteProps.length] = p;
	}
}

/** @private **/
override public function _kill(lookup:Object):Bool {
	var i:Int = _colors.length;
	while (i--) {
	if (lookup[_colors[i].p] != null) {
		_colors.splice(i, 1);
	}
	}
	return super._kill(lookup);
}	

/** @private **/
override public function setRatio(v:Float):Void {
	var i:Int = _colors.length, clr:ColorProp, val:Float;
	while (--i > -1) {
	clr = _colors[i];
	val = (clr.rs + (v * clr.rc)) << 16 | (clr.gs + (v * clr.gc)) << 8 | (clr.bs + (v * clr.bc));
	if (clr.f) {
		clr.t[clr.p](val);
	} else {
		clr.t[clr.p] = val;
	}
	}
}


}
}

internal class ColorProp {
public var t:Object;
public var p:String;
public var f:Bool;
public var rs:Int;
public var rc:Int;
public var gs:Int;
public var gc:Int;
public var bs:Int;
public var bc:Int;

public function ColorProp(t:Object, p:String, f:Bool, rs:Int, rc:Int, gs:Int, gc:Int, bs:Int, bc:Int) {
this.t = t;
this.p = p;
this.f = f;
this.rs = rs;
this.rc = rc;
this.gs = gs;
this.gc = gc;
this.bs = bs;
this.bc = bc;
}