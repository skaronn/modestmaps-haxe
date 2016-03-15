package hxculture.cultures;

import hxculture.Culture;

class ArDZ extends Culture {
	function new() {
		language = hxculture.languages.Ar.language;
		name = "ar-DZ";
		english = "Arabic (Algeria)";
		native = "العربية (الجزائر)";
		date = new hxculture.core.DateTimeInfo(
			["جانفييه", "فيفرييه", "مارس", "أفريل", "مي", "جوان", "جوييه", "أوت", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر", ""],
			["جانفييه", "فيفرييه", "مارس", "أفريل", "مي", "جوان", "جوييه", "أوت", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر", ""],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["أ", "ا", "ث", "أ", "خ", "ج", "س"],
			"ص",
			"م",
			"-",
			":",
			6,
			"%B, %Y",
			"%d %B",
			"%d %B, %Y",
			"%d-%m-%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B, %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "ليس برقم";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-لا نهاية";
		symbolPosInf = "+لا نهاية";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "n-", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$n-", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Algerian Dinar";
		nativeCurrency = "دينار جزائري";
		currencySymbol = "د.ج.‏";
		currencyIso = "DZD";
		englishRegion = "Algeria";
		nativeRegion = "الجزائر";
		iso2Region = "DZ";
		iso3Region = "DZA";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ArDZ();
}