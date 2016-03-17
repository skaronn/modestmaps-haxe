package com.modestmaps.util;

import haxe.ds.ObjectMap;

import openfl.display.Sprite;
import openfl.errors.Error;
import openfl.text.TextFormat;
import openfl.text.TextField;
import openfl.system.System;
import openfl.utils.Object;
import openfl.utils.Timer;

import com.modestmaps.core.TileGrid;
import com.modestmaps.core.Tile;
import com.modestmaps.core.painter.TilePainter;
import com.modestmaps.core.painter.ITilePainter;

class DebugUtil
{	
	public static function dumpObject(tw:Object):Void {
		var concatFieldsDump : String = Type.getClassName(Type.getClass(tw)) + " => ";
		var fields : Array<String> = Type.getInstanceFields(Type.getClass(tw));
		var key:Int;
		
		for (key in fields) {
			var field : String = key; // fields[key];
			if(!Reflect.isFunction(field)) {
				concatFieldsDump += "[" + key +" : " + Reflect.getProperty(tw, key) + "]";
			}
		}
		flash.Lib.trace(concatFieldsDump);
	}
	
	private static function traceLog(o:Dynamic):Void {
		var len:UInt = 0;
		if (Std.is(o, ObjectMap)) {
			var object : ObjectMap<Dynamic, Dynamic> = o;
			trace("\n");
			for (key in object.keys()) {
				var dictionaryValues : String = "";
				var dictionaryLength : UInt = 0;
				var fields : ObjectMap<Dynamic, Dynamic> = object.get(key);
				for (value in fields.keys()) {
					trace(value);
					dictionaryValues += Type.typeof(value);
					//dictionaryValues += value.dumpFields();
					dictionaryLength++;
				}
				
				trace("traceLog - " + key + " ======> " + object.get(key) + "{" + dictionaryValues + "}[" + dictionaryLength + "]");
				len++;
			}
			trace("\n");
			trace("TweenLite.hx - traceLog - nb elements : " +len);
		}
		else {
			trace("TweenLite.hx - traceLog - object => " +o);
		}
	}
	
	public static function dumpStack(obj:Object, methodName:String):Void {
		var er:Error = new Error((obj != null ? Type.getClassName(Type.getClass(obj)) : "[class Object]") + ", " + methodName); //creating but not throwing the error
		trace(er.getStackTrace()); // see where the issue is happening, but continue running normally!
	}
	
}