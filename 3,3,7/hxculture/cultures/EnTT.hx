package hxculture.cultures;

import hxculture.Culture;

class EnTT extends Culture {
	function new() {
		language = hxculture.languages.En.language;
		name = "en-TT";
		english = "English (Trinidad and Tobago)";
		native = "English (Trinidad y Tobago)";
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
			"%A, %d %B %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %d %B %Y %I:%M:%S %p",
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
		currency = new hxculture.core.NumberInfo(2, ".", [3, 0], ",", "($n)", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Trinidad Dollar";
		nativeCurrency = "Trinidad Dollar";
		currencySymbol = "TT$";
		currencyIso = "TTD";
		englishRegion = "Trinidad and Tobago";
		nativeRegion = "Trinidad y Tobago";
		iso2Region = "TT";
		iso3Region = "TTO";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EnTT();
}