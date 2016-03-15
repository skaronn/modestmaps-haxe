package hxculture.cultures;

import hxculture.Culture;

class ArTN extends Culture {
	function new() {
		language = hxculture.languages.Ar.language;
		name = "ar-TN";
		english = "Arabic (Tunisia)";
		native = "العربية (تونس)";
		date = new hxculture.core.DateTimeInfo(
			["جانفي", "فيفري", "مارس", "افريل", "ماي", "جوان", "جويلية", "اوت", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر", ""],
			["جانفي", "فيفري", "مارس", "افريل", "ماي", "جوان", "جويلية", "اوت", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر", ""],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["أ", "ا", "ث", "أ", "خ", "ج", "س"],
			"ص",
			"م",
			"-",
			":",
			1,
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
		number = new hxculture.core.NumberInfo(3, ".", [3], ",", "n-", "n");
		currency = new hxculture.core.NumberInfo(3, ".", [3], ",", "$n-", "$ n");
		percent = new hxculture.core.NumberInfo(3, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Tunisian Dinar";
		nativeCurrency = "دينار تونسي";
		currencySymbol = "د.ت.‏";
		currencyIso = "TND";
		englishRegion = "Tunisia";
		nativeRegion = "تونس";
		iso2Region = "TN";
		iso3Region = "TUN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ArTN();
}