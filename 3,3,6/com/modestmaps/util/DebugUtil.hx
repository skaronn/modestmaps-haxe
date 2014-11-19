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
		//flash.Lib.trace("DebugField.hx - dump - instanceFields : "+Type.getInstanceFields(Type.getClass(tw)));
		//flash.Lib.trace("DebugField.hx - dump - classFields : "+Type.getClassFields(Type.getClass(tw)));
		//flash.Lib.trace("DebugField.hx - dump - fields : "+Reflect.fields(tw));
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
		if(Std.is(o, ObjectMap)){
			var object : ObjectMap<Object, Object> = o;
			flash.Lib.trace("\n");
			for (key in object.keys()) {
				var dictionaryValues : String = "";
				var dictionaryLength : UInt = 0;
				//trace (key + " ======> " + object.get(key));
				//trace (key.dumpFields() + " => " + object.get(key));
				var fields : ObjectMap<Object, Object> = object.get(key);
				for (value in fields.keys()) {
					trace(value);
					dictionaryValues += Type.typeof(value);
					//dictionaryValues += value.dumpFields();
					dictionaryLength++;
				}
				
				//trace("traceLog - " + key + " ======> " + object.get(key) + "{" + dictionaryValues + "}[" + dictionaryLength + "]");
				trace("traceLog - " + key + " ======> " + object.get(key) + "{" + dictionaryValues + "}[" + dictionaryLength + "]");
				//flash.Lib.trace("TweenLite.hx - traceLog - dictionary length : " +dictionaryLength);
				/*if(dictionaryValues != ""){
					trace(key.dumpFields() + " => " +"{" +  object.get(key) + ":" + dictionaryValues + "}");					
				}*/
				len++;
			}
			flash.Lib.trace("\n");
			flash.Lib.trace("TweenLite.hx - traceLog - nb elements : " +len);
		}
		else {
			flash.Lib.trace("TweenLite.hx - traceLog - object => " +o);
		}
	}
	
	public static function dumpStack(obj:Object, methodName:String):Void {
		var er:Error = new Error(Type.getClassName(Type.getClass(obj)) +", "+ methodName); //creating but not throwing the error
		flash.Lib.trace(er.getStackTrace()); // see where the issue is happening, but continue running normally!
	}
	
}