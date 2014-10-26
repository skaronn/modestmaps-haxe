package com.modestmaps.mapproviders.microsoft;

/**
 * @author darren
 * $Id$
 */
class MicrosoftHybridMapProvider extends MicrosoftProvider
{
	public function new(minZoom:Int=AbstractMapProvider.MIN_ZOOM, maxZoom:Int=AbstractMapProvider.MAX_ZOOM)
	{
		super(MicrosoftProvider.HYBRID, true, minZoom, maxZoom);
	}
}