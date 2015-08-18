package hxculture.cultures;

import hxculture.Culture;

class DvMV extends Culture {
	function new() {
		language = hxculture.languages.Dv.language;
		name = "dv-MV";
		english = "Divehi (Maldives)";
		native = "ދިވެހިބަސް (ދިވެހި ރާއްޖެ)";
		date = new hxculture.core.DateTimeInfo(
			["محرم", "صفر", "ربيع الأول", "ربيع الثاني", "جمادى الأولى", "جمادى الثانية", "رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة", ""],
			["محرم", "صفر", "ربيع الاول", "ربيع الثاني", "جمادى الاولى", "جمادى الثانية", "رجب", "شعبان", "رمضان", "شوال", "ذو القعدة", "ذو الحجة", ""],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["الاحد", "الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"],
			["ح", "ن", "ث", "ر", "خ", "ج", "س"],
			"މކ",
			"މފ",
			"/",
			":",
			0,
			"%B, %Y",
			"%d %B",
			"%d/%B/%Y",
			"%d/%m/%y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d/%B/%Y %H:%M:%S",
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
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "n $-", "n $");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Rufiyaa";
		nativeCurrency = "ރުފިޔާ";
		currencySymbol = "ރ.";
		currencyIso = "MVR";
		englishRegion = "Maldives";
		nativeRegion = "ދިވެހި ރާއްޖެ";
		iso2Region = "MV";
		iso3Region = "MDV";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new DvMV();
}