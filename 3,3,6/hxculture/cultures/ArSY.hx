package hxculture.cultures;

import hxculture.Culture;

class ArSY extends Culture {
	function new() {
		language = hxculture.languages.Ar.language;
		name = "ar-SY";
		english = "Arabic (Syria)";
		native = "العربية (سوريا)";
		date = new hxculture.core.DateTimeInfo(
			["كانون الثاني", "شباط", "آذار", "نيسان", "أيار", "حزيران", "تموز", "آب", "أيلول", "تشرين الأول", "تشرين الثاني", "كانون الأول", ""],
			["كانون الثاني", "شباط", "آذار", "نيسان", "أيار", "حزيران", "تموز", "آب", "أيلول", "تشرين الأول", "تشرين الثاني", "كانون الأول", ""],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["أ", "ا", "ث", "أ", "خ", "ج", "س"],
			"ص",
			"م",
			"/",
			":",
			6,
			"%B, %Y",
			"%d %B",
			"%d %B, %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B, %Y %I:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%I:%M:%S %p",
			"%I:%M %p");
		symbolNaN = "ليس برقم";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-لا نهاية";
		symbolPosInf = "+لا نهاية";
		digits = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "n-", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$n-", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Syrian Pound";
		nativeCurrency = "ليرة سوري";
		currencySymbol = "ل.س.‏";
		currencyIso = "SYP";
		englishRegion = "Syria";
		nativeRegion = "سوريا";
		iso2Region = "SY";
		iso3Region = "SYR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ArSY();
}