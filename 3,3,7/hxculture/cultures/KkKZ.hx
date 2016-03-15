package hxculture.cultures;

import hxculture.Culture;

class KkKZ extends Culture {
	function new() {
		language = hxculture.languages.Kk.language;
		name = "kk-KZ";
		english = "Kazakh (Kazakhstan)";
		native = "Қазақ (Қазақстан)";
		date = new hxculture.core.DateTimeInfo(
			["қаңтар", "ақпан", "наурыз", "сәуір", "мамыр", "маусым", "шілде", "тамыз", "қыркүйек", "қазан", "қараша", "желтоқсан", ""],
			["Қаң", "Ақп", "Нау", "Сәу", "Мам", "Мау", "Шіл", "Там", "Қыр", "Қаз", "Қар", "Жел", ""],
			["Жексенбі", "Дүйсенбі", "Сейсенбі", "Сәрсенбі", "Бейсенбі", "Жұма", "Сенбі"],
			["Жк", "Дс", "Сс", "Ср", "Бс", "Жм", "Сн"],
			["Жк", "Дс", "Сс", "Ср", "Бс", "Жм", "Сн"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e %B",
			"%e %B %Y ж.",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y ж. %k:%M:%S",
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
		currency = new hxculture.core.NumberInfo(2, "-", [3], " ", "-$n", "$n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Tenge";
		nativeCurrency = "Т";
		currencySymbol = "Т";
		currencyIso = "KZT";
		englishRegion = "Kazakhstan";
		nativeRegion = "Қазақстан";
		iso2Region = "KZ";
		iso3Region = "KAZ";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new KkKZ();
}