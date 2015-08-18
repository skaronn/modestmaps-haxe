package hxculture.cultures;

import hxculture.Culture;

class BeBY extends Culture {
	function new() {
		language = hxculture.languages.Be.language;
		name = "be-BY";
		english = "Belarusian (Belarus)";
		native = "Беларускі (Беларусь)";
		date = new hxculture.core.DateTimeInfo(
			["Студзень", "Люты", "Сакавік", "Красавік", "Май", "Чэрвень", "Ліпень", "Жнівень", "Верасень", "Кастрычнік", "Лістапад", "Снежань", ""],
			["Сту", "Лют", "Сак", "Кра", "Май", "Чэр", "Ліп", "Жні", "Вер", "Кас", "Ліс", "Сне", ""],
			["нядзеля", "панядзелак", "аўторак", "серада", "чацвер", "пятніца", "субота"],
			["нд", "пн", "аў", "ср", "чц", "пт", "сб"],
			["нд", "пн", "аў", "ср", "чц", "пт", "сб"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e %B",
			"%e %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y %k:%M:%S",
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
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n %", "n %");
		englishCurrency = "Belarusian Ruble";
		nativeCurrency = "рубль";
		currencySymbol = "р.";
		currencyIso = "BYB";
		englishRegion = "Belarus";
		nativeRegion = "Беларусь";
		iso2Region = "BY";
		iso3Region = "BLR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new BeBY();
}