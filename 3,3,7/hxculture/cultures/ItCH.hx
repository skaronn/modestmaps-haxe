package hxculture.cultures;

import hxculture.Culture;

class ItCH extends Culture {
	function new() {
		language = hxculture.languages.It.language;
		name = "it-CH";
		english = "Italian (Switzerland)";
		native = "italiano (Svizzera)";
		date = new hxculture.core.DateTimeInfo(
			["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre", ""],
			["gen", "feb", "mar", "apr", "mag", "gio", "lug", "ago", "set", "ott", "nov", "dic", ""],
			["domenica", "lunedì", "martedì", "mercoledì", "giovedì", "venerdì", "sabato"],
			["dom", "lun", "mar", "mer", "gio", "ven", "sab"],
			["do", "lu", "ma", "me", "gi", "ve", "sa"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e. %B",
			"%A, %e. %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e. %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "Non un numero reale";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinito";
		symbolPosInf = "+Infinito";
		number = new hxculture.core.NumberInfo(2, ".", [3], "'", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], "'", "$-n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], "'", "-n%", "n%");
		englishCurrency = "Swiss Franc";
		nativeCurrency = "Franco svizzero";
		currencySymbol = "SFr.";
		currencyIso = "CHF";
		englishRegion = "Switzerland";
		nativeRegion = "Svizzera";
		iso2Region = "CH";
		iso3Region = "CHE";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ItCH();
}