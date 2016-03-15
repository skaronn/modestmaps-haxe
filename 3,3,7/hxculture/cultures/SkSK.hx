package hxculture.cultures;

import hxculture.Culture;

class SkSK extends Culture {
	function new() {
		language = hxculture.languages.Sk.language;
		name = "sk-SK";
		english = "Slovak (Slovakia)";
		native = "slovenčina (Slovenská republika)";
		date = new hxculture.core.DateTimeInfo(
			["január", "február", "marec", "apríl", "máj", "jún", "júl", "august", "september", "október", "november", "december", ""],
			["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII", ""],
			["nedeľa", "pondelok", "utorok", "streda", "štvrtok", "piatok", "sobota"],
			["ne", "po", "ut", "st", "št", "pi", "so"],
			["ne", "po", "ut", "st", "št", "pi", "so"],
			null,
			null,
			". ",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%e. %B %Y",
			"%e. %f. %Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %B %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "Nie je číslo";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-nekonečno";
		symbolPosInf = "+nekonečno";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Slovak Koruna";
		nativeCurrency = "Slovenská koruna";
		currencySymbol = "Sk";
		currencyIso = "SKK";
		englishRegion = "Slovakia";
		nativeRegion = "Slovenská republika";
		iso2Region = "SK";
		iso3Region = "SVK";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new SkSK();
}