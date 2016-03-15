package hxculture.cultures;

import hxculture.Culture;

class MsMY extends Culture {
	function new() {
		language = hxculture.languages.Ms.language;
		name = "ms-MY";
		english = "Malay (Malaysia)";
		native = "Bahasa Malaysia (Malaysia)";
		date = new hxculture.core.DateTimeInfo(
			["Januari", "Februari", "Mac", "April", "Mei", "Jun", "Julai", "Ogos", "September", "Oktober", "November", "Disember", ""],
			["Jan", "Feb", "Mac", "Apr", "Mei", "Jun", "Jul", "Ogos", "Sept", "Okt", "Nov", "Dis", ""],
			["Ahad", "Isnin", "Selasa", "Rabu", "Khamis", "Jumaat", "Sabtu"],
			["Ahad", "Isnin", "Sel", "Rabu", "Khamis", "Jumaat", "Sabtu"],
			["A", "I", "S", "R", "K", "J", "S"],
			null,
			null,
			"/",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%d %B %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(0, ",", [3], ".", "($n)", "$n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Malaysian Ringgit";
		nativeCurrency = "Ringgit Malaysia";
		currencySymbol = "R";
		currencyIso = "MYR";
		englishRegion = "Malaysia";
		nativeRegion = "Malaysia";
		iso2Region = "MY";
		iso3Region = "MYS";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new MsMY();
}