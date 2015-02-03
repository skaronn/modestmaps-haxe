package com.modestmaps.util;

import openfl.text.TextField;
import com.modestmaps.core.TileGrid;
import com.modestmaps.core.Tile;
import openfl.text.TextFormat;
import openfl.utils.Timer;
import openfl.display.Sprite;
import openfl.system.System;
import com.modestmaps.core.painter.TilePainter;
import com.modestmaps.core.painter.ITilePainter;	
import de.polygonal.core.fmt.NumberFormat;
import openfl.utils.Object;
import haxe.ds.ObjectMap;
import openfl.utils.*;
import openfl.errors.*;

class DebugUtil
{	
	public static function dumpObject(tw:Object):Void {
		var concatFieldsDump : String = Type.getClassName(Type.getClass(tw)) + " => ";
		var fields : Array<Object> = Type.getInstanceFields(Type.getClass(tw));
		for (key in fields) {
			var field : Object = fields[key];
			if(!Reflect.isFunction(field)) {
				concatFieldsDump += "[" + key +" : " + Reflect.getProperty(tw, key) + "]";
			}
		}
		flash.Lib.trace(concatFieldsDump);
	}
	
	private static function traceLog(o:Object):Void {		
		var len:UInt = 0;
		if (Std.is(o, ObjectMap)) {
			var object : ObjectMap<Object, Object> = o;
			trace("\n");
			for (key in object.keys()) {
				var dictionaryValues : String = "";
				var dictionaryLength : UInt = 0;
				var fields : ObjectMap<Object, Object> = object.get(key);
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
		var er:Error = new Error((obj != null ? Type.getClassName(Type.getClass(obj)) : "[class Object]")+", "+ methodName); //creating but not throwing the error
		trace(er.getStackTrace()); // see where the issue is happening, but continue running normally!
	}
	
}