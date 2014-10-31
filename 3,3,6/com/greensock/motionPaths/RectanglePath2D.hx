/**
 * VERSION: 0.4 (beta)
 * DATE: 2011-09-12
 * AS3
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.motionpaths;

import flash.display.Graphics;
import flash.geom.Matrix;
import flash.events.Event;
/**
 * [AS3 only] A RectanglePath2D defines a rectangular path on which a PathFollower can be placed, making it simple to tween objects
 * along a rectangle's perimeter. A PathFollower's position along the path is described using its <code>progress</code> property, 
 * a value between 0 and 1 where 0 is at the beginning of the path (top left corner), and as the value increases, it
 * moves clockwise along the path so that 0.5 would be at the lower right corner, and 1 is all the way back at the 
 * upper left corner of the path. So to tween a PathFollower along the path, you can simply tween its
 * <code>progress</code> property. To tween ALL of the followers on the path at once, you can tween the 
 * RectanglePath2D's <code>progress</code> property. PathFollowers automatically wrap so that if the <code>progress</code> 
 * value exceeds 1 it continues at the beginning of the path.
 *  
 * <p>Since RectanglePath2D extends the Shape class, you can add an instance to the display list to see a line representation
 * of the path drawn which can be helpful especially during the production phase. Use <code>lineStyle()</code> 
 * to adjust the color, thickness, and other attributes of the line that is drawn (or set the RectanglePath2D's 
 * <code>visible</code> property to false or don't add it to the display list if you don't want to see the line 
 * at all). You can also adjust all of its properties like <code>scaleX, scaleY, rotation, width, height, x,</code> 
 * and <code>y</code>. That means you can tween those values as well to achieve very dynamic, complex effects 
 * with ease.</p>
 * 
 * <listing version="3.0">
import com.greensock.~~;
import com.greensock.motionPaths.~~;

//create a rectangular motion path at coordinates x:25, y:25 with a width of 150 and a height of 100
var rect:RectanglePath2D = new RectanglePath2D(25, 25, 150, 100, false);

//position the MovieClip "mc" at the beginning of the path (upper left corner), and reference the resulting PathFollower instance with a "follower" variable.
var follower:PathFollower = rect.addFollower(mc, 0);

//tween the follower clockwise along the path all the way to the end, one full revolution
TweenLite.to(follower, 2, {progress:1});

//tween the follower counter-clockwise by using a negative progress value
TweenLite.to(follower, 2, {progress:-1});
</listing>
 * 
 * <p><strong>NOTES</strong></p>
 * <ul>
 * 	<li>All followers' positions are automatically updated when you alter the MotionPath that they're following.</li>
 * 	<li>To tween all followers along the path at once, simply tween the MotionPath's <code>progress</code> 
 * 		property which will provide better performance than tweening each follower independently.</li>
 * </ul>
 * 
 * <p><strong>Copyright 2010-2014, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for <a href="http://www.greensock.com/club/">Club GreenSock</a> members, the software agreement that was issued with the membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */	
class RectanglePath2D extends MotionPath {	
/** @private **/
private var _rawWidth:Float;
/** @private **/
private var _rawHeight:Float;
/** @private **/
private var _centerOrigin:Bool;

/**
 * Constructor
 * 
 * @param x The x coordinate of the origin of the rectangle (typically its top left corner unless <code>centerOrigin</code> is <code>true</code>)
 * @param y The y coordinate of the origin of the rectangle (typically its top left corner unless <code>centerOrigin</code> is <code>true</code>)
 * @param rawWidth The width of the rectangle in its unrotated and unscaled state
 * @param rawHeight The height of the rectangle in its unrotated and unscaled state
 * @param centerOrigin To position the origin (registration point around which transformations occur) at the center of the rectangle instead of its upper left corner, set <code>centerOrigin</code> to <code>true</code> (it is false by default).
 */
public function new(x:Float, y:Float, rawWidth:Float, rawHeight:Float, centerOrigin:Bool=false) {
	super();
	_rawWidth = rawWidth;
	_rawHeight = rawHeight;
	_centerOrigin = centerOrigin;
	super.x = x;
	super.y = y;
}

/** @inheritDoc **/
override public function update(event:Event=null):Void {
	var xOffset:Float = _centerOrigin ? _rawWidth / -2 : 0;
	var yOffset:Float = _centerOrigin ? _rawHeight / -2 : 0;
	
	var length:Float, px:Float, py:Float, xFactor:Float, yFactor:Float;
	var m:Matrix = this.transform.matrix;
	var a:Float = m.a, b:Float = m.b, c:Float = m.c, d:Float = m.d, tx:Float = m.tx, ty:Float = m.ty;
	var f:PathFollower = _rootFollower;
	while (f) {
	px = xOffset;
	py = yOffset;
	if (f.cachedProgress < 0.5) {
		length = f.cachedProgress * (_rawWidth + _rawHeight) * 2;
		if (length > _rawWidth) { 	//top
		px += _rawWidth;
		py += length - _rawWidth;
		xFactor = 0;
		yFactor = _rawHeight;
		} else { 			//right
		px += length;
		xFactor = _rawWidth;
		yFactor = 0;
		}
	} else {
		length = (f.cachedProgress - 0.5) / 0.5 * (_rawWidth + _rawHeight);
		if (length <= _rawWidth) {	//bottom
		px += _rawWidth - length;
		py += _rawHeight;
		xFactor = -_rawWidth;
		yFactor = 0;
		} else {			//left
		py += _rawHeight - (length - _rawWidth);
		xFactor = 0;
		yFactor = -_rawHeight;
		}
	}
	
	f.target.x = px * a + py * c + tx;
	f.target.y = px * b + py * d + ty;
	
	if (f.autoRotate) {
		f.target.rotation = Math.atan2(xFactor * b + yFactor * d, xFactor * a + yFactor * c) * _RAD2DEG + f.rotationOffset;
	}
	
	f = f.cachedNext;
	}
	if (_redrawLine) {
	var g:Graphics = this.graphics;
	g.clear();
	g.lineStyle(_thickness, _color, _lineAlpha, _pixelHinting, _scaleMode, _caps, _joints, _miterLimit);
	g.drawRect(xOffset, yOffset, _rawWidth, _rawHeight);
	_redrawLine = false;
	}
}

/** @inheritDoc **/
override public function renderObjectAt(target:Map<String, Int>, progress:Float, autoRotate:Bool=false, rotationOffset:Float=0):Void {
	if (progress > 1) {
	progress -= int(progress);
	} else if (progress < 0) {
	progress -= int(progress) - 1;
	}
	
	var px:Float = _centerOrigin ? _rawWidth / -2 : 0;
	var py:Float = _centerOrigin ? _rawHeight / -2 : 0;
	var length:Float, xFactor:Float, yFactor:Float;
	if (progress < 0.5) {
	length = progress * (_rawWidth + _rawHeight) * 2;
	if (length > _rawWidth) {
		px += _rawWidth;
		py += length - _rawWidth;
		xFactor = 0;
		yFactor = _rawHeight;
	} else {
		px += length;
		xFactor = _rawWidth;
		yFactor = 0;
	}
	} else {
	length = (progress - 0.5) / 0.5 * (_rawWidth + _rawHeight);
	if (length <= _rawWidth) {
		px += _rawWidth - length;
		py += _rawHeight;
		xFactor = -_rawWidth;
		yFactor = 0;
	} else {
		py += _rawHeight - (length - _rawWidth);
		xFactor = 0;
		yFactor = -_rawHeight;
	}
	}
	var m:Matrix = this.transform.matrix;
	target.x = px * m.a + py * m.c + m.tx;
	target.y = px * m.b + py * m.d + m.ty;
	
	if (autoRotate) {
	target.rotation = Math.atan2(xFactor * m.b + yFactor * m.d, xFactor * m.a + yFactor * m.c) * _RAD2DEG + rotationOffset;
	}
}


//---- GETTERS / SETTERS ----------------------------------------------------------------------

/** width of the rectangle in its unrotated, unscaled state (does not factor in any transformations like scaleX/scaleY/rotation) **/
public var rawWidth(getRawWidth, setRawWidth):Float;
 	private function getRawWidth():Float {
	return _rawWidth;
}
private function setRawWidth(value:Float):Void {
	_rawWidth = value;
	_redrawLine = true;
	update();
}

/** height of the rectangle in its unrotated, unscaled state (does not factor in any transformations like scaleX/scaleY/rotation) **/
public var rawHeight(getRawHeight, setRawHeight):Float;
 	private function getRawHeight():Float {
	return _rawHeight;
}
private function setRawHeight(value:Float):Void {
	_rawHeight = value;
	_redrawLine = true;
	update();
}

/** If <code>true</code>, the origin (registration point) of the RectanglePath2D will be in its center rather than its upper left corner. **/
public var centerOrigin(getCenterOrigin, setCenterOrigin):Bool;
 	private function getCenterOrigin():Bool {
	return _centerOrigin;
}
private function setCenterOrigin(value:Bool):Void {
	_centerOrigin;
	_redrawLine = true;
	update();
}

}