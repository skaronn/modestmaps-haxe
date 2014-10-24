package gs.core;

/**
 * Animation core
 * @author PRASS
 */

extern class Animation {
	
    public function Animation(duration:Float, ?vars:Dynamic):Void;
	
	/**
	 * 
	 * @param	value
	 * @return
	 */
    public function delay(value:Float):Dynamic;
	
	/**
	 * 
	 * @param	value
	 * @return
	 */
    public function duration(value:Float):Dynamic;
	
	/**
	 * 
	 * @param	type
	 * @param	?__callback
	 * @param	?params
	 * @param	?scope
	 * @return
	 */
    public function eventCallback(type:String, ?__callback:Dynamic, ?params:Array<Dynamic>, ?scope:Dynamic):Dynamic;
	
	/**
	 * 
	 * @return
	 */
    public function invalidate():Dynamic;
	
	/**
	 * 
	 * @param	?vars
	 * @param	?target
	 * @return
	 */
    public function kill(?vars:Dynamic, ?target:Dynamic):Dynamic;
	
	/**
	 * Pause
	 * @param	?atTime
	 * @param	suppressEvents
	 * @return
	 */
    public function pause(?atTime:Dynamic, ?suppressEvents:Bool):Dynamic;
	
	/**
	 * Paused
	 * @param	?value
	 * @return
	 */
    public function paused(suppressEvents:Bool = true):Dynamic;
	
	/**
	 * Play
	 * @param	?from
	 * @param	suppressEvents
	 * @return
	 */
    public function play(?from:Dynamic, suppressEvents:Bool = true):Dynamic;
	
	/**
	 * 
	 * @param	?includeDelay
	 * @param	suppressEvents
	 * @return
	 */
    public function restart(?includeDelay:Bool, suppressEvents:Bool = true):Dynamic;
	
	/**
	 * 
	 * @param	?from
	 * @param	suppressEvents
	 * @return
	 */
    public function resume(?from:Dynamic, suppressEvents:Bool = true):Dynamic;
	
	/**
	 * 
	 * @param	?from
	 * @param	suppressEvents
	 * @return
	 */
    public function reverse(?from:Dynamic, suppressEvents:Bool = true):Dynamic;
	
	/**
	 * 
	 * @param	?value
	 * @return
	 */
    public function reversed(?value:Bool):Dynamic;
	
	/**
	 * 
	 * @param	time
	 * @param	suppressEvents
	 * @return
	 */
    public function seek(time:Dynamic, suppressEvents:Bool = true):Dynamic;
	
	/**
	 * 
	 * @param	value
	 * @return
	 */
    public function startTime(value:Float):Dynamic;
	
	/**
	 * 
	 * @param	value
	 * @param	suppressEvents
	 * @return
	 */
    public function time(value:Float, ?suppressEvents:Bool):Dynamic;
	
	/**
	 * 
	 * @param	value
	 * @return
	 */
    public function timeScale(value:Float):Dynamic;
	
	/**
	 * 
	 * @param	value
	 * @return
	 */
    public function totalDuration(value:Float):Dynamic;
	
	/**
	 * 
	 * @param	time
	 * @param	suppressEvents
	 * @return
	 */
    public function totalTime(time:Float, ?suppressEvents:Bool):Dynamic;
}