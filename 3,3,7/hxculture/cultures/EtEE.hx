package hxculture.cultures;

import hxculture.Culture;

class EtEE extends Culture {
	function new() {
		language = hxculture.languages.Et.language;
		name = "et-EE";
		english = "Estonian (Estonia)";
		native = "eesti (Eesti)";
		date = new hxculture.core.DateTimeInfo(
			["jaanuar", "veebruar", "märts", "aprill", "mai", "juuni", "juuli", "august", "september", "oktoober", "november", "detsember", ""],
			["jaan", "veebr", "märts", "apr", "mai", "juuni", "juuli", "aug", "sept", "okt", "nov", "dets", ""],
			["pühapäev", "esmaspäev", "teisipäev", "kolmapäev", "neljapäev", "reede", "laupäev"],
			["P", "E", "T", "K", "N", "R", "L"],
			["P", "E", "T", "K", "N", "R", "L"],
			"EL",
			"PL",
			".",
			":",
			1,
			"%B %Y. a.",
			"%e. %B",
			"%e. %B %Y. a.",
			"%e.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %B %Y. a. %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "avaldamatu";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "miinuslõpmatus";
		symbolPosInf = "plusslõpmatus";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Estonian Kroon";
		nativeCurrency = "Kroon";
		currencySymbol = "kr";
		currencyIso = "EEK";
		englishRegion = "Estonia";
		nativeRegion = "Eesti";
		iso2Region = "EE";
		iso3Region = "EST";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EtEE();
}