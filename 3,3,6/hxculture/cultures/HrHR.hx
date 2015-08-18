package hxculture.cultures;

import hxculture.Culture;

class HrHR extends Culture {
	function new() {
		language = hxculture.languages.Hr.language;
		name = "hr-HR";
		english = "Croatian (Croatia)";
		native = "hrvatski (Hrvatska)";
		date = new hxculture.core.DateTimeInfo(
			["siječanj", "veljača", "ožujak", "travanj", "svibanj", "lipanj", "srpanj", "kolovoz", "rujan", "listopad", "studeni", "prosinac", ""],
			["sij", "vlj", "ožu", "tra", "svi", "lip", "srp", "kol", "ruj", "lis", "stu", "pro", ""],
			["nedjelja", "ponedjeljak", "utorak", "srijeda", "četvrtak", "petak", "subota"],
			["ned", "pon", "uto", "sri", "čet", "pet", "sub"],
			["ne", "po", "ut", "sr", "če", "pe", "su"],
			null,
			null,
			".",
			":",
			1,
			"%B, %Y",
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
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "- n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Croatian Kuna";
		nativeCurrency = "hrvatska kuna";
		currencySymbol = "kn";
		currencyIso = "HRK";
		englishRegion = "Croatia";
		nativeRegion = "Hrvatska";
		iso2Region = "HR";
		iso3Region = "HRV";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new HrHR();
}