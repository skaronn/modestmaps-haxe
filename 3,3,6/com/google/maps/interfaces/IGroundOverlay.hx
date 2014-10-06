package com.google.maps.interfaces;

import com.google.maps.overlays.*;

interface IGroundOverlay extends com.google.maps.interfaces.IOverlay
{
function setOptions(arg1:com.google.maps.overlays.GroundOverlayOptions):Void;

function getOptions():com.google.maps.overlays.GroundOverlayOptions;
}