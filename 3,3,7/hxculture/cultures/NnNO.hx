package hxculture.cultures;

import hxculture.Culture;

class NnNO extends Culture {
	function new() {
		language = hxculture.languages.No.language;
		name = "nn-NO";
		english = "Norwegian, Nynorsk (Norway)";
		native = "norsk, nynorsk (Noreg)";
		date = new hxculture.core.DateTimeInfo(
			["januar", "februar", "mars", "april", "mai", "juni", "juli", "august", "september", "oktober", "november", "desember", ""],
			["jan", "feb", "mar", "apr", "mai", "jun", "jul", "aug", "sep", "okt", "nov", "des", ""],
			["søndag", "måndag", "tysdag", "onsdag", "torsdag", "fredag", "laurdag"],
			["sø", "må", "ty", "on", "to", "fr", "la"],
			["sø", "må", "ty", "on", "to", "fr", "la"],
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
		nativeRegion = "Noreg";
		iso2Region = "NO";
		iso3Region = "NOR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new NnNO();
}