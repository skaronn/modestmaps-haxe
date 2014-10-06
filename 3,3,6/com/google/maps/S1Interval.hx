package com.google.maps;

class S1Interval 
{
	public function new(arg1:Float, arg2:Float)
	{
		super();
		if (arg1 == -Math.PI && !(arg2 == Math.PI))
		{
			lo = Math.PI;
		}
		if (arg2 == -Math.PI && !(arg1 == Math.PI))
		{
			hi = Math.PI;
		}
		lo = arg1;
		hi = arg2;
		return;
	}

	public function containsInterval(arg1:com.google.maps.S1Interval):Bool
	{
		if (isInverted())
		{
			if (arg1.isInverted())
			{
				return arg1.lo >= lo && arg1.hi <= hi;
			}
			return (arg1.lo >= lo || arg1.hi <= hi) && !isEmpty();
		}
		if (arg1.isInverted())
		{
			return isFull() || arg1.isEmpty();
		}
		return arg1.lo >= lo && arg1.hi <= hi;
	}

	public function isEmpty():Bool
	{
		return lo - hi == 2 * Math.PI;
	}

	public function contains(arg1:Float):Bool
	{
		if (arg1 == -Math.PI)
		{
			arg1 = Math.PI;
		}
		if (isInverted())
		{
			return (arg1 >= lo || arg1 <= hi) && !isEmpty();
		}
		return arg1 >= lo && arg1 <= hi;
	}

	public function span():Float
	{
		if (isEmpty())
		{
			return 0;
		}
		if (isInverted())
		{
			return 2 * Math.PI - (lo - hi);
		}
		return hi - lo;
	}

	public function intersects(arg1:com.google.maps.S1Interval):Bool
	{
		if (isEmpty() || arg1.isEmpty())
		{
			return false;
		}
		if (isInverted())
		{
			return arg1.isInverted() || arg1.lo <= hi || arg1.hi >= lo;
		}
		if (arg1.isInverted())
		{
			return arg1.lo <= hi || arg1.hi >= lo;
		}
		return arg1.lo <= hi && arg1.hi >= lo;
	}

	public function center():Float
	{
		var loc1:Dynamic;
		loc1 = NaN;
		loc1 = (lo + hi) / 2;
		if (isInverted())
		{
			loc1 = loc1 + Math.PI;
			loc1 = com.google.maps.MapUtil.wrap(loc1, -Math.PI, Math.PI);
		}
		return loc1;
	}

	public function equals(arg1:com.google.maps.S1Interval):Bool
	{
		if (isEmpty())
		{
			return arg1.isEmpty();
		}
		return Math.abs(arg1.lo - lo) % 2 * Math.PI + Math.abs(arg1.hi - hi) % 2 * Math.PI <= com.google.maps.MapUtil.FLOAT_ERROR_MARGIN;
	}

	public function isFull():Bool
	{
		return hi - lo == 2 * Math.PI;
	}

	public function extend(arg1:Float):Void
	{
		if (contains(arg1))
		{
			return;
		}
		if (isEmpty())
		{
			hi = arg1;
			lo = arg1;
		}
		else {
			if (distance(arg1, lo) < distance(hi, arg1)){
				lo = arg1;
			}
			else 
			{
				hi = arg1;
			}
		}
		return;
	}

	public function isInverted():Bool
	{
		return lo > hi;
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.S1Interval
	{
		return new S1Interval(arg1.lo, arg1.hi);
	}

	public static function distance(arg1:Float, arg2:Float):Float
	{
		var loc1:Dynamic;
		loc1 = NaN;
		loc1 = arg2 - arg1;
		if (loc1 >= 0)
		{
		return loc1;
		}
		return arg2 + Math.PI - (arg1 - Math.PI);
	}

	public var hi:Float;

	public var lo:Float;
}