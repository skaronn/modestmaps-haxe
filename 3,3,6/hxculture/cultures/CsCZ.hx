package hxculture.cultures;

import hxculture.Culture;

class CsCZ extends Culture {
	function new() {
		language = hxculture.languages.Cs.language;
		name = "cs-CZ";
		english = "Czech (Czech Republic)";
		native = "čeština (Česká republika)";
		date = new hxculture.core.DateTimeInfo(
			["leden", "únor", "březen", "duben", "květen", "červen", "červenec", "srpen", "září", "říjen", "listopad", "prosinec", ""],
			["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", ""],
			["neděle", "pondělí", "úterý", "středa", "čtvrtek", "pátek", "sobota"],
			["ne", "po", "út", "st", "čt", "pá", "so"],
			["ne", "po", "út", "st", "čt", "pá", "so"],
			"dop.",
			"odp.",
			".",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%e. %B %Y",
			"%e.%f.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %B %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "Není číslo";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-nekonečno";
		symbolPosInf = "+nekonečno";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Czech Koruna";
		nativeCurrency = "Koruna Česká";
		currencySymbol = "Kč";
		currencyIso = "CZK";
		englishRegion = "Czech Republic";
		nativeRegion = "Česká republika";
		iso2Region = "CZ";
		iso3Region = "CZE";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new CsCZ();
}