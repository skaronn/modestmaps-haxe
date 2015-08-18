package hxculture.cultures;

import hxculture.Culture;

class FrCH extends Culture {
	function new() {
		language = hxculture.languages.Fr.language;
		name = "fr-CH";
		english = "French (Switzerland)";
		native = "français (Suisse)";
		date = new hxculture.core.DateTimeInfo(
			["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre", ""],
			["janv.", "févr.", "mars", "avr.", "mai", "juin", "juil.", "août", "sept.", "oct.", "nov.", "déc.", ""],
			["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
			["dim.", "lun.", "mar.", "mer.", "jeu.", "ven.", "sam."],
			["di", "lu", "ma", "me", "je", "ve", "sa"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e %B",
			"%A, %e. %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e. %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "Non Numérique";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infini";
		symbolPosInf = "+Infini";
		number = new hxculture.core.NumberInfo(2, ".", [3], "'", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], "'", "$-n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], "'", "-n %", "n %");
		englishCurrency = "Swiss Franc";
		nativeCurrency = "Franc suisse";
		currencySymbol = "SFr.";
		currencyIso = "CHF";
		englishRegion = "Switzerland";
		nativeRegion = "Suisse";
		iso2Region = "CH";
		iso3Region = "CHE";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new FrCH();
}