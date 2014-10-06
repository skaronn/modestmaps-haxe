package com.google.maps.overlays;

import com.google.maps.*;
import com.google.maps.interfaces.*;
import com.google.maps.wrappers.*;

class Marker extends com.google.maps.wrappers.IMarkerWrapper implements com.google.maps.interfaces.IMarker
{
public function new(arg1:com.google.maps.LatLng, arg2:com.google.maps.overlays.MarkerOptions=null)
{
	var loc1:Dynamic;
	loc1 = null;
	var loc2:Dynamic;
	loc2 = null;
	super();
	loc1 = com.google.maps.ClientBootstrap.getInstance();
	loc2 = loc1.getMapsFactory();
	com.google.maps.wrappers.Wrapper.instance().wrap(loc2.createMarker(arg1, arg2), this, com.google.maps.interfaces.IMarker, com.google.maps.overlays.Marker);
	return;
}
}