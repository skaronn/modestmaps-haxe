package hxculture.cultures;

import hxculture.Culture;

class SrLatnCS extends Culture {
	function new() {
		language = hxculture.languages.Sr.language;
		name = "sr-Latn-CS";
		english = "Serbian (Latin, Serbia)";
		native = "srpski (Srbija)";
		date = new hxculture.core.DateTimeInfo(
			["januar", "februar", "mart", "april", "maj", "jun", "jul", "avgust", "septembar", "oktobar", "novembar", "decembar", ""],
			["jan", "feb", "mar", "apr", "maj", "jun", "jul", "avg", "sep", "okt", "nov", "dec", ""],
			["nedelja", "ponedeljak", "utorak", "sreda", "četvrtak", "petak", "subota"],
			["ned", "pon", "uto", "sre", "čet", "pet", "sub"],
			["ne", "po", "ut", "sr", "če", "pe", "su"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e. %B",
			"%e. %B %Y",
			"%e.%f.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %B %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-beskonačnost";
		symbolPosInf = "+beskonačnost";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Serbian Dinar";
		nativeCurrency = "dinar";
		currencySymbol = "Din.";
		currencyIso = "CSD";
		englishRegion = "Serbia";
		nativeRegion = "Srbija";
		iso2Region = "CS";
		iso3Region = "SCG";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new SrLatnCS();
}