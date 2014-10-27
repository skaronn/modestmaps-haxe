package com.google.maps;

import flash.display.*;

private class ClientUtil 
{
	public function new()
	{
	}

	public static function getFlashVar(arg1:flash.display.LoaderInfo, arg2:String):String
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = null;
		loc1 = arg1.parameters;
		loc2 = null;
		if (loc1 == null)
		{
			return null;
		}
		return cast(loc1[arg2], String);
	}
}