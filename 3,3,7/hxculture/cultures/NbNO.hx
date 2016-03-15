package hxculture.cultures;

import hxculture.Culture;

class NbNO extends Culture {
	function new() {
		language = hxculture.languages.No.language;
		name = "nb-NO";
		english = "Norwegian, Bokmål (Norway)";
		native = "norsk, bokmål (Norge)";
		date = new hxculture.core.DateTimeInfo(
			["januar", "februar", "mars", "april", "mai", "juni", "juli", "august", "september", "oktober", "november", "desember", ""],
			["jan", "feb", "mar", "apr", "mai", "jun", "jul", "aug", "sep", "okt", "nov", "des", ""],
			["søndag", "mandag", "tirsdag", "onsdag", "torsdag", "fredag", "lørdag"],
			["sø", "ma", "ti", "on", "to", "fr", "lø"],
			["sø", "ma", "ti", "on", "to", "fr", "lø"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e. %B",
			"%e. %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-INF";
		symbolPosInf = "INF";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n %", "n %");
		englishCurrency = "Norwegian Krone";
		nativeCurrency = "Norsk krone";
		currencySymbol = "kr";
		currencyIso = "NOK";
		englishRegion = "Norway";
		nativeRegion = "Norge";
		iso2Region = "NO";
		iso3Region = "NOR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new NbNO();
}