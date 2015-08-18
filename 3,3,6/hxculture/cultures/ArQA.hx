package hxculture.cultures;

import hxculture.Culture;

class ArQA extends Culture {
	function new() {
		language = hxculture.languages.Ar.language;
		name = "ar-QA";
		english = "Arabic (Qatar)";
		native = "العربية (قطر)";
		date = new hxculture.core.DateTimeInfo(
			["يناير", "فبراير", "مارس", "ابريل", "مايو", "يونيو", "يوليو", "اغسطس", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر", ""],
			["يناير", "فبراير", "مارس", "ابريل", "مايو", "يونيو", "يوليو", "اغسطس", "سبتمبر", "اكتوبر", "نوفمبر", "ديسمبر", ""],
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
		englishCurrency = "Qatari Rial";
		nativeCurrency = "ريال قطري";
		currencySymbol = "ر.ق.‏";
		currencyIso = "QAR";
		englishRegion = "Qatar";
		nativeRegion = "قطر";
		iso2Region = "QA";
		iso3Region = "QAT";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ArQA();
}