package hxculture.cultures;

import hxculture.Culture;

class SlSI extends Culture {
	function new() {
		language = hxculture.languages.Sl.language;
		name = "sl-SI";
		english = "Slovenian (Slovenia)";
		native = "slovenski (Slovenija)";
		date = new hxculture.core.DateTimeInfo(
			["januar", "februar", "marec", "april", "maj", "junij", "julij", "avgust", "september", "oktober", "november", "december", ""],
			["jan", "feb", "mar", "apr", "maj", "jun", "jul", "avg", "sep", "okt", "nov", "dec", ""],
			["nedelja", "ponedeljek", "torek", "sreda", "četrtek", "petek", "sobota"],
			["ned", "pon", "tor", "sre", "čet", "pet", "sob"],
			["ne", "po", "to", "sr", "če", "pe", "so"],
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
		symbolNegInf = "-neskončnost";
		symbolPosInf = "neskončnost";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Slovenian Tolar";
		nativeCurrency = "slovenski tolar";
		currencySymbol = "SIT";
		currencyIso = "SIT";
		englishRegion = "Slovenia";
		nativeRegion = "Slovenija";
		iso2Region = "SI";
		iso3Region = "SVN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new SlSI();
}