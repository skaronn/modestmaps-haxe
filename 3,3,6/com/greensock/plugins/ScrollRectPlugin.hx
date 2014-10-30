/**
 * VERSION: 12.0
 * DATE: 2012-01-14
 * AS3 
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.plugins;

import flash.display.DisplayObject;
import flash.geom.Rectangle;
import com.greensock.TweenLite;
/**
 * [AS3/AS2 only] Tweens the scrollRect property of a DisplayObject. You can define any (or all) of the following
 * properties:
 * <code>
 * <ul>
 * 	<li> x : Float</li>
 * 	<li> y : Float</li>
 * 	<li> width : Float</li>
 * 	<li> height : Float</li>
 * 	<li> top : Float</li>
 * 	<li> bottom : Float</li>
 * 	<li> left : Float</li>
 * 	<li> right : Float</li>
 * </ul>
 * </code><br />
 * 
 * <p><b>USAGE:</b></p>
 * <listing version="3.0">
import com.greensock.TweenLite; 
import com.greensock.plugins.TweenPlugin; 
import com.greensock.plugins.ScrollRectPlugin; 
TweenPlugin.activate([ScrollRectPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.

TweenLite.to(mc, 1, {scrollRect:{x:50, y:300, width:100, height:100}});
</listing>
 * 
 * <p><strong>Copyright 2008-2014, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for <a href="http://www.greensock.com/club/">Club GreenSock</a> members, the software agreement that was issued with the membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */
class ScrollRectPlugin extends TweenPlugin {
/** @private **/
public static inline var API:Float = 2; //If the API/Framework for plugins changes in the future, this number helps determine compatibility

/** @private **/
private var _target:DisplayObject;
/** @private **/
private var _rect:Rectangle;

/** @private **/
public function new() {
	super("scrollRect");
}

/** @private **/
override public function _onInitTween(target:Object, value:Dynamic, tween:TweenLite):Bool {
	if (!(target is DisplayObject)) {
	return false;
	}
	_target = target as DisplayObject;
	if (_target.scrollRect != null) {
	_rect = _target.scrollRect;
	} else {
	var r:Rectangle = _target.getBounds(_target);
	_rect = new Rectangle(0, 0, r.width + r.x, r.height + r.y);
	}
	for (var p:String in value) {
	_addTween(_rect, p, _rect[p], value[p], "scrollRect");
	}
	return true;
}

/** @private **/
override public function setRatio(v:Float):Void {
	super.setRatio(v);
	_target.scrollRect = _rect;
}

}