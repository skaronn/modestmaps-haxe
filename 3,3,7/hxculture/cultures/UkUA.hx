package hxculture.cultures;

import hxculture.Culture;

class UkUA extends Culture {
	function new() {
		language = hxculture.languages.Uk.language;
		name = "uk-UA";
		english = "Ukrainian (Ukraine)";
		native = "україньска (Україна)";
		date = new hxculture.core.DateTimeInfo(
			["Січень", "Лютий", "Березень", "Квітень", "Травень", "Червень", "Липень", "Серпень", "Вересень", "Жовтень", "Листопад", "Грудень", ""],
			["Січ", "Лют", "Бер", "Кві", "Тра", "Чер", "Лип", "Сер", "Вер", "Жов", "Лис", "Гру", ""],
			["неділя", "понеділок", "вівторок", "середа", "четвер", "п'ятниця", "субота"],
			["Нд", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
			["Нд", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y р.",
			"%e %B",
			"%e %B %Y р.",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y р. %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-безмежність";
		symbolPosInf = "безмежність";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Ukrainian Grivna";
		nativeCurrency = "гривня";
		currencySymbol = "грн.";
		currencyIso = "UAH";
		englishRegion = "Ukraine";
		nativeRegion = "Україна";
		iso2Region = "UA";
		iso3Region = "UKR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new UkUA();
}