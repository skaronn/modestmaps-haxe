package hxculture.cultures;

import hxculture.Culture;

class ItIT extends Culture {
	function new() {
		language = hxculture.languages.It.language;
		name = "it-IT";
		english = "Italian (Italy)";
		native = "italiano (Italia)";
		date = new hxculture.core.DateTimeInfo(
			["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno", "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre", ""],
			["gen", "feb", "mar", "apr", "mag", "giu", "lug", "ago", "set", "ott", "nov", "dic", ""],
			["domenica", "lunedì", "martedì", "mercoledì", "giovedì", "venerdì", "sabato"],
			["dom", "lun", "mar", "mer", "gio", "ven", "sab"],
			["do", "lu", "ma", "me", "gi", "ve", "sa"],
			null,
			null,
			"/",
			".",
			1,
			"%B %Y",
			"%d %B",
			"%A %e %B %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A %e %B %Y %k.%M.%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k.%M.%S",
			"%k.%M");
		symbolNaN = "Non un numero reale";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinito";
		symbolPosInf = "+Infinito";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-$ n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Italy";
		nativeRegion = "Italia";
		iso2Region = "IT";
		iso3Region = "ITA";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ItIT();
}