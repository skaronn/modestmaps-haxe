package hxculture.cultures;

import hxculture.Culture;

class MkMK extends Culture {
	function new() {
		language = hxculture.languages.Mk.language;
		name = "mk-MK";
		english = "Macedonian (Former Yugoslav Republic of Macedonia)";
		native = "македонски јазик (Македонија)";
		date = new hxculture.core.DateTimeInfo(
			["јануари", "февруари", "март", "април", "мај", "јуни", "јули", "август", "септември", "октомври", "ноември", "декември", ""],
			["јан", "фев", "мар", "апр", "мај", "јун", "јул", "авг", "сеп", "окт", "ное", "дек", ""],
			["недела", "понеделник", "вторник", "среда", "четврток", "петок", "сабота"],
			["нед", "пон", "втр", "срд", "чет", "пет", "саб"],
			["не", "по", "вт", "ср", "че", "пе", "са"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%A, %d %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %d %B %Y %H:%M:%S",
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
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Macedonian Denar";
		nativeCurrency = "денар";
		currencySymbol = "ден.";
		currencyIso = "MKD";
		englishRegion = "Macedonia (FYROM)";
		nativeRegion = "Македонија";
		iso2Region = "MK";
		iso3Region = "MKD";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new MkMK();
}