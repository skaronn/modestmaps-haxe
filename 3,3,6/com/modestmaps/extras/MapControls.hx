package com.modestmaps.extras;

import com.modestmaps.Map;
import com.modestmaps.events.MapEvent;
import com.modestmaps.extras.ui.Button;
import com.modestmaps.extras.ui.FullScreenButton;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.FullScreenEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.geom.ColorTransform;
import flash.text.TextField;
import flash.ui.Keyboard;	

/** 
 * this is a bit of a silly class really,
 * implementing a whole mini layout framework 
 * just so that you don't have to have
 * the same button layout that I like.
 * 
 * even though you have to have
 * rounded corners and bevels.  
 * 
 * take that!
 */
class MapControls extends Sprite
{
	public var leftButton:Button;
	public var rightButton:Button;
	public var upButton:Button;
	public var downButton:Button;

	public var inButton:Button;
	public var outButton:Button;

	public var fullScreenButton:FullScreenButton = new FullScreenButton();

	private var map:Map;
	private var keyboard:Bool;
	private var fullScreen:Bool;

	private var buttons:Array<Dynamic>;
	private var actions:Array<Dynamic>;

	// you can change these if you want,
	// each button is positioned by it's top-left point
	// and is 20x20px
	// positionFunctions understand top, bottom, left and right
	//  in px or %
	// if you use %, be aware the default alignment is left-top
	// but that you'll probably want top-center for horizontal %
	// and center-left for vertical %
	public static inline var GROUPED:Dynamic = {
		leftButton: { left: '15px', bottom: '15px' },
		rightButton: { left: '65px', bottom: '15px' },
		upButton: { left: '40px', bottom: '40px' },
		downButton: { left: '40px', bottom: '15px' },
		inButton: { left: '95px', bottom: '40px' },
		outButton: { left: '95px', bottom: '15px' },
		fullScreenButton: { left: '125px', bottom: '15px' }
	};

	public static inline var SIDES:Dynamic = {
		leftButton: { left: '15px', top: '50%', align: 'center-left' },
		rightButton: { right: '15px', bottom: '50%', align: 'center-left' },
		upButton: { left: '50%', top: '15px', align: 'top-center' },
		downButton: { right: '50%', bottom: '15px', align: 'top-center' },
		inButton: { left: '15px', top: '15px' },
		outButton: { left: '15px', top: '40px' },
		fullScreenButton: { left: '15px', bottom: '15px' }
	};

	private var positions:Dynamic = GROUPED;

	private var hAlignFunctions:Dynamic = {
		center: function(child:DisplayObject):Float {
			return child.width / 2;
		},		
		left: function(child:DisplayObject):Float {
			return 0;
		},
		right: function(child:DisplayObject):Float {
			return child.width;
		}
	};

	private var vAlignFunctions:Dynamic = {
		center: function(child:DisplayObject):Float {
			return child.height / 2;
		},		
		top: function(child:DisplayObject):Float {
			return 0;
		},
		bottom: function(child:DisplayObject):Float {
			return child.height;
		}
	}

	private var positionFunctions:Dynamic = {
		left: function(child:DisplayObject, s:String, a:String):Void {
		if (s.lastIndexOf("%") >= 0) {
			child.x = map.getWidth() * Std.parseFloat(s.substring(-1)) / 100.0;
		}
		else { 
			child.x = Std.parseFloat(s.substring(-2));
		} 
		child.x -= a ? hAlignFunctions[a.split('-')[1]](child) : 0;
		},
		right: function(child:DisplayObject, s:String, a:String):Void { 
		if (s.lastIndexOf("%") >= 0) { 
			child.x = map.getWidth() - (map.getWidth() * Std.parseFloat(s.substring(-1)) / 100.0) - child.width;
		}
		else { 
			child.x = map.getWidth() - Std.parseFloat(s.substring(-2)) - child.width;
		} 
		child.x += a ? hAlignFunctions[a.split('-')[1]](child) : 0;
		},
		top: function(child:DisplayObject, s:String, a:String):Void { 
		if (s.lastIndexOf("%") >= 0) { 
			child.y = map.getHeight() * Std.parseFloat(s.substring(-1)) / 100.0;
		}
		else { 
			child.y = Std.parseFloat(s.substring(-2));
		} 
		child.y -= a ? vAlignFunctions[a.split('-')[0]](child) : 0;
		},
		bottom: function(child:DisplayObject, s:String, a:String):Void { 
		if (s.lastIndexOf("%") >= 0) { 
			child.y = map.getHeight() - (map.getHeight() * Std.parseFloat(s.substring(-1)) / 100.0) - child.height;
		}
		else { 
			child.y = map.getHeight() - Std.parseFloat(s.substring(-2)) - child.height;
		} 
		child.y += a ? vAlignFunctions[a.split('-')[0]](child) : 0;
		}
	};

	public function new(map:Map, keyboard:Bool=true, fullScreen:Bool=false, buttonPositions:Dynamic=null, buttonClass:Type=null)
	{
		if (!buttonClass) buttonClass = Button;
		
		leftButton = new Type(Button.LEFT);
		rightButton = new Type(Button.RIGHT);
		upButton = new Type(Button.UP);
		downButton = new Type(Button.DOWN);
		
		inButton = new Type(Button.IN);
		outButton = new Type(Button.OUT);

		this.map = map;
		this.keyboard = keyboard;
		this.fullScreen = fullScreen;
		
		if (buttonPositions) {
			this.positions = buttonPositions;
		}
		
		filters = [ new DropShadowFilter(1,45,0,1,3,3,.7,2) ];
		
		var buttonSprite:Sprite = new Sprite();
		addChild(buttonSprite);
		
		actions = [ map.panLeft, map.panRight, map.panUp, map.panDown, map.zoomIn, map.zoomOut ];
		buttons = [ leftButton, rightButton, upButton, downButton, inButton, outButton ];
		
		if (fullScreen)
		{
			buttons.push(fullScreenButton);
			actions.push(fullScreenButton.toggleFullScreen);
		}   

		for (i in 0...buttons.length)
		{
			buttons[i].addEventListener(MouseEvent.CLICK, actions[i]);
			buttonSprite.addChild(buttons[i]);		
		}

		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);	   

	}

	public function setButtonTransforms(overTransform:ColorTransform, outTransform:ColorTransform):Void
	{		
		for (button in buttons) {
		button.overTransform = overTransform;
		button.outTransform = outTransform;	
		button.transform.colorTransform = outTransform;
		}
	}

	private function onAddedToStage(event:Event):Void
	{
		if (keyboard) { 
			map.addEventListener(KeyboardEvent.KEY_UP, onKeyboardEvent);
			map.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
		}
		if (fullScreen) { 
		stage.addEventListener(FullScreenEvent.FULL_SCREEN, onFullScreenEvent);
		}
		
		// since our size is based on map size, wait for map to be resized, so we don't 
		// accidentally get sized before the map on stage resize events		
		map.addEventListener( MapEvent.RESIZED, onMapResize );  
		map.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDownClick);
		
		onMapResize(null);
	}

	private function onMouseDownClick(event:MouseEvent):Void
	{
		map.focusRect = false;
		stage.focus = map;
	}

	private function onKeyboardEvent(event:KeyboardEvent):Void
	{
		if (!stage || Std.is(stage.focus, TextField)) return;

		var buttonKeys:Object = {
		'+': inButton,		
		'=': inButton,		
		'-': outButton,		
		'_': outButton		
		};
		
		buttonKeys[Keyboard.LEFT] = leftButton;	   	
		buttonKeys[Keyboard.RIGHT] = rightButton;
		buttonKeys[Keyboard.DOWN] = downButton;	   	
		buttonKeys[Keyboard.UP] = upButton;
		
		var char:String = String.fromCharCode(event.charCode);
		
		if (buttonKeys[char]) {
			if (event.type == KeyboardEvent.KEY_DOWN) {
				buttonKeys[char].onMouseOver();
			}
			else {
				buttonKeys[char].onMouseOut();
				cast(actions[buttons.indexOf(buttonKeys[char])], Dynamic).call();
			}
		}
		else if (buttonKeys[event.keyCode]) {
			if (event.type == KeyboardEvent.KEY_DOWN) {
				buttonKeys[event.keyCode].onMouseOver();
			}
			else {
				buttonKeys[event.keyCode].onMouseOut();
				cast(actions[buttons.indexOf(buttonKeys[event.keyCode])], Dynamic).call();
			}
		}
		//event.stopImmediatePropagation();
	}

	private function onMapResize(event:Event):Void
	{
		var w:Float = map.getWidth();
		var h:Float = map.getHeight();
		
		for (child in positions)
		{
			var position:Object = positions[child];
			for (reference in position)
			{
				if (reference == 'align') continue;
				positionFunctions[reference](this[child], position[reference], position['align']);
			}
		}
	}

	public function onFullScreenEvent(event:Event):Void
	{
		onMapResize(null);
	}
}