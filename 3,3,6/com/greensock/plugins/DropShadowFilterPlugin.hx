/**
 * VERSION: 12.0
 * DATE: 2012-01-12
 * AS3
 * UPDATES AND DOCS AT: http://www.greensock.com
 **/
package com.greensock.plugins;

import com.greensock.TweenLite;
import flash.filters.DropShadowFilter;
/**
 * [AS3/AS2 only] Tweens a DropShadowFilter. The following properties are available (you only need to define the ones you want to tween):
 * <code>
 * <ul>
 * 	<li> distance : Float [0]</li>
 * 	<li> angle : Float [45]</li>
 * 	<li> color : UInt [0x000000]</li>
 * 	<li> alpha :Float [0]</li>
 * 	<li> blurX : Float [0]</li>
 * 	<li> blurY : Float [0]</li>
 * 	<li> strength : Float [1]</li>
 * 	<li> quality : UInt [2]</li>
 * 	<li> inner : Bool [false]</li>
 * 	<li> knockout : Bool [false]</li>
 * 	<li> hideObject : Bool [false]</li>
 * 	<li> index : UInt</li>
 * 	<li> addFilter : Bool [false]</li>
 * 	<li> remove : Bool [false]</li>
 * </ul>
 * </code>
 * <p>Set <code>remove</code> to true if you want the filter to be removed when the tween completes. </p>
 * 
 * <p><b>USAGE:</b></p>
 * <listing version="3.0">
import com.greensock.TweenLite; 
import com.greensock.plugins.TweenPlugin;
import com.greensock.plugins.DropShadowFilterPlugin; 
TweenPlugin.activate([DropShadowFilterPlugin]); //activation is permanent in the SWF, so this line only needs to be run once.

TweenLite.to(mc, 1, {dropShadowFilter:{blurX:5, blurY:5, distance:5, alpha:0.6}}); 
</listing>
 * 
 * <p><strong>Copyright 2008-2014, GreenSock. All rights reserved.</strong> This work is subject to the terms in <a href="http://www.greensock.com/terms_of_use.html">http://www.greensock.com/terms_of_use.html</a> or for <a href="http://www.greensock.com/club/">Club GreenSock</a> members, the software agreement that was issued with the membership.</p>
 * 
 * @author Jack Doyle, jack@greensock.com
 */
class DropShadowFilterPlugin extends FilterPlugin {
/** @private **/
public static inline var API:Float = 2; //If the API/Framework for plugins changes in the future, this number helps determine compatibility
/** @private **/
private static var _propNames:Array = ["distance","angle","color","alpha","blurX","blurY","strength","quality","inner","knockout","hideObject"];

/** @private **/
public function new() {
	super("dropShadowFilter");
}

/** @private **/
override public function _onInitTween(target:Object, value:Dynamic, tween:TweenLite):Bool {
	return _initFilter(target, value, tween, DropShadowFilter, new DropShadowFilter(0, 45, 0x000000, 0, 0, 0, 1, value.quality || 2, value.inner, value.knockout, value.hideObject), _propNames);
}

}