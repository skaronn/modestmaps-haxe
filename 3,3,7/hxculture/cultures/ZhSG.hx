package hxculture.cultures;

import hxculture.Culture;

class ZhSG extends Culture {
	function new() {
		language = hxculture.languages.ZhHans.language;
		name = "zh-SG";
		english = "Chinese (Singapore)";
		native = "中文(新加坡)";
		date = new hxculture.core.DateTimeInfo(
			["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
			["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
			["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
			["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
			["日", "一", "二", "三", "四", "五", "六"],
			"AM",
			"PM",
			"/",
			":",
			0,
			"%B, %Y",
			"%e %B",
			"%A, %e %B, %Y",
			"%e/%f/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e %B, %Y %p %l:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%p %l:%M:%S",
			"%p %l:%M");
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
		englishCurrency = "Singapore Dollar";
		nativeCurrency = "新币";
		currencySymbol = "$";
		currencyIso = "SGD";
		englishRegion = "Singapore";
		nativeRegion = "新加坡";
		iso2Region = "SG";
		iso3Region = "SGP";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ZhSG();
}