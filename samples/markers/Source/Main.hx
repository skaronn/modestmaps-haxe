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
//import openfl.utils.Object;

import hxculture.FormatNumber;
import hxculture.cultures.FrFR;

import com.modestmaps.Map;
import com.modestmaps.TweenMap;
import com.modestmaps.core.MapExtent;
import com.modestmaps.events.MapEvent;
import com.modestmaps.extras.MapControls;
import com.modestmaps.events.MarkerEvent;
import com.modestmaps.extras.ZoomBox;
import com.modestmaps.extras.ZoomSlider;
import com.modestmaps.extras.ui.Tooltip;
import com.modestmaps.extras.ui.MapProviderButton;
import com.modestmaps.extras.ui.SampleMarker;
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
		super ();
		
		// setup stage
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.addEventListener(Event.RESIZE, onResize);

		// create child components
		createChildren();    	

		// place the markers
		placeMarkers();

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
				true, new GoogleMapProvider(), [ { new MapExtent(48.8789, 48.8451, 2.3734, 2.2862); } ]);
		map.addEventListener(MouseEvent.DOUBLE_CLICK, map.onDoubleClick);
		map.x = map.y = PADDING;

		// listen for map events
		map.addEventListener(MapEvent.ZOOMED_BY, onZoomed);
		map.addEventListener(MapEvent.STOP_ZOOMING, onStopZoom);
		map.addEventListener(MapEvent.PANNED, onPanned);
		map.addEventListener(MapEvent.STOP_PANNING, onStopPan);
		map.addEventListener(MapEvent.RESIZED, onResized);

		// listen for marker events
		map.addEventListener(MarkerEvent.MARKER_CLICK, onMarkerClick);
		map.addEventListener(MarkerEvent.MARKER_ROLL_OVER, onMarkerRollOver);
		map.addEventListener(MarkerEvent.MARKER_ROLL_OUT, onMarkerRollOut);
		
		// add some controls using the MapControls extra
		// we're adding them as children of map so they move with the map
		map.addChild(new MapControls(map, true, true));
		map.addChild(new ZoomSlider(map));				
		map.addChild(new ZoomBox(map));

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
	* Places sample markers on our map
	*/		
	private function placeMarkers():Void 
	{   	        	             	
		// Some sample data
		// In most cases, we would have loaded this from XML, or a web service.
		var markerpoints:Array<Dynamic> = [
			{ title:"Cathédrale Notre-Dame de Paris", location:"48.852966, 2.349902" },
			{ title:"Tour Eiffel", location:"48.858370, 2.294481"},
			{ title:"Jardin du luxembourg", location:"48.846222, 2.33716"},
			{ title:"Musée du louvre", location:"48.860611, 2.337644"},
			{ title:"Arc de triomphe", location:"48.873792, 2.295028"},
			{ title:"Sacré-Coeur", location:"48.886705, 2.343104"},
			{ title:"Gare du nord, the biggest Train Station in Europe", location:"48.880981, 2.35534"}
		];
		
		var marker:SampleMarker;
		
		// Now, we just loop through our data set, and place the markers
		for (point in markerpoints)
		{							
			// step 1 - create a marker
			marker = new SampleMarker();
			
			// step 2 - give it any custom app-specific data it might need
			marker.title = point.title;	
			
			// step 3 - create a location object
			//
			// if you have lat and long...
			//     var loc:Location = new Location (lat, long);
			//
			// but, we have a comma-separated lat/long pair, so...
			var location:Location = Location.fromString(point.location);
			//trace("placeMarkers - loc : "+loc);
			// step 4 - put the marker on the map
			map.putMarker(location, marker);
		}	      
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

	/**
	 * Marker Click
	 * 
	 * @param	event
	 */
	private function onMarkerClick(event:MarkerEvent):Void 
	{
		var marker:SampleMarker = cast(event.marker, SampleMarker);
		status.text = "Marker Clicked:  " + marker.title + "][" + event.location;
	}

	/**
	 * Marker Roll Over
	 * 
	 * @param	event
	 */
	private function onMarkerRollOver(event:MarkerEvent):Void 
	{
		var marker:SampleMarker = cast(event.marker, SampleMarker);
		trace('Roll Over MarkerEvent : [' + marker.title + "][" + event.location + "]");
		
		// show tooltip
		var pt:Point = map.locationPoint(event.location, this);
		trace('Roll Over Map Point : ' + pt);
		TooltipHelper.showTooltip(map, marker.title);
	}

	/**
	 * Marker Roll Out
	 * 
	 * @param	event
	 */
	private function onMarkerRollOut(event:MarkerEvent):Void 
	{
		// hide the tooltip
		TooltipHelper.hideTooltip();
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