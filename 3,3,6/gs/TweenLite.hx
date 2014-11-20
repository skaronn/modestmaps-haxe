/*
VERSION: 5.87
DATE: 1/8/2008
ACTIONSCRIPT VERSION: 3.0 (AS2 version is also available)
UPDATES & MORE DETAILED DOCUMENTATION AT: http://www.TweenLite.com (there's a link to the AS3 version)
DESCRIPTION:
Tweening. We all do it. Most of us have learned to avoid Adobe's Tween class in favor of a more powerful, 
less code-heavy engine (Tweener, Fuse, MC Tween, etc.). Each has its own strengths & weaknesses. A few years back, 
I created TweenLite because I needed a very compact tweening engine that was fast and efficient (I couldn't 
afford the file size bloat that came with the other tweening engines). It quickly became integral to my work flow.

Since then, I've added new capabilities while trying to keep file size way down (2.6K). TweenFilterLite extends 
TweenLite and adds the ability to tween filters including ColorMatrixFilter effects like saturation, contrast, 
brightness, hue, and even colorization but it only adds about 3k to the file size. Same syntax as TweenLite. 
There are AS2 and AS3 versions of both of the classes.

I know what you're thinking - "if it's so 'lightweight', it's probably missing a lot of features which makes 
me nervous about using it as my main tweening engine." It is true that it doesn't have the same feature set 
as the other tweening engines, but I can honestly say that after using it on almost every project I've worked 
on over the last few years, it has never let me down. I never found myself needing some other functionality. 
You can tween any property (including a MovieClip's volume and color), use any easing function, build in delays, 
callback functions, pass arguments to that callback function, and even tween arrays all with one line of code. 
You very well may require a feature that TweenLite (or TweenFilterLite) doesn't have, but I think most 
developers will use the built-in features to accomplish whatever they need and appreciate the streamlined 
nature of the class(es).

I haven't been able to find a faster tween engine either. The syntax is simple and the class doesn't rely on 
complicated prototype alterations that can cause problems with certain compilers. TweenLite is simple, very 
fast, and more lightweight than any other popular tweening engine with similar features.

ARGUMENTS:
1) $target: Target MovieClip (or any other object) whose properties we're tweening
2) $duration: Duration (in seconds) of the effect
3) $vars: An object containing the end values of all the properties you'd like to have tweened (or if you're using the 
	 TweenLite.from() method, these variables would define the BEGINNING values). For example:
		  alpha: The alpha (opacity level) that the target object should finish at (or begin at if you're 
			 using TweenLite.from()). For example, if the target.alpha is 1 when this script is 
		  	 called, and you specify this argument to be 0.5, it'll transition from 1 to 0.5.
		  x: To change a MovieClip's x position, just set this to the value you'd like the MovieClip to 
		 end up at (or begin at if you're using TweenLite.from()). 
	  SPECIAL PROPERTIES (**OPTIONAL**):
	  	  delay: Amount of delay before the tween should begin (in seconds).
		  ease: You can specify a function to use for the easing with this variable. For example, 
			fl.motion.easing.Elastic.easeOut. The Default is Regular.easeOut.
		  easeParams: An array of extra parameters to feed the easing equation. This can be useful when you 
		  		  use an equation like Elastic and want to control extra parameters like the amplitude and period.
			  Most easing equations, however, don't require extra parameters so you won't need to pass in any easeParams.
		  autoAlpha: Same as changing the "alpha" property but with the additional feature of toggling the "visible" property 
	  		 to false if the alpha ends at 0. It will also toggle visible to true before the tween starts if the value 
			 of autoAlpha is greater than zero.
		  volume: To change a MovieClip's volume, just set this to the value you'd like the MovieClip to
			  end up at (or begin at if you're using TweenLite.from()).
		  tint: To change a MovieClip's color, set this to the hex value of the color you'd like the MovieClip
		  	   to end up at(or begin at if you're using TweenLite.from()). An example hex value would be 0xFF0000. 
			   If you'd like to remove the color from a MovieClip, just pass null as the value of tint.
		  onStart: If you'd like to call a function as soon as the tween begins, pass in a reference to it here.
		  	   This is useful for when there's a delay. 
		  onStartParams: An array of parameters to pass the onStart function.
		  onUpdate: If you'd like to call a function every time the property values are updated (on every frame during
			the time the tween is active), pass a reference to it here.
		  onUpdateParams: An array of parameters to pass the onUpdate function (this is optional)
		  onComplete: If you'd like to call a function when the tween has finished, use this. 
		  onCompleteParams: An array of parameters to pass the onComplete function
		  overwrite: If you do NOT want the tween to automatically overwrite any other tweens that are 
			 affecting the same target, make sure this value is false.



EXAMPLES: 
As a simple example, you could tween the alpha to 50% (0.5) and move the x position of a MovieClip named "clip_mc" 
to 120 and fade the volume to 0 over the course of 1.5 seconds like so:

import flash.Lib;
import flash.Lib;
import flash.utils.Object;
import gs.TweenLite;
import haxe.ds.ObjectMap;
import haxe.ds.ObjectMap;
import haxe.ds.ObjectMap;
import haxe.Timer;
import haxe.Timer;
TweenLite.to(clip_mc, 1.5, {alpha:0.5, x:120, volume:0});

If you want to get more advanced and tween the clip_mc MovieClip over 5 seconds, changing the alpha to 0.5, 
the x to 120 using the "easeOutBack" easing function, delay starting the whole tween by 2 seconds, and then call
a function named "onFinishTween" when it has completed and pass in a few parameters to that function (a value of
5 and a reference to the clip_mc), you'd do so like:

import gs.TweenLite;
import fl.motion.easing.Back;
TweenLite.to(clip_mc, 5, {alpha:0.5, x:120, ease:Back.easeOut, delay:2, onComplete:onFinishTween, onCompleteParams:[5, clip_mc]});
function onFinishTween(argument1:Float, argument2:MovieClip):Void {
	trace("The tween has finished! argument1 = " + argument1 + ", and argument2 = " + argument2);
}

If you have a MovieClip on the stage that is already in it's end position and you just want to animate it into 
place over 5 seconds (drop it into place by changing its y property to 100 pixels higher on the screen and 
dropping it from there), you could:

import gs.TweenLite;
import fl.motion.easing.Elastic;
TweenLite.from(clip_mc, 5, {y:"-100", ease:Elastic.easeOut});	


NOTES:
- This class will add about 2.6kb to your Flash file.
- Putting quotes around values will make the tween relative to the current value. For example, if you do
  TweenLite.to(mc, 2, {x:"-20"}); it'll move the mc.x to the left 20 pixels which is the same as doing
  TweenLite.to(mc, 2, {x:mc.x - 20});
- You must target Flash Player 9 or later (ActionScript 3.0)
- You can tween the volume of any MovieClip using the tween property "volume", like:
  TweenLite.to(myClip_mc, 1.5, {volume:0});
- You can tween the color of a MovieClip using the tween property "tint", like:
  TweenLite.to(myClip_mc, 1.5, {tint:0xFF0000});
- To tween an array, just pass in an array as a property named endArray like:
  var myArray:Array = [1,2,3,4];
  TweenLite.to(myArray, 1.5, {endArray:[10,20,30,40]});
- You can kill all tweens for a particular object (usually a MovieClip) anytime with the 
  TweenLite.killTweensOf(myClip_mc); function. If you want to have the tweens forced to completion, 
  pass true as the second parameter, like TweenLite.killTweensOf(myClip_mc, true);
- You can kill all delayedCalls to a particular function using TweenLite.killDelayedCallsTo(myFunction_func);
  This can be helpful if you want to preempt a call.
- Use the TweenLite.from() method to animate things into place. For example, if you have things set up on 
  the stage in the spot where they should end up, and you just want to animate them into place, you can 
  pass in the beginning x and/or y and/or alpha (or whatever properties you want).
  
  
CHANGE LOG:
5.87:
- Fixed potential 1010 errors when an onUpdate() calls a killTweensOf() for an object.
5.85:
- Fixed an issue that prevented TextField filters from being applied properly with TweenFilterLite.
5.8:
- Added the ability to define extra easing parameters using easeParams.
- Changed "mcColor" to "tint" in order to make it more intuitive. Using mcColor for tweening color values is deprecated and will be removed eventually.
5.7:	
- Improved speed (made changes to the render() and initTweenVals() functions)
- Added a complete() function which allows you to immediately skip to the end of a tween.
5.61:
- Removed a line of code that in some very rare instances could contribute to an intermittent 1010 error in TweenFilterLite which extends this class.
- Fixed an issue with tweening tint and alpha together.
5.5: 
- Added a few very minor conditional checks to improve reliability, and re-released with TweenFilterLite 5.5 (which fixed rare 1010 errors).
5.4: 
- Eliminated rare 1010 errors with TweenFilterLite
5.3:
- Added onUpdate and onUpdateParams features
- Finally removed extra/duplicated (deprecated) constructor parameters that had been left in for almost a year simply for backwards compatibility.

CODED BY: Jack Doyle, jack@greensock.com
Copyright 2007, GreenSock (This work is subject to the terms in http://www.greensock.com/terms_of_use.html.)
*/

package gs;
import openfl.events.Event;
import openfl.display.Sprite;
import openfl.display.MovieClip;
import openfl.display.DisplayObject;
import openfl.events.TimerEvent;
import openfl.media.SoundTransform;
import openfl.geom.ColorTransform;
import haxe.ds.ObjectMap;
import openfl.utils.*;
import openfl.errors.*;

class TweenLite {
	public static var version:Float = 5.87;
	public static var killDelayedCallsTo:Object = killTweensOf;
	private static var _sprite:Sprite = new Sprite(); //A reference to the sprite that we use to drive all our ENTER_FRAME events.
	private static var _listening:Bool; //If true, the ENTER_FRAME is being listened for (there are tweens that are in the queue)
	private static var _timer:Timer = new Timer(2000);
	public static var _all:ObjectMap<Object, Object> = new ObjectMap<Object, Object>(); //Holds references to all our tween targets.
	private var _sound:SoundTransform; //We only use this in cases where the user wants to change the volume of a MovieClip (they pass in a "volume" property in the v)
	private var _endTarget:Object; //End target. It's almost always the same as this.target except for volume and color tweens. It helps us to see what object or MovieClip the tween really pertains to (so that we can killTweensOf() properly and hijack auto-overwritten ones)
	private var _active:Bool = false; //If true, this tween is active.
	private var _color:ColorTransform;
	private var _endColor:ColorTransform; 

	public var duration:Float; //Duration (in seconds)
	public var vars:Object; //Variables (holds things like _alpha or _y or whatever we're tweening)
	public var delay:Float; //Delay (in seconds)
	public var startTime:UInt; //Start time
	public var initTime:UInt; //Time of initialization. Remember, we can build in delays so this property tells us when the frame action was born, not when it actually started doing anything.
	public var tweens:Object; //Contains parsed data for each property that's being tweened (each has to have a target, property, start, a change, and an ease).
	public var extraTweens:Object; //If we run into a property that's supposed to be tweening but the target has no such property, those tweens get dumped in here.
	public var target:Object; //Target object (often a MovieClip)
	
	private static function traceLog(o:Object):Void {		
		var len:UInt = 0;
		if(Std.is(o, ObjectMap)){
			var object : ObjectMap<Object, Object> = o;
			flash.Lib.trace("\n");
			for (key in object.keys()) {
				var dictionaryValues : String = "";
				var dictionaryLength : UInt = 0;
				//trace (key + " ======> " + object.get(key));
				//trace (key.dumpFields() + " => " + object.get(key));
				var fields : ObjectMap<Object, Object> = object.get(key);
				for (value in fields.keys()) {
					trace(value);
					dictionaryValues += Type.typeof(value);
					//dictionaryValues += value.dumpFields();
					dictionaryLength++;
				}
				
				//trace("traceLog - " + key + " ======> " + object.get(key) + "{" + dictionaryValues + "}[" + dictionaryLength + "]");
				trace("traceLog - " + key + " ======> " + object.get(key) + "{" + dictionaryValues + "}[" + dictionaryLength + "]");
				//flash.Lib.trace("TweenLite.hx - traceLog - dictionary length : " +dictionaryLength);
				/*if(dictionaryValues != ""){
					trace(key.dumpFields() + " => " +"{" +  object.get(key) + ":" + dictionaryValues + "}");					
				}*/
				len++;
			}
			flash.Lib.trace("\n");
			flash.Lib.trace("TweenLite.hx - traceLog - nb elements : " +len);
		}
		else {
			flash.Lib.trace("TweenLite.hx - traceLog - object => " +o);
		}
	}
	
	private static function dumpDictionaryFields(dictionary:ObjectMap<Object, Object>):String{
		var dictionaryValues : String = "";
		for (value in dictionary) {
			//flash.Lib.trace(value+ " ----> "+dumpDictionaryFields(value));
			dictionaryValues += value.toString();
		}
		return dictionaryValues;
	}
	
	public function dumpFields():String{
		return "[_active : " + this._active +"][_color : " + this._color +"][_endTarget : " + this._endTarget.dumpFields() +"][_sound : " + this._sound +"][delay : " + this.delay +"][duration : " + this.duration +"][extraTweens : " + this.extraTweens +"][initTime : " + this.initTime +"][startTime : " + this.startTime +"][target : " + this.target +"][tweens : " + this.tweens +"][vars : " + this.vars +"]";
	}
		
	public function new(target:Object, duration:Float, vars:Object) {		
		if (target == null) return;
		//flash.Lib.trace("TweenLite.hx - new - target : " + target);
		//flash.Lib.trace("TweenLite.hx - new - vars : " + vars);
		//flash.Lib.trace("TweenLite.hx - new - vars.overwrite : " + vars.overwrite);
		var dictionary : ObjectMap<Object, Object> = new ObjectMap<Object, Object>();
		if ((vars.overwrite != false && target != null) || _all.get(target) == null)
		{ 
			//flash.Lib.trace("TweenLite.hx - new - _all.remove(target)");
			_all.remove(target);
			_all.set(target, /*new ObjectMap<Object, Object>()*/dictionary);
		}
		dictionary.set(this, target);
		//_all.set(_all.get(this), this);
		//flash.Lib.trace("TweenLite.hx - new - _all.get(target.get(this)) : " + _all.get(target));
		
		this.vars = vars;
		this.duration = duration;
		this.delay = (vars.delay != null ? cast(vars.delay, Float) :  0);
		//flash.Lib.trace("TweenLite.hx - new - duration: " + duration);
		if (duration == 0) {
			this.duration = 0.001; //Easing equations don't work when the duration is zero.
			if (this.delay == 0) {
				this.vars.runBackwards = true; //The simplest (most lightweight) way to force an immediate render of the target values
			}
		}
		
		this.target = _endTarget = target;
		//flash.Lib.trace("TweenLite.hx - new - this.target: " + this.target);
		
		if (!Reflect.isFunction(this.vars.ease))
		{
			this.vars.ease = easeOut;
		}
		
		if (this.vars.easeParams != null)
		{
			this.vars.proxiedEase = this.vars.ease;
			this.vars.ease = easeProxy;
		}
		
		if (this.vars.mcColor != null) {
			this.vars.tint = this.vars.mcColor;
		}
		//flash.Lib.trace("TweenLite.hx - new - this.vars.alpha: " + this.vars.alpha);
		//flash.Lib.trace("TweenLite.hx - new - this.vars.autoAlpha: " + this.vars.autoAlpha);
		if(this.vars.autoAlpha != null){			
			var autoAlpha : Float = cast(this.vars.autoAlpha, Float);			
			if (!Math.isNaN(autoAlpha))
			{
				this.vars.alpha = autoAlpha;
			}
		}
		
		this.tweens = {};
		this.extraTweens = {};
		this.initTime = flash.Lib.getTimer();
		
		if (this.vars.runBackwards == true)
		{
			//flash.Lib.trace("TweenLite.hx - new - this.vars.runBackwards: " + this.vars.runBackwards);
			initTweenVals();
		}
		
		active = false;
		
		if (duration == 0 && this.delay == 0) {
			complete(true);
		} else if (!_listening) {
			//trace("TweenLite.hx - new - _listening : "+_listening);
			_sprite.addEventListener(Event.ENTER_FRAME, executeAll);
			_timer.addEventListener("timer", killGarbage);
			_timer.start();
			_listening = true;
		}
		
		//flash.Lib.trace("TweenLite.hx -------------------------------------------------------");
		//flash.Lib.trace("TweenLite.hx - this : " + this.dumpFields());
		//flash.Lib.trace("TweenLite.hx - new - _all : " + dumpDictionaryFields(_all));
		//flash.Lib.trace("TweenLite.hx - new - _all.get(target) : " + _all.get(target));
		//flash.Lib.trace("TweenLite.as - new - [$target][this] : " + [$target][this]);
		//flash.Lib.trace("TweenLite.as - new - _all[$target][this] : " + _all[$target][this]);		
		//traceLog(_all);		
	}

	public function initTweenVals():Void{
		//flash.Lib.trace("TweenLite.hx - initTweenVals - this.tweens : "+this.tweens);
		var ndl:Float = this.delay - ((flash.Lib.getTimer() - this.initTime) / 1000); //new delay. We need this because reversed (TweenLite.from() calls) need to maintain the delay in any sub-tweens (like for color or volume tweens) but normal TweenLite.to() tweens should have no delay because this function gets called only when the begin!
		var p:String, valChange:Float; //For looping (for p in this.vars)
		if (Std.is(this.target, Array))
		{
			var endArray:Array<Object> = this.vars.endArray != null ? this.vars.endArray : [];
			for (i in 0...endArray.length)
			{
				if (this.target.get(Std.string(i)) != endArray[i] && this.target.get(Std.string(i)) != null)
				{
					//this.tweens[i.toString()] = {o:this.target, s:this.target[i], c:endArray[i] - this.target[i]}; //o: object, s:starting value, c:change in value, e: easing function
					var foo = Reflect.field(this.tweens, Std.string(i));
					foo = {o:this.target, s:this.target.get(Std.string(i)), c:endArray[i] - this.target.get(Std.string(i))}; //o: object, s:starting value, c:change in value, e: easing function
				}
			}
		}
		else {
			//for (p in this.vars)
			var fields = Reflect.fields(this.vars);
			for (p in fields)
			{
				if (p == "delay" || p == "ease" || p == "overwrite" || p == "onComplete" || p == "onCompleteParams" || p == "runBackwards" || p == "onUpdate" || p == "onUpdateParams" || p == "autoAlpha" || p == "onStart" || p == "onStartParams" || p == "easeParams" || p == "mcColor" || p == "type") { //"type" is for TweenFilterLite, and it's an issue when trying to tween filters on TextFields which do actually have a "type" property.
				
				} 
				else if (p == "tint" && Std.is(this.target, DisplayObject)) { //If we're trying to change the color of a DisplayObject, then set up a quasai proxy using an instance of a TweenLite to control the color.
					_color = this.target.transform.colorTransform;
					_endColor = new ColorTransform();
				if (this.vars.alpha != null) {
					_endColor.alphaMultiplier = this.vars.alpha;
					untyped __delete__(this, vars.alpha);
					untyped __delete__(this, tweens.alpha);
				}
				else {
					_endColor.alphaMultiplier = this.target.alpha;
				}
				if (this.vars.get(p) != null && this.vars.get(p) != "") { //In case they're actually trying to remove the colorization, they should pass in null or "" for the tint
					_endColor.color = this.vars.get(p);
				}
					var colorTween:TweenLite = new TweenLite(this, this.duration, {colorProxy:1, delay:ndl, overwrite:false, ease:this.vars.ease, runBackwards:this.vars.runBackwards});
					colorTween.endTarget = this.target;
				}
				else if (p == "volume" && Std.is(this.target, MovieClip)) { //If we're trying to change the volume of a MovieClip, then set up a quasai proxy using an instance of a TweenLite to control the volume.
					_sound = this.target.soundTransform;
					var volTween:TweenLite = new TweenLite(this, this.duration, {volumeProxy:this.vars.get(p), ease:easeOut, delay:ndl, overwrite:false, runBackwards:this.vars.runBackwards});
					volTween.endTarget = this.target;
				}
				else {
					if (this.target.hasOwnProperty(p)) {
						/*flash.Lib.trace(">>>>>>>>>>>>>>>>> " + this.vars);
						flash.Lib.trace(">>>>>>>>>>>>>>>>> " + p);
						flash.Lib.trace(">>>>>>>>>>>>>>>>> " + Reflect.field(this.vars, p));
						flash.Lib.trace(">>>>>>>>>>>>>>>>> " + Std.is(Reflect.field(this.vars, p), Float));*/
						if (Std.is(Reflect.field(this.vars, p), Float)) {
							valChange = cast(Reflect.field(this.vars, p), Float) -  cast(Reflect.field(this.target, p), Float);
						}
						else {
							valChange = cast(Reflect.field(this.vars, p), Float);
						}
						Reflect.setField(this.tweens, p, {o:this.target, s:Reflect.field(this.target, p), c:valChange}); //o: object, p:property, s:starting value, c:change in value, e: easing function
					}
					else {
						Reflect.setField(this.extraTweens, p, {o:this.target, s:0, c:0, v:Reflect.field(this.vars, p)}); //classes that extend this one (like TweenFilterLite) may need it (like for blurX, blurY, and other filter properties)
					}
				}
			}
		}
		if (this.vars.runBackwards == true)
		{
			var tp:Object;
			var fields = Reflect.fields(this.tweens);
			for (p in fields)
			{
				tp = Reflect.field(this.tweens, p);
				tp.s += tp.c;
				tp.c *= -1;
				Reflect.setField(tp.o, p, tp.s);
			}
			
			if (this.vars.onUpdate != null) {
				this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
			}
		}
		if (Std.is(Type.typeof(this.vars.autoAlpha), Float)) {
			this.target.visible = !(this.vars.runBackwards == true && this.target.alpha == 0);
		}
	}

	public static function to(target:Object, duration:Float, vars:Object) : TweenLite
	{
		//flash.Lib.trace("TweenLite.hx - to - vars: " + vars);
		return new TweenLite(target, duration, vars);
	}

	//This function really helps if there are objects (usually MovieClips) that we just want to animate into place (they are already at their end position on the stage for example). 
	public static function from(target:Object, duration:Float, vars:Object) : TweenLite
	{
		vars.runBackwards = true;
		return new TweenLite(target, duration, vars);
	}

	public static function delayedCall(delay:Float, onComplete:Object, onCompleteParams:Array<Object> = null) : TweenLite
	{
		return new TweenLite(onComplete, 0, {
			delay:delay, onComplete:onComplete, onCompleteParams:onCompleteParams, overwrite:false
		}); //NOTE / TO-DO: There may be a bug in the Dictionary class that causes it not to handle references to objects correctly! (I haven't verified this yet)
	}

	public static function removeTween(t:TweenLite = null):Void {
		/*flash.Lib.trace("removeTween - _all : "+_all);
		flash.Lib.trace("removeTween - t : "+t.dumpFields());
		flash.Lib.trace("removeTween - t.endTarget : " + t.endTarget.dumpFields());
		flash.Lib.trace("removeTween - _all[$t.endTarget][$t] : "+_all.get(t.endTarget) != null);*/
		if (t != null && _all.get(t.endTarget) != null) {
			//untyped __delete__(_all, _all[t.endTarget][t]);
			_all.remove(t.endTarget);
		}
	}

	public static function killTweensOf(tg:Object = null, complete:Bool = false):Void
	{		
		if (tg != null && _all.get(tg) != null)
		{
			if (complete)
			{
				//var o:Object = _all[$tg];
				var o:Array<Object> = _all.get(tg);
				for (tw in o)
				{
					o[tw].complete(false);
				}
			}
			_all.remove(tg);
		}
	}

	public function render(t:UInt):Void
	{
		var time:Float = (t - this.startTime) / 1000;
		if (time > this.duration) {
			time = this.duration;
		}
		var factor:Float = this.vars.ease(time, 0, 1, this.duration);
		var tp:Object;
			
		for (p in Reflect.fields(this.tweens)) {
			trace("TweenLite.as - render - p : " + p);
			tp = Reflect.field(this.tweens, p);
			Reflect.setField(tp.o, p, tp.s + (factor * tp.c));
		}
		
		if (this.vars.onUpdate != null) {
			this.vars.onUpdate.apply(null, this.vars.onUpdateParams);
		}
		
		if (time == this.duration) { //Check to see if we're done
			complete(true);
		}
	}

	public static function executeAll(e:Event):Void {
		//flash.Lib.trace("TweenLite.hx - executeAll - e : " + e);
		//flash.Lib.trace("TweenLite.hx - executeAll - _all : " + _all);
		var a:Object = _all;
		//flash.Lib.trace("TweenLite.hx - executeAll - a : " + a);
		var t:UInt = flash.Lib.getTimer();
		//flash.Lib.trace("TweenLite.hx - executeAll - t :" + t);
		var p:Object, tw:Object;
		for (p in _all.keys()) {
			//flash.Lib.trace("TweenLite.hx - executeAll - p : " + p.dumpFields());
			//flash.Lib.trace("TweenLite.hx - executeAll - _all.get(p) : " + _all.get(p));
			var fields : ObjectMap<Object, Object> = cast(_all.get(p), ObjectMap<Object, Object>);
			//flash.Lib.trace("TweenLite.hx - executeAll - fields : " + fields.keys());
			for (tweenLite in fields.keys()) {
				//trace("TweenLite.hx - executeAll - tw " + tw.dumpFields());
				//trace("TweenLite.as - executeAll - tw : " + Type.typeof(tw) + " => " +  tw.dumpFields());
				var tw : TweenLite = cast(tweenLite, TweenLite);
				if (tweenLite != null && tw.active) {
					tw.render(t);
					if (_all.get(p) == null) { //Could happen if, for example, an onUpdate triggered a killTweensOf() for the object that's currently looping here. Without this code, we run the risk of hitting 1010 errors
						break;
					}
				}
			}			
		}
	}

	public function complete(skipRender:Bool = false):Void
	{
		if (!skipRender)
		{
			this.startTime = 0;
			render(cast(this.duration * 1000, UInt)); //Just to force the render
			return;
		}
		
		if (Std.is(Type.typeof(this.vars.autoAlpha), Float) && this.target.alpha == 0)
		{ 
			this.target.visible = false;
		}
		
		if (this.vars.onComplete != null)
		{
			this.vars.onComplete.apply(null, this.vars.onCompleteParams);
		}
		removeTween(this);
	}

	public static function killGarbage(e:TimerEvent):Void
	{
		var a:Object = _all;
		var tg_cnt:UInt = 0;
		var found:Bool;
		var p:Object, twp:Object, tw:Object;
		
		//for (p in a)
		var fields = Reflect.fields(a);
		for (p in fields)
		{
			found = false;
			//for (twp in a[p])
			var fields_p = Reflect.fields(a[cast(p, Int)]);
			for (twp in fields_p)
			{
				found = true;
				break;
			}
			
			if (!found)
			{
				untyped __delete__(a, p);
			}
			else {
				tg_cnt++;
			}
		}
		if (tg_cnt == 0) {
			_sprite.removeEventListener(Event.ENTER_FRAME, executeAll);
			_timer.removeEventListener("timer", killGarbage);
			_timer.stop();
			_listening = false;
		}
	}

	//Default ease function for tweens other than alpha (Regular.easeOut)
	private static function easeOut(t:Float, b:Float, c:Float, d:Float) : Float
	{
		return -c * (t /= d) * (t - 2) + b;
	}

	private function easeProxy(t:Float, b:Float, c:Float, d:Float, arguments:Array<Object>=null) : Float
	{ //Just for when easeParams are passed in via the vars object.
		return this.vars.proxiedEase.apply(null, arguments.concat(this.vars.easeParams));
	}

	//---- GETTERS / SETTERS -----------------------------------------------------------------------

	public var active(get, set):Bool;
	
	private function get_active():Bool
	{
		//flash.Lib.trace("TweenLite.hx - get_active - _active : " + _active);
		//var er:Error = new Error("BREAK"); //creating but not throwing the error
		//flash.Lib.trace(er.getStackTrace()); // see where the issue is happening, but continue running normally!
		if (_active)
		{
			return true;
		}
		else if ((flash.Lib.getTimer() - this.initTime) / 1000 > this.delay) {
			active = true;
			this.startTime = cast(this.initTime + (this.delay * 1000), UInt);
			
			if (this.vars.runBackwards != true) {
				initTweenVals();
			} else if (Std.is(Type.typeof(this.vars.autoAlpha), Float)) {
				this.target.visible = true;
			}
			
			if (this.vars.onStart != null) {
				this.vars.onStart.apply(null, this.vars.onStartParams);
			}
			
			if (this.duration == 0.001) { //In the constructor, if the duration is zero, we shift it to 0.001 because the easing functions won't work otherwise. We need to offset the this.startTime to compensate too.
				this.startTime -= 1;
			}
			return true;
		}
		else {
			return false;
		}
	}
	
	private function set_active(active:Bool):Bool
	{
		return _active = active;
	}
	
	public var endTarget(get, set):Object;
	
	private function get_endTarget():Object {
		return _endTarget;
	}
	
	private function set_endTarget(t:Object) : Object
	{
		if (this.duration == 0.001 && this.delay <= 0)
		{//Otherwise subtweens (like for color or volume) that have a duration of 0 will stick around for 1 frame and get rendered in the executeAll() loop which means they'll render incorrectly
			removeTween(this);
		}
		else {
			_all.remove(_all.get(_endTarget));
			_endTarget = t;
			if (_all.get(t) == null) {
				_all.set(t, new ObjectMap<Object, Object>());
				//flash.Lib.trace("TweenLite.hx - endTarget - _all.get(t) : "+_all.get(t));
			}
			_all.set(t, this);
		}
		return _endTarget;
	}
		
	@isVar public var volumeProxy(get, set):Float;
	
	private function get_volumeProxy():Float {
		return _sound.volume;
	}
	
	private function set_volumeProxy(n:Float):Float { //Used as a proxy of sorts to control the volume of the target MovieClip.
		_sound.volume = n;
		this.target.soundTransform = _sound;
		return this.target.soundTransform;
	}
		
	@isVar public var colorProxy(get, set):Float;
	
	private function get_colorProxy():Float {
		return 0;
	}
	
	private function set_colorProxy(n:Float):Float { 
		var r:Float = 1 - n;
		this.target.transform.colorTransform = new ColorTransform(_color.redMultiplier * r + _endColor.redMultiplier * n,
									  _color.greenMultiplier * r + _endColor.greenMultiplier * n,
									  _color.blueMultiplier * r + _endColor.blueMultiplier * n,
									  _color.alphaMultiplier * r + _endColor.alphaMultiplier * n,
									  _color.redOffset * r + _endColor.redOffset * n,
									  _color.greenOffset * r + _endColor.greenOffset * n,
									  _color.blueOffset * r + _endColor.blueOffset * n,
									  _color.alphaOffset * r + _endColor.alphaOffset * n);
		return r;
	}
	
	// If you want to be able to set or get the progress of a Tween, uncomment these getters/setters. 0 = beginning, 0.5 = halfway through, and 1 = complete
	/*@isVar */public var progress(get, set):Float;
	
	private function get_progress():Float {
		return cast(((flash.Lib.getTimer() - this.startTime) / 1000) / this.duration, Float);
	}
	
	private function set_progress(n:Float):Float {
		var tmr:Int = flash.Lib.getTimer();
		var t:Float = tmr - ((this.duration * n) * 1000);
		this.initTime = cast(t - (this.delay * 1000), UInt);
		var s:Bool = this.active; //Just to trigger all the onStart stuff.
		this.startTime = cast(t, UInt);
		render(tmr);
		return n;
	}

}