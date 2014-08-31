
package com.modestmaps.mapproviders.microsoft;

/**
 * @author darren
 * $Id$
 */
class MicrosoftAerialMapProvider extends MicrosoftProvider
{
public function new(minZoom:Int=MIN_ZOOM, maxZoom:Int=MAX_ZOOM)
{
	super(AERIAL, true, minZoom, maxZoom);
}
}