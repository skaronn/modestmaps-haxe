package hxculture.cultures;

import hxculture.Culture;

class ZhHK extends Culture {
	function new() {
		language = hxculture.languages.ZhHant.language;
		name = "zh-HK";
		english = "Chinese (Hong Kong S.A.R.)";
		native = "中文(香港特别行政區)";
		date = new hxculture.core.DateTimeInfo(
			["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""],
			["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""],
			["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
			["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
			["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
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
		englishCurrency = "Hong Kong Dollar";
		nativeCurrency = "港幣";
		currencySymbol = "HK$";
		currencyIso = "HKD";
		englishRegion = "Hong Kong S.A.R.";
		nativeRegion = "香港特别行政區";
		iso2Region = "HK";
		iso3Region = "HKG";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ZhHK();
}