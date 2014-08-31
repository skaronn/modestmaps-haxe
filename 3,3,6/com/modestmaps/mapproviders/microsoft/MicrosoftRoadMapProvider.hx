package com.modestmaps.mapproviders.microsoft;

/**
 * @author darren
 * $Id$
 */
class MicrosoftRoadMapProvider extends MicrosoftProvider
{
public function new(hillShading:Bool=true, minZoom:Int=MIN_ZOOM, maxZoom:Int=MAX_ZOOM)
{
	super(ROAD, hillShading, minZoom, maxZoom);
}
}