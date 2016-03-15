package hxculture.cultures;

import hxculture.Culture;

class EnJM extends Culture {
	function new() {
		language = hxculture.languages.En.language;
		name = "en-JM";
		english = "English (Jamaica)";
		native = "English (Jamaica)";
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
			"%A, %B %d, %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %B %d, %Y %I:%M:%S %p",
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
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "-$n", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Jamaican Dollar";
		nativeCurrency = "Jamaican Dollar";
		currencySymbol = "J$";
		currencyIso = "JMD";
		englishRegion = "Jamaica";
		nativeRegion = "Jamaica";
		iso2Region = "JM";
		iso3Region = "JAM";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EnJM();
}