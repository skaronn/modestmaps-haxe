package hxculture.cultures;

import hxculture.Culture;

class TtRU extends Culture {
	function new() {
		language = hxculture.languages.Tt.language;
		name = "tt-RU";
		english = "Tatar (Russia)";
		native = "Татар (Россия)";
		date = new hxculture.core.DateTimeInfo(
			["Гыйнварь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь", ""],
			["Гыйнв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек", ""],
			["Якшәмбе", "Дүшәмбе", "Сишәмбе", "Чәршәмбе", "Пәнҗешәмбе", "Җомга", "Шимбә"],
			["Якш", "Дүш", "Сиш", "Чәрш", "Пәнҗ", "Җом", "Шим"],
			["Якш", "Дүш", "Сиш", "Чәрш", "Пәнҗ", "Җом", "Шим"],
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
	public static var culture : Culture = new TtRU();
}