package hxculture.cultures;

import hxculture.Culture;

class KyKG extends Culture {
	function new() {
		language = hxculture.languages.Ky.language;
		name = "ky-KG";
		english = "Kyrgyz (Kyrgyzstan)";
		native = "Кыргыз (Кыргызстан)";
		date = new hxculture.core.DateTimeInfo(
			["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь", ""],
			["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек", ""],
			["Жекшемби", "Дүйшөмбү", "Шейшемби", "Шаршемби", "Бейшемби", "Жума", "Ишемби"],
			["Жш", "Дш", "Шш", "Шр", "Бш", "Жм", "Иш"],
			["Жш", "Дш", "Шш", "Шр", "Бш", "Жм", "Иш"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y-ж.",
			"%e %B",
			"%e-%B %Y-ж.",
			"%d.%m.%y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e-%B %Y-ж. %k:%M:%S",
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
		currency = new hxculture.core.NumberInfo(2, "-", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "som";
		nativeCurrency = "сом";
		currencySymbol = "сом";
		currencyIso = "KGS";
		englishRegion = "Kyrgyzstan";
		nativeRegion = "Кыргызстан";
		iso2Region = "KG";
		iso3Region = "KGZ";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new KyKG();
}