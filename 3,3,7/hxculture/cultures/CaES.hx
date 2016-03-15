package hxculture.cultures;

import hxculture.Culture;

class CaES extends Culture {
	function new() {
		language = hxculture.languages.Ca.language;
		name = "ca-ES";
		english = "Catalan (Catalan)";
		native = "català (català)";
		date = new hxculture.core.DateTimeInfo(
			["gener", "febrer", "març", "abril", "maig", "juny", "juliol", "agost", "setembre", "octubre", "novembre", "desembre", ""],
			["gen", "feb", "març", "abr", "maig", "juny", "jul", "ag", "set", "oct", "nov", "des", ""],
			["diumenge", "dilluns", "dimarts", "dimecres", "dijous", "divendres", "dissabte"],
			["dg.", "dl.", "dt.", "dc.", "dj.", "dv.", "ds."],
			["dg", "dl", "dt", "dc", "dj", "dv", "ds"],
			null,
			null,
			"/",
			":",
			1,
			"%B / %Y",
			"%d %B",
			"%A, %e / %B / %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e / %B / %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "NeuN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinit";
		symbolPosInf = "Infinit";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Spain";
		nativeRegion = "Espanya";
		iso2Region = "ES";
		iso3Region = "ESP";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new CaES();
}