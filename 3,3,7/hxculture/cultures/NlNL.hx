package hxculture.cultures;

import hxculture.Culture;

class NlNL extends Culture {
	function new() {
		language = hxculture.languages.Nl.language;
		name = "nl-NL";
		english = "Dutch (Netherlands)";
		native = "Nederlands (Nederland)";
		date = new hxculture.core.DateTimeInfo(
			["januari", "februari", "maart", "april", "mei", "juni", "juli", "augustus", "september", "oktober", "november", "december", ""],
			["jan", "feb", "mrt", "apr", "mei", "jun", "jul", "aug", "sep", "okt", "nov", "dec", ""],
			["zondag", "maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag"],
			["zo", "ma", "di", "wo", "do", "vr", "za"],
			["zo", "ma", "di", "wo", "do", "vr", "za"],
			null,
			null,
			"-",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%A %e %B %Y",
			"%e-%f-%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A %e %B %Y %k:%M:%S",
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
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Netherlands";
		nativeRegion = "Nederland";
		iso2Region = "NL";
		iso3Region = "NLD";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new NlNL();
}