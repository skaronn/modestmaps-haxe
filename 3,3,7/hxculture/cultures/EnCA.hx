package hxculture.cultures;

import hxculture.Culture;

class EnCA extends Culture {
	function new() {
		language = hxculture.languages.En.language;
		name = "en-CA";
		english = "English (Canada)";
		native = "English (Canada)";
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
			"%B, %Y",
			"%B %d",
			"%B %e, %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%B %e, %Y %l:%M:%S %p",
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
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "-$n", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Canadian Dollar";
		nativeCurrency = "Canadian Dollar";
		currencySymbol = "$";
		currencyIso = "CAD";
		englishRegion = "Canada";
		nativeRegion = "Canada";
		iso2Region = "CA";
		iso3Region = "CAN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EnCA();
}