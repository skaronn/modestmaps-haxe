package com.google.maps;

@:final class Constants 
{
	public function Constants()
	{
		super();
		return;
	}

	public static inline var HYBRID_MAP_URL_ARG:String="k";

	public static inline var SATELLITE_MAP_TYPE_NAME:String="satellite";

	public static inline var FLOAT_PANE:Float=7;

	public static inline var NORMAL_MAP_ABBR_ID:String="normal_map_abbreviated";

	public static inline var MAX_RESOLUTION_PHYSICAL:Float=30;

	public static inline var HYBRID_MAP_NAME_ID:String="hybrid_map";

	public static inline var MAP_PANE:Float=0;

	public static inline var MAX_RESOLUTION_MAP:Float=30;

	public static inline var HYBRID_MAP_ALT_ID:String="show_imagery_with_street_names";

	public static inline var ZOOM_LEVEL_LIMIT:Float=Math.max(MAX_RESOLUTION_MAP, MAX_RESOLUTION_SATELLITE) + 1;

	public static inline var SATELLITE_MAP_URL_ARG:String="k";

	public static inline var SATELLITE_MAP_ERROR_ID:String="keyhole_error_tile";

	public static inline var DEFAULT_PANNING_DISTANCE:Float=100;

	public static inline var HYBRID_MAP_ABBR_ID:String="hybrid_map_abbreviated";

	public static inline var OVERLAY_LAYER_PANE:Float=1;

	public static inline var DEFAULT_RESOLUTION_SATELLITE:Float=19;

	public static inline var SATELLITE_MAP_ALT_ID:String="show_satellite_imagery";

	public static inline var SATELLITE_MAP_NAME_ID:String="keyhole_map";

	public static inline var HYBRID_MAP_TYPE_NAME:String="hybrid";

	public static inline var SATELLITE_COPYRIGHT_PREFIX_ID:String="satellite_prefix";

	public static inline var UNIMPLEMENTED_METHOD:String="Method not implemented";

	public static inline var DEFAULT_RESOLUTION_MAP:Float=17;

	public static inline var PHYSICAL_MAP_TYPE_NAME:String="physical";

	public static inline var SATELLITE_MAP_ABBR_ID:String="keyhole_map_abbreviated";

	public static inline var NORMAL_MAP_ALT_ID:String="show_street_map";

	public static inline var MARKER_PANE:Float=4;

	public static inline var MASTER_NAME:String="com_google_maps_Master";

	public static inline var GOOGLE_COPYRIGHT_PREFIX_ID:String="google";

	public static inline var NORMAL_MAP_TYPE_NAME:String="normal";

	public static inline var PHYSICAL_MAP_URL_ARG:String="p";

	public static inline var MAP_COPYRIGHT_PREFIX_ID:String="map_prefix";

	public static inline var NOT_IMPLEMENTED:String="Required interface method not implemented";

	public static inline var PHYSICAL_MAP_ALT_ID:String="show_street_map_with_terrain";

	public static inline var PHYSICAL_MAP_NAME_ID:String="terrain_map";

	public static inline var NORMAL_MAP_ERROR_ID:String="map_error_tile";

	public static inline var MAX_RESOLUTION_SATELLITE:Float=30;

	public static inline var NORMAL_MAP_URL_ARG:String="m";

	public static inline var DEFAULT_RESOLUTION_PHYSICAL:Float=17;

	public static inline var NORMAL_MAP_NAME_ID:String="normal_map";

	public static inline var PHYSICAL_MAP_ABBR_ID:String="terrain_map_abbreviated";
}