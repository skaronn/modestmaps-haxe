package hxculture.cultures;

import hxculture.Culture;

class RuRU extends Culture {
	function new() {
		language = hxculture.languages.Ru.language;
		name = "ru-RU";
		english = "Russian (Russia)";
		native = "русский (Россия)";
		date = new hxculture.core.DateTimeInfo(
			["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь", ""],
			["янв", "фев", "мар", "апр", "май", "июн", "июл", "авг", "сен", "окт", "ноя", "дек", ""],
			["воскресенье", "понедельник", "вторник", "среда", "четверг", "пятница", "суббота"],
			["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
			["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y г.",
			"%B %d",
			"%e %B %Y г.",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y г. %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-бесконечность";
		symbolPosInf = "бесконечность";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n$", "n$");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Russian Ruble";
		nativeCurrency = "рубль";
		currencySymbol = "р.";
		currencyIso = "RUR";
		englishRegion = "Russia";
		nativeRegion = "Россия";
		iso2Region = "RU";
		iso3Region = "RUS";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new RuRU();
}