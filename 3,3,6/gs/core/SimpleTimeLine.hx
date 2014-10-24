package gs.core;

/**
 * SimpleTimeline is the base class for TimelineLite and TimelineMax, providing the most basic timeline functionality
 * and it is used for the root timelines in TweenLite but is only intended for internal use in the GreenSock tweening platform.
 * It is meant to be very fast and lightweight. 
 * @author PRASS
 */

extern class SimpleTimeLine extends Animation {
	
	/**
	 * If true, child tweens/timelines will be removed as soon as they complete.
	 */
	public var autoRemoveChildren : Bool;
	
	/**
	 * Controls whether or not child tweens/timelines are repositioned automatically (changing their startTime) in order to maintain smooth playback when properties are changed on-the-fly.
	 */
	public var smoothChildTiming : Bool;
	
	/**
	 * Add
	 * Adds a TweenLite, TweenMax, TimelineLite, or TimelineMax instance to the timeline at a specific time.
	 * @param	child
	 * @param	?position
	 * @param	align
	 * @param	stagger
	 * @return
	 */
	public function add(child : Dynamic, ?position: Dynamic, align : String = "normal", stagger : Float = 0 ) : Dynamic;
	
	/**
	 * Render
	 * @param	time
	 * @param	?suppressEvents
	 * @param	?force
	 */
    public function render(time:Float, ?suppressEvents:Bool, ?force:Bool):Void;
}

