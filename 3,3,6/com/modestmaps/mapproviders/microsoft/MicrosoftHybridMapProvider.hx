package com.modestmaps.mapproviders.microsoft;

/**
 * @author darren
 * $Id$
 */
class MicrosoftHybridMapProvider extends MicrosoftProvider
{
public function new(minZoom:Int=MIN_ZOOM, maxZoom:Int=MAX_ZOOM)
{
	super(HYBRID, true, minZoom, maxZoom);
}
}