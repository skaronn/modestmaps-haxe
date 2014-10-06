package com.google.maps.services;

import com.google.maps.*;
import com.google.maps.wrappers.*;

class Placemark 
{
	public function Placemark()
	{
		super();
		return;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.services.Placemark
	{
		var loc1:Dynamic;
		loc1 = null;
		loc1 = new Placemark();
		loc1.point = com.google.maps.LatLng.fromObject(arg1.point);
		loc1.address = cast(arg1.address, String);
		loc1.addressDetails = arg1.addressDetails;
		com.google.maps.wrappers.Wrapper.copyObject(loc1, arg1);
		return loc1;
	}

	public var point:com.google.maps.LatLng;

	public var address:String;

	public var addressDetails:Dynamic;
}