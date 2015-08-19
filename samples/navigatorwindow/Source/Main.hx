package;

import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.utils.ByteArray;
import openfl.utils.Object;

import hxculture.FormatNumber;
import hxculture.cultures.FrFR;

import com.modestmaps.Map;
import com.modestmaps.TweenMap;
import com.modestmaps.core.MapExtent;
import com.modestmaps.events.MapEvent;
import com.modestmaps.extras.MapControls;
import com.modestmaps.extras.MapScale;
import com.modestmaps.extras.NavigatorWindow;
import com.modestmaps.extras.ZoomBox;
import com.modestmaps.extras.ZoomSlider;
import com.modestmaps.extras.ui.Tooltip;
import com.modestmaps.geo.Location;
import com.modestmaps.mapproviders.google.GoogleMapProvider;

class Main extends Sprite 
{
	// Our modest map
	private var map:Map;

	// status text field at bottom of screen
	private var status:TextField;

	// padding around map in pixels
	private static var PADDING:Int = 20;
	
	private static var STATUS:String = "Welcome to ModestMaps for Haxe !";
	
	public function new ()
	{	
		super();
		
		// setup stage
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.addEventListener(Event.RESIZE, onResize);

		// create child components
		createChildren();    	

		// init size by forcing call to stage resize handler
		onResize();
	}
		
	/**
	* Creates child componets
	* - map
	* - status text field
	* - buttons
	*/
	private function createChildren():Void 
	{		
		trace("createChildren - stage.stageWidth : "+stage.stageWidth);
		trace("createChildren - stage.stageHeight : "+stage.stageHeight);
		// create map		
		map = new TweenMap(stage.stageWidth - 2 * PADDING, stage.stageHeight - 2 * PADDING, 
				true, new GoogleMapProvider(), [ { new MapExtent(11.135, -0.967, 6.790, -15.535); } ]);
		map.addEventListener(MouseEvent.DOUBLE_CLICK, map.onDoubleClick);
		map.x = map.y = PADDING;

		// listen for map events
		map.addEventListener(MapEvent.ZOOMED_BY, onZoomed);
		map.addEventListener(MapEvent.STOP_ZOOMING, onStopZoom);
		map.addEventListener(MapEvent.PANNED, onPanned);
		map.addEventListener(MapEvent.STOP_PANNING, onStopPan);
		map.addEventListener(MapEvent.RESIZED, onResized);
		
		// add some controls using the MapControls extra
		// we're adding them as children of map so they move with the map
		map.addChild(new MapControls(map, true, true));
		map.addChild(new ZoomSlider(map));				
		map.addChild(new ZoomBox(map));
		map.addChild(new MapScale(map, 140));
		map.addChild(new NavigatorWindow(map));

		// create text field to hold status text	                
		status = new TextField();
		status.defaultTextFormat = new TextFormat('Verdana', 10, 0x000000);
		status.selectable = false;
		status.text = STATUS;
		status.width = 600;
		status.height = 20;
		
		// add children to the display list
		addChild(map);
		addChild(status);
	}
	
	/**
	 * Stage Resize handler
	 * 
	 * @param	event
	 */
	private function onResize(event:Event = null):Void 
	{
		var w:Float = stage.stageWidth - 2 * PADDING;
		var h:Float = stage.stageHeight - 2 * PADDING;
		
		// position and size the map
		map.x = map.y = PADDING;
		map.setSize(w, h);

		// place status just below the map on the left
		status.width = w;
		status.x = map.x + 2;
		status.y = map.y + h;
	}

	//---------------------
	// Map Event Handlers
	//---------------------
	private function onPanned(event:MapEvent):Void 
	{
		status.text = 'Panned by ' + event.panDelta.toString() + ', top left: ' + map.getExtent().northWest.toString() + ', bottom right: ' + map.getExtent().southEast.toString();
	}

	private function onStopPan(event:MapEvent):Void 
	{
		status.text = 'Stopped panning, top left: ' + map.getExtent().northWest.toString() + ', center: ' + map.getCenterZoom()[0].toString() + ', bottom right: ' + map.getExtent().southEast.toString() + ', zoom: ' + map.getCenterZoom()[1];
	}

	private function onZoomed(event:MapEvent):Void 
	{
		status.text = 'Zoomed by ' + FormatNumber.decimal(event.zoomDelta, FrFR.culture, 3) + ', top left: ' + map.getExtent().northWest.toString() + ', bottom right: ' + map.getExtent().southEast.toString();
	}

	private function onStopZoom(event:MapEvent):Void 
	{
		status.text = 'Stopped zooming, top left: ' + map.getExtent().northWest.toString() + ', center: ' + map.getCenterZoom()[0].toString() + ', bottom right: ' + map.getExtent().southEast.toString() + ', zoom: ' + map.getCenterZoom()[1];
	}

	private function onResized(event:MapEvent):Void 
	{
		if(event != null && event.newSize != null) status.text = 'Resized to: ' + event.newSize[0] + ' x ' + event.newSize[1];
	}
		
}