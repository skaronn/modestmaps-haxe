package hxculture.cultures;

import hxculture.Culture;

class ArMA extends Culture {
	function new() {
		language = hxculture.languages.Ar.language;
		name = "ar-MA";
		english = "Arabic (Morocco)";
		native = "العربية (المملكة المغربية)";
		date = new hxculture.core.DateTimeInfo(
			["يناير", "فبراير", "مارس", "ابريل", "ماي", "يونيو", "يوليوز", "غشت", "شتنبر", "اكتوبر", "نونبر", "دجنبر", ""],
			["يناير", "فبراير", "مارس", "ابريل", "ماي", "يونيو", "يوليوز", "غشت", "شتنبر", "اكتوبر", "نونبر", "دجنبر", ""],
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
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "n-", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$n-", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Moroccan Dirham";
		nativeCurrency = "درهم مغربي";
		currencySymbol = "د.م.‏";
		currencyIso = "MAD";
		englishRegion = "Morocco";
		nativeRegion = "المملكة المغربية";
		iso2Region = "MA";
		iso3Region = "MAR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ArMA();
}