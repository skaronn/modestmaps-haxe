/**
 * VERSION: 12.0
 * DATE: 2012-01-12
 * AS3 
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.plugins;

import com.greensock.TweenLite;
import flash.filters.GlowFilter;
/**
 * [AS3/AS2 only] Tweens a GlowFilter. The following properties are available (you only need to define the ones you want to tween):
 * <code>
 * <ul>
 * 	<li> color : UInt [0x000000]</li>
 * 	<li> alpha :Float [0]</li>
 * 	<li> blurX : Float [0]</li>
 * 	<li> blurY : Float [0]</li>
 * 	<li> strength : Float [1]</li>
 * 	<li> quality : UInt [2]</li>
 * 	<li> inner : Bool [false]</li>
 * 	<li> knockout : Bool [false]</li>
 * 	<li> index : UInt</li>
 * 	<li> addFilter : Bool [false]</li>
 * 	<li> remove : Bool [false]</li>
 * </ul>
 * </code>
 * 
 * <p>Set <code>remove</code> to true if you want the filter to be removed when the tween completes. </p>
 * 
 * <p><b>USAGE:</b></p>
 * <listing version="3.0">
import com.greensock.TweenLite;
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.GlowFilterPlugin; 
TweenPlugin.activate([GlowFilterPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.

TweenLite.to(mc, 1, {glowFilter:{color:0x00FF00, blurX:10, blurY:10, strength:1, alpha:1}});
</listing>
 * 
 * <p><strong>Copyright 2008-2014, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for <a href="http://www.greensock.com/club/">Club GreenSock</a> members, the software agreement that was issued with the membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */
class GlowFilterPlugin extends FilterPlugin {
/** @private **/	
public static inline var API:Float = 2; //If the API/Framework for plugins changes in the future, this number helps determine compatibility
/** @private **/
private static var _propNames:Array = ["color","alpha","blurX","blurY","strength","quality","inner","knockout"];

/** @private **/	
public function new() {
	super("glowFilter");
}

/** @private **/	
override public function _onInitTween(target:Map<String, Int>, value:Dynamic, tween:TweenLite):Bool {
	return _initFilter(target, value, tween, GlowFilter, new GlowFilter(0xFFFFFF, 0, 0, 0, value.strength || 1, value.quality || 2, value.inner, value.knockout), _propNames);
}

}