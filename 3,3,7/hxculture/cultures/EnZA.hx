package hxculture.cultures;

import hxculture.Culture;

class EnZA extends Culture {
	function new() {
		language = hxculture.languages.En.language;
		name = "en-ZA";
		english = "English (South Africa)";
		native = "English (South Africa)";
		date = new hxculture.core.DateTimeInfo(
			["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""],
			["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ""],
			["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
			["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
			["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
			"AM",
			"PM",
			"/",
			":",
			0,
			"%B %Y",
			"%d %B",
			"%d %B %Y",
			"%Y/%m/%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %I:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%I:%M:%S %p",
			"%I:%M %p");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$-n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n%", "n%");
		englishCurrency = "South African Rand";
		nativeCurrency = "Rand";
		currencySymbol = "R";
		currencyIso = "ZAR";
		englishRegion = "South Africa";
		nativeRegion = "South Africa";
		iso2Region = "ZA";
		iso3Region = "ZAF";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EnZA();
}