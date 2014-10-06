package com.google.maps.wrappers;
import haxe.ds.ObjectMap;

class WrappedListenerCache 
{
	public function new(arg1:Dynamic)
	{
		//super();
		callbackMap = new ObjectMap<Dynamic, Dynamic>();
		this.target = arg1;
		return;
	}

	public function removeListener(arg1:Dynamic, arg2:String, arg3:Dynamic, arg4:Bool=false):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = 0;
		if (loc1 = this.callbackMap.get(arg2))
		{
			loc2 = (loc1.length - 1);
			while (loc2 >= 0) 
			{
				if (arg3 == loc1[loc2].original && arg4 == loc1[loc2].useCapture)
				{
				arg1(arg2, loc1[loc2].wrapped, arg4);
				loc1.splice(loc2, 1);
				}
				loc2 = (loc2 - 1);
			}
		}
		return;
	}

	public function addListener(arg1:Dynamic, arg2:String, arg3:Dynamic, arg4:Bool=false, arg5:Int=0, arg6:Bool=false):Void
	{
		var loc1:Dynamic;
		loc1 = null;
		var loc2:Dynamic;
		loc2 = null;
		var loc3:Dynamic;
		loc3 = null;
		loc1 = com.google.maps.wrappers.Wrapper.instance().wrapEventHandler(arg3, target);
		loc2 = {"original":arg3, "wrapped":loc1, "useCapture":arg4};
		if ((loc3 = this.callbackMap[arg2]) == null)
		{
			this.callbackMap[arg2] = [loc2];
		}
		else 
		{
			loc3.push(loc2);
		}
		arg1(arg2, loc1, arg4, arg5, arg6);
		return;
	}

	private var target:Dynamic;

	private var callbackMap:ObjectMap<Dynamic, Dynamic>;
}