package hxculture.cultures;

import hxculture.Culture;

class SwKE extends Culture {
	function new() {
		language = hxculture.languages.Sw.language;
		name = "sw-KE";
		english = "Kiswahili (Kenya)";
		native = "Kiswahili (Kenya)";
		date = new hxculture.core.DateTimeInfo(
			["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""],
			["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""],
			["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
			["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
			["S", "M", "T", "W", "T", "F", "S"],
			"AM",
			"PM",
			"/",
			":",
			0,
			"%B, %Y",
			"%B %d",
			"%A, %B %d, %Y",
			"%f/%e/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %B %d, %Y %l:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%l:%M:%S %p",
			"%l:%M %p");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "($n)", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Kenyan Shilling";
		nativeCurrency = "Shilingi";
		currencySymbol = "S";
		currencyIso = "KES";
		englishRegion = "Kenya";
		nativeRegion = "Kenya";
		iso2Region = "KE";
		iso3Region = "KEN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new SwKE();
}