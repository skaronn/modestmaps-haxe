package hxculture.cultures;

import hxculture.Culture;

class BgBG extends Culture {
	function new() {
		language = hxculture.languages.Bg.language;
		name = "bg-BG";
		english = "Bulgarian (Bulgaria)";
		native = "български (България)";
		date = new hxculture.core.DateTimeInfo(
			["Януари", "Февруари", "Март", "Април", "Май", "Юни", "Юли", "Август", "Септември", "Октомври", "Ноември", "Декември", ""],
			["Януари", "Февруари", "Март", "Април", "Май", "Юни", "Юли", "Август", "Септември", "Октомври", "Ноември", "Декември", ""],
			["неделя", "понеделник", "вторник", "сряда", "четвъртък", "петък", "събота"],
			["Нд", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
			["не", "по", "вт", "ср", "че", "пе", "съ"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y г.",
			"%d %B",
			"%d %B %Y г.",
			"%d.%f.%Y г.",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y г. %H:%M:%S",
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
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n %", "n %");
		englishCurrency = "Bulgarian Lev";
		nativeCurrency = "лв.";
		currencySymbol = "лв";
		currencyIso = "BGL";
		englishRegion = "Bulgaria";
		nativeRegion = "България";
		iso2Region = "BG";
		iso3Region = "BGR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new BgBG();
}