package hxculture.cultures;

import hxculture.Culture;

class LvLV extends Culture {
	function new() {
		language = hxculture.languages.Lv.language;
		name = "lv-LV";
		english = "Latvian (Latvia)";
		native = "latviešu (Latvija)";
		date = new hxculture.core.DateTimeInfo(
			["janvāris", "februāris", "marts", "aprīlis", "maijs", "jūnijs", "jūlijs", "augusts", "septembris", "oktobris", "novembris", "decembris", ""],
			["Jan", "Feb", "Mar", "Apr", "Mai", "Jūn", "Jūl", "Aug", "Sep", "Okt", "Nov", "Dec", ""],
			["svētdiena", "pirmdiena", "otrdiena", "trešdiena", "ceturtdiena", "piektdiena", "sestdiena"],
			["Sv", "Pr", "Ot", "Tr", "Ce", "Pk", "Se"],
			["Sv", "Pr", "Ot", "Tr", "Ce", "Pk", "Se"],
			null,
			null,
			".",
			":",
			1,
			"%Y. %B",
			"%e. %B",
			"%A, %Y. gada %e. %B",
			"%Y.%m.%d.",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %Y. gada %e. %B %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-bezgalība";
		symbolPosInf = "bezgalība";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-$ n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Latvian Lats";
		nativeCurrency = "Lats";
		currencySymbol = "Ls";
		currencyIso = "LVL";
		englishRegion = "Latvia";
		nativeRegion = "Latvija";
		iso2Region = "LV";
		iso3Region = "LVA";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new LvLV();
}