package hxculture.cultures;

import hxculture.Culture;

class UzCyrlUZ extends Culture {
	function new() {
		language = hxculture.languages.Uz.language;
		name = "uz-Cyrl-UZ";
		english = "Uzbek (Cyrillic, Uzbekistan)";
		native = "Ўзбек (Ўзбекистон)";
		date = new hxculture.core.DateTimeInfo(
			["Январ", "Феврал", "Март", "Апрел", "Май", "Июн", "Июл", "Август", "Сентябр", "Октябр", "Ноябр", "Декабр", ""],
			["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек", ""],
			["якшанба", "душанба", "сешанба", "чоршанба", "пайшанба", "жума", "шанба"],
			["якш", "дш", "сш", "чш", "пш", "ж", "ш"],
			["якш", "дш", "сш", "чш", "пш", "ж", "ш"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e-%B",
			"%Y йил %e-%B",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y йил %e-%B %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Uzbekistan Sum";
		nativeCurrency = "рубль";
		currencySymbol = "сўм";
		currencyIso = "UZS";
		englishRegion = "Uzbekistan";
		nativeRegion = "Ўзбекистон Республикаси";
		iso2Region = "UZ";
		iso3Region = "UZB";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new UzCyrlUZ();
}