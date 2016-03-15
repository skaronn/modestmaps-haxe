package hxculture.cultures;

import hxculture.Culture;

class ThTH extends Culture {
	function new() {
		language = hxculture.languages.Th.language;
		name = "th-TH";
		english = "Thai (Thailand)";
		native = "ไทย (ไทย)";
		date = new hxculture.core.DateTimeInfo(
			["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม", ""],
			["ม.ค.", "ก.พ.", "มี.ค.", "เม.ย.", "พ.ค.", "มิ.ย.", "ก.ค.", "ส.ค.", "ก.ย.", "ต.ค.", "พ.ย.", "ธ.ค.", ""],
			["อาทิตย์", "จันทร์", "อังคาร", "พุธ", "พฤหัสบดี", "ศุกร์", "เสาร์"],
			["อา.", "จ.", "อ.", "พ.", "พฤ.", "ศ.", "ส."],
			["อ", "จ", "อ", "พ", "พ", "ศ", "ส"],
			"AM",
			"PM",
			"/",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%e %B %Y",
			"%e/%f/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y %k:%M:%S",
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
		digits = ["๐", "๑", "๒", "๓", "๔", "๕", "๖", "๗", "๘", "๙"];
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "-$n", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Thai Baht";
		nativeCurrency = "บาท";
		currencySymbol = "฿";
		currencyIso = "THB";
		englishRegion = "Thailand";
		nativeRegion = "ไทย";
		iso2Region = "TH";
		iso3Region = "THA";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ThTH();
}