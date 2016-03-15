package hxculture.cultures;

import hxculture.Culture;

class GlES extends Culture {
	function new() {
		language = hxculture.languages.Gl.language;
		name = "gl-ES";
		english = "Galician (Galician)";
		native = "galego (galego)";
		date = new hxculture.core.DateTimeInfo(
			["xaneiro", "febreiro", "marzo", "abril", "maio", "xuño", "xullo", "agosto", "setembro", "outubro", "novembro", "decembro", ""],
			["xan", "feb", "mar", "abr", "maio", "xuñ", "xull", "ago", "set", "out", "nov", "dec", ""],
			["domingo", "luns", "martes", "mércores", "xoves", "venres", "sábado"],
			["dom", "luns", "mar", "mér", "xov", "ven", "sab"],
			["do", "lu", "ma", "mé", "xo", "ve", "sa"],
			"a.m.",
			"p.m.",
			"/",
			":",
			1,
			"%B de %Y",
			"%d %B",
			"%A, %d de %B de %Y",
			"%d/%m/%y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %d de %B de %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NeuN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinito";
		symbolPosInf = "Infinito";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Spain";
		nativeRegion = "España";
		iso2Region = "ES";
		iso3Region = "ESP";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new GlES();
}