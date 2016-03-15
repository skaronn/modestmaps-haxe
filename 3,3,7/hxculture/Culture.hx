package hxculture;

import hxculture.core.DateTimeInfo;
import hxculture.core.NumberInfo;

class Culture {
	public var language(default, null) : Language;

	public var name(default, null) : String;
	public var native(default, null) : String;
	public var english(default, null) : String;
	public var date(default, null) : DateTimeInfo;

	public var englishCurrency(default, null) : String;
	public var nativeCurrency(default, null) : String;
	public var currencySymbol(default, null) : String;
	public var currencyIso(default, null) : String;
	public var iso2Region(default, null) : String;
	public var iso3Region(default, null) : String;
	public var englishRegion(default, null) : String;
	public var nativeRegion(default, null) : String;
	public var isMetric(default, null) : Bool;

	public var digits(default, null) : Null<Array<String>>;

	public var signNeg(default, null) : String;
	public var signPos(default, null) : String;

	public var symbolNaN(default, null) : String;
	public var symbolPercent(default, null) : String;
	public var symbolPermille(default, null) : String;
	public var symbolNegInf(default, null) : String;
	public var symbolPosInf(default, null) : String;

	public var number(default, null) : NumberInfo;
	public var currency(default, null) : NumberInfo;
	public var percent(default, null) : NumberInfo;

	static var cults = new Map<String, Culture>();
	public static function get(name : String) : Culture {
		return cults.get(name);
	}

	public static function names() {
		return cults.keys();
	}

	public static function add(culture : Culture) {
		if(!cults.exists(culture.name))
			cults.set(culture.name, culture);
	}
}