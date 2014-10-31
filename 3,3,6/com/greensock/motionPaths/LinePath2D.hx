/**
 * VERSION: 0.5
 * DATE: 2012-02-16
 * AS3
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.motionpaths;

import flash.display.Graphics;
import flash.events.Event;
import flash.geom.Matrix;
import flash.geom.Point;

/**
 * [AS3 only] A LinePath2D defines a path (using as many Points as you want) on which a PathFollower can be 
 * placed and animated. A PathFollower's position along the path is described using the PathFollower's 
 * <code>progress</code> property, a value between 0 and 1 where 0 is at the beginning of the path, 
 * 0.5 is in the middle, and 1 is at the very end. To tween a PathFollower along the path, simply tween its
 * <code>progress</code> property. To tween ALL of the followers on the path at once, you can tween the 
 * LinePath2D's <code>progress</code> property which performs better than tweening every PathFollower's 
 * <code>progress</code> property individually. PathFollowers automatically wrap so that if the 
 * <code>progress</code> value exceeds 1 it continues at the beginning of the path, meaning that tweening
 * its <code>progress</code> from 0 to 2 would have the same effect as tweening it from 0 to 1 twice 
 * (it would appear to loop).
 *  
 * <p>Since LinePath2D extends the Shape class, you can add an instance to the display list to see a line representation
 * of the path drawn which can be particularly helpful during the production phase. Use <code>lineStyle()</code> 
 * to adjust the color, thickness, and other attributes of the line that is drawn (or set the LinePath2D's 
 * <code>visible</code> property to false or don't add it to the display list if you don't want to see the line 
 * at all). You can also adjust all of its properties like <code>scaleX, scaleY, rotation, width, height, x,</code> 
 * and <code>y</code>. That means you can tween those values as well to achieve very dynamic, complex effects 
 * with ease.</p>
 * 
 * <listing version="3.0">
import com.greensock.~~;
import com.greensock.easing.~~;
import com.greensock.motionPaths.~~;
import flash.geom.Point;

//create a LinePath2D with 5 Points
var path:LinePath2D = new LinePath2D([new Point(0, 0), 
				  new Point(100, 100), 
				  new Point(350, 150),
				  new Point(50, 200),
				  new Point(550, 400)]);

//add it to the display list so we can see it (you can skip this if you prefer)
addChild(path);

//create an array containing 30 blue squares
var boxes:Array = [];
for (var i:Int = 0; i &lt; 30; i++) {
boxes.push(createSquare(10, 0x0000FF));
}

//distribute the blue squares evenly across the entire path and set them to autoRotate
path.distribute(boxes, 0, 1, true);

//put a red square exactly halfway through the 2nd segment
path.addFollower(createSquare(10, 0xFF0000), path.getSegmentProgress(2, 0.5));

//tween all of the squares through the path once (wrapping when they reach the end)
TweenMax.to(path, 20, {progress:1});

//while the squares are animating through the path, tween the path's position and rotation too!
TweenMax.to(path, 3, {rotation:180, x:550, y:400, ease:Back.easeOut, delay:3});

//method for creating squares
function createSquare(size:Float, color:UInt=0xFF0000):Shape {
var s:Shape = new Shape();
s.graphics.beginFill(color, 1);
s.graphics.drawRect(-size / 2, -size / 2, size, size);
s.graphics.endFill();
this.addChild(s);
return s;
}
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
class LinePath2D extends MotionPath {	
/** @private **/
private var _first:PathPoint;
/** @private **/
private var _points:Array<Dynamic>;
/** @private **/
private var _totalLength:Float;
/** @private **/
private var _hasAutoRotate:Bool;
/** @private **/
private var _prevMatrix:Matrix;

/** If true, the LinePath2D will analyze every Point whenever it renders to see if any Point's x or y value has changed, thus making it possible to tween them dynamically. Setting <code>autoUpdatePoints</code> to <code>true</code> increases the CPU load due to the extra processing, so only set it to <code>true</code> if you plan to change one or more of the Points' position. **/
public var autoUpdatePoints:Bool;

/**
 * Constructor
 * 
 * @param points An array of Points that define the line
 * @param x The x coordinate of the origin of the line
 * @param y The y coordinate of the origin of the line
 * @param autoUpdatePoints If true, the LinePath2D will analyze every Point whenever it renders to see if any Point's x or y value has changed, thus making it possible to tween them dynamically. Setting <code>autoUpdatePoints</code> to <code>true</code> increases the CPU load due to the extra processing, so only set it to <code>true</code> if you plan to change one or more of the Points' position.
 */
public function new(points:Array<Dynamic>=null, x:Float=0, y:Float=0, autoUpdatePoints:Bool=false) {
	super();
	_points = [];
	_totalLength = 0;
	this.autoUpdatePoints = autoUpdatePoints;
	if (points != null) {
	insertMultiplePoints(points, 0);
	}
	super.x = x;
	super.y = y;
}

/** 
 * Adds a Point to the end of the current LinePath2D (essentially redefining its end point).
 * 
 * @param point A Point describing the local coordinates through which the line should be drawn.
 **/
public function appendPoint(point:Point):Void {
	_insertPoint(point, _points.length, false);
}

/** 
 * Inserts a Point at a particular index value in the <code>points</code> array, similar to splice() in an array.
 * For example, if a LinePath2D instance has 3 Points already and you want to insert a new Point right after the
 * first one, you would do:
 * <listing version="3.0">
var path:LinePath2D = new LinePath2D([new Point(0, 0), 
			 new Point(100, 50), 
			 new Point(200, 300)]); 
path.insertPoint(new Point(50, 50), 1); 
</listing>
 * 
 * @param point A Point describing the local coordinates through which the line should be drawn.
 * @param index The index value in the <code>points</code> array at which the Point should be inserted.
 **/
public function insertPoint(point:Point, index:UInt=0):Void {
	_insertPoint(point, index, false);
}

/** @private **/
private function _insertPoint(point:Point, index:UInt, skipOrganize:Bool):Void {
	_points.splice(index, 0, new PathPoint(point));
	if (!skipOrganize) {
	_organize();
	}
}


/**
 * Appends multiple Points to the end of the <code>points</code> array. Identical to 
 * the <code>appendPoint()</code> method, but accepts an array of Points instead of just one.
 * 
 * @param points An array of Points to append.
 */
public function appendMultiplePoints(points:Array):Void {
	insertMultiplePoints(points, _points.length);
}

/**
 * Inserts multiple Points into the <code>points</code> array at a particular index/position.
 * Identical to the <code>insertPoint()</code> method, but accepts an array of points instead of just one.
 * 
 * @param points An array of Points to insert.
 * @param index The index value in the <code>points</code> array at which the Points should be inserted.
 */
public function insertMultiplePoints(points:Array, index:UInt=0):Void {
	var l:Int = points.length;
	for (var i:Int = 0; i < l; i++) {
	_insertPoint(points[i], index + i, true);
	}
	_organize();
}

/**
 * Removes a particular Point instance from the <code>points</code> array.
 * 
 * @param point The Point object to remove from the <code>points</code> array.
 */
public function removePoint(point:Point):Void {
	var i:Int = _points.length;
	while (--i > -1) {
	if (_points[i].point == point) {
		_points.splice(i, 1);
	}
	}
	_organize();
}

/**
 * Removes the Point that resides at a particular index/position in the <code>points</code> array. 
 * Just like in arrays, the index is zero-based. For example, to remove the second Point in the array, 
 * do <code>removePointByIndex(1)</code>;
 * 
 * @param index The index value of the Point that should be removed from the <code>points</code> array.
 */
public function removePointByIndex(index:UInt):Void {
	_points.splice(index, 1);
	_organize();
}

/** @private **/
private function _organize():Void {
	_totalLength = 0;
	_hasAutoRotate = false;
	var last:Int = _points.length - 1;
	if (last == -1) {
	_first = null;
	} else if (last == 0) {
	_first = _points[0];
	_first.progress = _first.xChange = _first.yChange = _first.length = 0;
	return;
	}
	var pp:PathPoint;
	for (var i:Int = 0; i <= last; i++) { 
	if (_points[i] != null) {
		pp = _points[i];
		pp.x = pp.point.x;
		pp.y = pp.point.y;
		if (i == last) {
		pp.length = 0;
		pp.next = null;
		} else {
		pp.next = _points[i + 1];
		pp.xChange = pp.next.x - pp.x;
		pp.yChange = pp.next.y - pp.y;
		pp.length = Math.sqrt(pp.xChange * pp.xChange + pp.yChange * pp.yChange);
		_totalLength += pp.length;
		}
	}
	}
	_first = pp = _points[0];
	var curTotal:Float = 0;
	while (pp) {
	pp.progress = curTotal / _totalLength;
	curTotal += pp.length;
	pp = pp.next;
	}
	_updateAngles();
}

/** @private **/
private function _updateAngles():Void {
	var m:Matrix = this.transform.matrix;
	var pp:PathPoint = _first;
	while (pp) {
	pp.angle = Math.atan2(pp.xChange * m.b + pp.yChange * m.d, pp.xChange * m.a + pp.yChange * m.c) * _RAD2DEG;
	pp = pp.next;
	}
	_prevMatrix = m;
}

/** @inheritDoc **/
override public function update(event:Event=null):Void {
	if (_first == null || _points.length <= 1) {
	return;
	}
	var updatedAngles:Bool = false;
	var px:Float, py:Float, pp:PathPoint, followerProgress:Float, pathProg:Float;
	var m:Matrix = this.transform.matrix;
	var a:Float = m.a, b:Float = m.b, c:Float = m.c, d:Float = m.d, tx:Float = m.tx, ty:Float = m.ty;
	var f:PathFollower = _rootFollower;
	
	if (autoUpdatePoints) {
	pp = _first;
	while (pp) {
		if (pp.point.x != pp.x || pp.point.y != pp.y) {
		_organize();
		_redrawLine = true;
		update();
		return;
		}
		pp = pp.next;
	}
	}
	
	while (f) {
	
	followerProgress = f.cachedProgress;
	pp = _first;
	while (pp != null && pp.next.progress < followerProgress) {
		pp = pp.next;
	}
	
	if (pp != null) {
		pathProg = (followerProgress - pp.progress) / (pp.length / _totalLength);
		px = pp.x + pathProg * pp.xChange;
		py = pp.y + pathProg * pp.yChange;
		f.target.x = px * a + py * c + tx;
		f.target.y = px * b + py * d + ty;
		
		if (f.autoRotate) {
		if (!updatedAngles && (_prevMatrix.a != a || _prevMatrix.b != b || _prevMatrix.c != c || _prevMatrix.d != d)) {
			_updateAngles(); //only need to update the angles once during the render cycle
			updatedAngles = true;
		}
		f.target.rotation = pp.angle + f.rotationOffset;
		}
	}
	
	f = f.cachedNext;
	}
	if (_redrawLine) {
	var g:Graphics = this.graphics;
	g.clear();
	g.lineStyle(_thickness, _color, _lineAlpha, _pixelHinting, _scaleMode, _caps, _joints, _miterLimit);
	pp = _first;
	g.moveTo(pp.x, pp.y);
	while (pp) {
		g.lineTo(pp.x, pp.y);
		pp = pp.next;
	}
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
	if (_first == null) {
	return;
	}
	
	var pp:PathPoint = _first;
	while (pp.next != null && pp.next.progress < progress) {
	pp = pp.next;
	}
	
	if (pp != null) {
	var pathProg:Float = (progress - pp.progress) / (pp.length / _totalLength);
	var px:Float = pp.x + pathProg * pp.xChange;
	var py:Float = pp.y + pathProg * pp.yChange;
	
	var m:Matrix = this.transform.matrix;
	target.x = px * m.a + py * m.c + m.tx;
	target.y = px * m.b + py * m.d + m.ty;
	
	if (autoRotate) {
		if (_prevMatrix.a != m.a || _prevMatrix.b != m.b || _prevMatrix.c != m.c || _prevMatrix.d != m.d) {
		_updateAngles();
		}
		target.rotation = pp.angle + rotationOffset;
	}
	}
	
}

/**
 * Translates the progress along a particular segment of the LinePath2D to an overall <code>progress</code>
 * value, making it easy to position an object like "halfway along the 2nd segment of the line". For example:
 * <p><code>
 * 
 * path.addFollower(mc, path.getSegmentProgress(2, 0.5));
 * 
 * </code></p>
 * 
 * @param segment The segment number of the line. For example, a line defined by 3 Points would have two segments.
 * @param progress The <code>progress</code> along the segment. For example, the midpoint of the second segment would be <code>getSegmentProgress(2, 0.5);</code>.
 * @return The progress value (between 0 and 1) describing the overall progress on the entire LinePath2D.
 */
public function getSegmentProgress(segment:UInt, progress:Float):Float {
	if (_first == null) {
	return 0;
	} else if (_points.length <= segment) {
	segment = _points.length;
	}
	var pp:PathPoint = _points[segment - 1];
	return pp.progress + ((progress * pp.length) / _totalLength);
}

/**
 * Finds the segment associated with a particular a progress value along the entire LinePath2D.
 * For example, to find which segment is halfway along the LinePath2D:
 * 
 * <p><code>
 * path.getSegment(0.5);
 * </code></p>
 * 
 * <p>To find the segment associated with the LinePath2D's current <code>progress</code>, simply omit the 
 * <code>progress</code> parameter:</p>
 * 
 * <p><code>
 * var curSegment = path.getSegment();
 * </code></p>
 * 
 * @param progress The <code>progress</code> along the entire LinePath2D (a value between 0 and 1). For example, the midpoint would be <code>getSegment(0.5);</code>.
 * @return An integer describing the segment number where the first is 1, second is 2, etc.
 */
public function getSegment(progress:Float=0):UInt {
	if (!(progress || progress == 0)) {
	progress = _progress;
	}
	if (_points.length < 2) {
	return 0;
	}
	var l:Int = _points.length;
	for (var i:Int = 1; i < l; i++) {
	if (progress < (_points[i] as PathPoint).progress) {
		return i;
	}
	}
	return _points.length - 1;
}

/**
 * Allows you to snap an object like a Sprite, Point, MovieClip, etc. to the LinePath2D by determining
 * the closest position along the line to the current position of the object. It will automatically
 * create a PathFollower instance for the target object and reposition it on the LinePath2D. 
 * 
 * @param target The target object that should be repositioned onto the LinePath2D.
 * @param autoRotate When <code>autoRotate</code> is <code>true</code>, the follower will automatically be rotated so that it is oriented to the angle of the path that it is following. To offset this value (like to always add 90 degrees for example), use the <code>rotationOffset</code> property.
 * @param rotationOffset When <code>autoRotate</code> is <code>true</code>, this value will always be added to the resulting <code>rotation</code> of the target.
 * @return A PathFollower instance that was created for the target.
 */
public function snap(target:Map<String, Int>, autoRotate:Bool=false, rotationOffset:Float=0):PathFollower {
	return this.addFollower(target, getClosestProgress(target), autoRotate, rotationOffset);
}

/**
 * Finds the closest overall <code>progress</code> value on the LinePath2D based on the 
 * target object's current position (<code>x</code> and <code>y</code> properties). For example,
 * to position the mc object on the LinePath2D at the spot that's closest to the Point x:100, y:50, 
 * you could do:<p><code>
 * 
 * path.addFollower(mc, path.getClosestProgress(new Point(100, 50)));
 * 
 * </code></p>
 * 
 * @param target The target object whose position (x/y property values) are analyzed for proximity to the LinePath2D.
 * @return The overall <code>progress</code> value describing the position on the LinePath2D that is closest to the target's current position.
 */
public function getClosestProgress(target:Map<String, Int>):Float {
	if (_first == null || _points.length == 1) {
	return 0;
	}
	
	var closestPath:PathPoint;
	var closest:Float = 9999999999;
	var length:Float = 0;
	var halfPI:Float = Math.PI / 2;
	
	var xTarg:Float = target.x;
	var yTarg:Float = target.y;
	var pp:PathPoint = _first;
	var dxTarg:Float, dyTarg:Float, dxNext:Float, dyNext:Float, dTarg:Float, angle:Float, next:PathPoint, curDist:Float;
	while (pp) {
	dxTarg = xTarg - pp.x;
	dyTarg = yTarg - pp.y;
	next = (pp.next != null) ? pp.next : pp;
	dxNext = next.x - pp.x;
	dyNext = next.y - pp.y;
	dTarg = Math.sqrt(dxTarg * dxTarg + dyTarg * dyTarg);
	
	angle = Math.atan2(dyTarg, dxTarg) - Math.atan2(dyNext, dxNext);
	if (angle < 0) {
		angle = -angle;
	}
	
	if (angle > halfPI) { //obtuse
		if (dTarg < closest) {
		closest = dTarg;
		closestPath = pp;
		length = 0;
		}
	} else {
		curDist = Math.cos(angle) * dTarg;
		if (curDist < 0) {
		curDist = -curDist;
		}
		if (curDist > pp.length) {
		dxNext = xTarg - next.x;
		dyNext = yTarg - next.y;
		curDist = Math.sqrt(dxNext * dxNext + dyNext * dyNext);
		if (curDist < closest) {
			closest = curDist;
			closestPath = pp;
			length = pp.length;
		}
		} else {
		curDist = Math.sin(angle) * dTarg;
		if (curDist < closest) {
			closest = curDist;
			closestPath = pp;
			length = Math.cos(angle) * dTarg;
		}
		}
	}
	pp = pp.next;
	}
	
	return closestPath.progress + (length / _totalLength);
}


//---- GETTERS / SETTERS ----------------------------------------------------------------------

/** Total length of the LinePath2D as though it were stretched out in a straight, flat line. **/
public var totalLength(getTotalLength, setTotalLength):Float;
 	private function getTotalLength():Float {
	return _totalLength;
}

/** The array of Points through which the LinePath2D is drawn. <strong>IMPORTANT:</strong> Changes to the array are NOT automatically applied or reflected in the LinePath2D - just like the <code>filters</code> property of a DisplayObject, you must set the <code>points</code> property of a LinePath2D directly to ensure that any changes are applied internally. **/
public var points(getPoints, setPoints):Array<Dynamic>;
 	private function getPoints():Array<Dynamic> {
	var a:Array = [];
	var l:Int = _points.length;
	for (var i:Int = 0; i < l; i++) {
	a[i] = _points[i].point;
	}
	return a;
}
private function setPoints(value:Array):Void {
	_points = [];
	insertMultiplePoints(value, 0);
	_redrawLine = true;
	update(null);
}

}
}
import flash.geom.Point;

internal class PathPoint {
public var x:Float;
public var y:Float;
public var progress:Float;
public var xChange:Float;
public var yChange:Float;
public var point:Point;
public var length:Float;
public var angle:Float;

public var next:PathPoint;

public function PathPoint(point:Point) {
this.x = point.x;
this.y = point.y;
this.point = point;
}