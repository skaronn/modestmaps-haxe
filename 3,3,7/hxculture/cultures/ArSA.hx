package hxculture.cultures;

import hxculture.Culture;

class ArSA extends Culture {
	function new() {
		language = hxculture.languages.Ar.language;
		name = "ar-SA";
		english = "Arabic (Saudi Arabia)";
		native = "العربية (المملكة العربية السعودية)";
		date = new hxculture.core.DateTimeInfo(
			["محرم", "صفر", "ربيع الأول", "ربيع الثاني", "جمادى الأولى", "جمادى الثانية", "رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة", ""],
			["محرم", "صفر", "ربيع الاول", "ربيع الثاني", "جمادى الاولى", "جمادى الثانية", "رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة", ""],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["ح", "ن", "ث", "ر", "خ", "ج", "س"],
			"ص",
			"م",
			"/",
			":",
			6,
			"%B, %Y",
			"%d %B",
			"%d/%B/%Y",
			"%d/%m/%y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d/%B/%Y %I:%M:%S %p",
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
		englishCurrency = "Saudi Riyal";
		nativeCurrency = "ريال سعودي";
		currencySymbol = "ر.س.‏";
		currencyIso = "SAR";
		englishRegion = "Saudi Arabia";
		nativeRegion = "المملكة العربية السعودية";
		iso2Region = "SA";
		iso3Region = "SAU";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ArSA();
}