package hxculture.cultures;

import hxculture.Culture;

class MsBN extends Culture {
	function new() {
		language = hxculture.languages.Ms.language;
		name = "ms-BN";
		english = "Malay (Brunei Darussalam)";
		native = "Bahasa Malaysia (Brunei Darussalam)";
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
		englishCurrency = "Brunei Dollar";
		nativeCurrency = "Ringgit Brunei";
		currencySymbol = "$";
		currencyIso = "BND";
		englishRegion = "Brunei Darussalam";
		nativeRegion = "Brunei Darussalam";
		iso2Region = "BN";
		iso3Region = "BRN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new MsBN();
}