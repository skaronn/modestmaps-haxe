package com.google.maps.services;

import com.google.maps.wrappers.*;

class GeocodingResponse 
{
	public function GeocodingResponse()
	{
		super();
		return;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.services.GeocodingResponse
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = new GeocodingResponse();
		loc1.name = arg1.name;
		loc1.placemarks = com.google.maps.wrappers.Wrapper.instance().wrapPlacemarkArray(arg1.placemarks);
		com.google.maps.wrappers.Wrapper.copyObject(loc1, arg1);
		return loc1;
	}

	public var name:String;

	public var placemarks:Array<Dynamic>;
}