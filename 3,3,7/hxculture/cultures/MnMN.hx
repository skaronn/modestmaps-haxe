package hxculture.cultures;

import hxculture.Culture;

class MnMN extends Culture {
	function new() {
		language = hxculture.languages.Mn.language;
		name = "mn-MN";
		english = "Mongolian (Cyrillic, Mongolia)";
		native = "Монгол хэл (Монгол улс)";
		date = new hxculture.core.DateTimeInfo(
			["1 дүгээр сар", "2 дугаар сар", "3 дугаар сар", "4 дүгээр сар", "5 дугаар сар", "6 дугаар сар", "7 дугаар сар", "8 дугаар сар", "9 дүгээр сар", "10 дугаар сар", "11 дүгээр сар", "12 дугаар сар", ""],
			["I", "II", "III", "IV", "V", "VI", "VII", "VШ", "IX", "X", "XI", "XII", ""],
			["Ням", "Даваа", "Мягмар", "Лхагва", "Пүрэв", "Баасан", "Бямба"],
			["Ня", "Да", "Мя", "Лх", "Пү", "Ба", "Бя"],
			["Ня", "Да", "Мя", "Лх", "Пү", "Ба", "Бя"],
			null,
			null,
			".",
			":",
			1,
			"%Y он %B",
			"%e %B",
			"%Y оны %B %e",
			"%y.%m.%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y оны %B %e %k:%M:%S",
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
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n$", "n$");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n %", "n %");
		englishCurrency = "Tugrik";
		nativeCurrency = "Төгрөг";
		currencySymbol = "₮";
		currencyIso = "MNT";
		englishRegion = "Mongolia";
		nativeRegion = "Монгол улс";
		iso2Region = "MN";
		iso3Region = "MNG";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new MnMN();
}