package com.google.maps;

class R1Interval 
{
	public function new(arg1:Float, arg2:Float)
	{
		super();
		lo = arg1;
		hi = arg2;
		return;
	}

	public function containsInterval(arg1:com.google.maps.R1Interval):Bool
	{
		if (arg1.isEmpty())
		{
		return true;
		}
		return arg1.lo >= lo && arg1.hi <= hi;
	}

	public function isEmpty():Bool
	{
		return lo > hi;
	}

	public function equals(arg1:com.google.maps.R1Interval):Bool
	{
		if (isEmpty())
		{
		return isEmpty();
		}
		return Math.abs(arg1.lo - lo) + Math.abs(hi - arg1.hi) <= com.google.maps.MapUtil.FLOAT_ERROR_MARGIN;
	}

	public function span():Float
	{
		return isEmpty() ? 0 : hi - lo;
	}

	public function intersects(arg1:com.google.maps.R1Interval):Bool
	{
		if (lo <= arg1.lo)
		{
		return arg1.lo <= hi && arg1.lo <= arg1.hi;
		}
		return lo <= arg1.hi && lo <= hi;
	}

	public function center():Float
	{
		return (hi + lo) / 2;
	}

	public function extend(arg1:Float):Void
	{
		if (isEmpty())
		{
		lo = arg1;
		hi = arg1;
		}
		else 
		{
		if (arg1 < lo)
		{
			lo = arg1;
		}
		else 
		{
			if (arg1 > hi)
			{
			hi = arg1;
			}
		}
		}
		return;
	}

	public function contains(arg1:Float):Bool
	{
		return arg1 >= lo && arg1 <= hi;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.R1Interval
	{
		return new R1Interval(arg1.lo, arg1.hi);
	}

	public var hi:Float;

	public var lo:Float;
}