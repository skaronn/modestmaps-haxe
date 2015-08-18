package hxculture.cultures;

import hxculture.Culture;

class AfZA extends Culture {
	function new() {
		language = hxculture.languages.Af.language;
		name = "af-ZA";
		english = "Afrikaans (South Africa)";
		native = "Afrikaans (Suid Afrika)";
		date = new hxculture.core.DateTimeInfo(
			["Januarie", "Februarie", "Maart", "April", "Mei", "Junie", "Julie", "Augustus", "September", "Oktober", "November", "Desember", ""],
			["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Des", ""],
			["Sondag", "Maandag", "Dinsdag", "Woensdag", "Donderdag", "Vrydag", "Saterdag"],
			["Son", "Maan", "Dins", "Woen", "Dond", "Vry", "Sat"],
			["So", "Ma", "Di", "Wo", "Do", "Vr", "Sa"],
			null,
			"nm",
			"/",
			":",
			0,
			"%B %Y",
			"%d %B",
			"%d %B %Y",
			"%Y/%m/%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %I:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%I:%M:%S %p",
			"%I:%M %p");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$-n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n%", "n%");
		englishCurrency = "South African Rand";
		nativeCurrency = "Rand";
		currencySymbol = "R";
		currencyIso = "ZAR";
		englishRegion = "South Africa";
		nativeRegion = "Suid Afrika";
		iso2Region = "ZA";
		iso3Region = "ZAF";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new AfZA();
}