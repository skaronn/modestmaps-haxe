package hxculture.cultures;

import hxculture.Culture;

class RoRO extends Culture {
	function new() {
		language = hxculture.languages.Ro.language;
		name = "ro-RO";
		english = "Romanian (Romania)";
		native = "română (România)";
		date = new hxculture.core.DateTimeInfo(
			["ianuarie", "februarie", "martie", "aprilie", "mai", "iunie", "iulie", "august", "septembrie", "octombrie", "noiembrie", "decembrie", ""],
			["ian.", "feb.", "mar.", "apr.", "mai.", "iun.", "iul.", "aug.", "sep.", "oct.", "nov.", "dec.", ""],
			["duminică", "luni", "marţi", "miercuri", "joi", "vineri", "sâmbătă"],
			["D", "L", "Ma", "Mi", "J", "V", "S"],
			["D", "L", "Ma", "Mi", "J", "V", "S"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e %B",
			"%e %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Romanian Leu";
		nativeCurrency = "Leu";
		currencySymbol = "lei";
		currencyIso = "ROL";
		englishRegion = "Romania";
		nativeRegion = "România";
		iso2Region = "RO";
		iso3Region = "ROU";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new RoRO();
}