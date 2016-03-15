package hxculture.cultures;

import hxculture.Culture;

class ZhMO extends Culture {
	function new() {
		language = hxculture.languages.ZhHant.language;
		name = "zh-MO";
		english = "Chinese (Macao S.A.R.)";
		native = "中文(澳門特别行政區)";
		date = new hxculture.core.DateTimeInfo(
			["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
			["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
			["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
			["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
			["日", "一", "二", "三", "四", "五", "六"],
			null,
			null,
			"/",
			":",
			0,
			"%B, %Y",
			"%e %B",
			"%A, %e %B, %Y",
			"%e/%f/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e %B, %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "($n)", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n%", "n%");
		englishCurrency = "Macao Pataca";
		nativeCurrency = "Pataca";
		currencySymbol = "MOP";
		currencyIso = "MOP";
		englishRegion = "Macao S.A.R.";
		nativeRegion = "澳門特别行政區";
		iso2Region = "MO";
		iso3Region = "MAC";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ZhMO();
}