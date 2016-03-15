package hxculture.cultures;

import hxculture.Culture;

class UrPK extends Culture {
	function new() {
		language = hxculture.languages.Ur.language;
		name = "ur-PK";
		english = "Urdu (Islamic Republic of Pakistan)";
		native = "اُردو (پاکستان)";
		date = new hxculture.core.DateTimeInfo(
			["جنورى", "فرورى", "مارچ", "اپريل", "مئ", "جون", "جولاٸ", "اگست", "ستمبر", "اکتوبر", "نومبر", "دسمبر", ""],
			["جنورى", "فرورى", "مارچ", "اپريل", "مئ", "جون", "جولاٸ", "اگست", "ستمبر", "اکتوبر", "نومبر", "دسمبر", ""],
			["اتوار", "پير", "منگل", "بدھ", "جمعرات", "جمعه", "هفته"],
			["اتوار", "پير", "منگل", "بدھ", "جمعرات", "جمعه", "هفته"],
			["ا", "پ", "م", "ب", "ج", "ج", "ه"],
			"AM",
			"PM",
			"/",
			":",
			1,
			"%B, %Y",
			"%d %B",
			"%d %B, %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B, %Y %l:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%l:%M:%S %p",
			"%l:%M %p");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		digits = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$n-", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Pakistan Rupee";
		nativeCurrency = "روپيه";
		currencySymbol = "Rs";
		currencyIso = "PKR";
		englishRegion = "Islamic Republic of Pakistan";
		nativeRegion = "پاکستان";
		iso2Region = "PK";
		iso3Region = "PAK";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new UrPK();
}