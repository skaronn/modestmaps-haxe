package hxculture.cultures;

import hxculture.Culture;

class EuES extends Culture {
	function new() {
		language = hxculture.languages.Eu.language;
		name = "eu-ES";
		english = "Basque (Basque)";
		native = "euskara (euskara)";
		date = new hxculture.core.DateTimeInfo(
			["urtarrila", "otsaila", "martxoa", "apirila", "maiatza", "ekaina", "uztaila", "abuztua", "iraila", "urria", "azaroa", "abendua", ""],
			["urt.", "ots.", "mar.", "api.", "mai.", "eka.", "uzt.", "abu.", "ira.", "urr.", "aza.", "abe.", ""],
			["igandea", "astelehena", "asteartea", "asteazkena", "osteguna", "ostirala", "larunbata"],
			["ig.", "al.", "as.", "az.", "og.", "or.", "lr."],
			["ig", "al", "as", "az", "og", "or", "lr"],
			null,
			null,
			"/",
			":",
			1,
			"%Y.eko %B",
			"%B %d",
			"%A, %Y.eko %Bk %e",
			"%Y/%m/%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %Y.eko %Bk %e %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "EdZ";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinitu";
		symbolPosInf = "Infinitu";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Spain";
		nativeRegion = "Espainia";
		iso2Region = "ES";
		iso3Region = "ESP";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EuES();
}