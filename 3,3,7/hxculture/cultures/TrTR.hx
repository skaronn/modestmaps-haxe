package hxculture.cultures;

import hxculture.Culture;

class TrTR extends Culture {
	function new() {
		language = hxculture.languages.Tr.language;
		name = "tr-TR";
		english = "Turkish (Turkey)";
		native = "Türkçe (Türkiye)";
		date = new hxculture.core.DateTimeInfo(
			["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık", ""],
			["Oca", "Şub", "Mar", "Nis", "May", "Haz", "Tem", "Ağu", "Eyl", "Eki", "Kas", "Ara", ""],
			["Pazar", "Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi"],
			["Paz", "Pzt", "Sal", "Çar", "Per", "Cum", "Cmt"],
			["Pz", "Pt", "Sa", "Ça", "Pe", "Cu", "Ct"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%d %B %Y %A",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %A %H:%M:%S",
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
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-%n", "%n");
		englishCurrency = "New Turkish Lira";
		nativeCurrency = "Yeni Türk Lirası";
		currencySymbol = "YTL";
		currencyIso = "TRY";
		englishRegion = "Turkey";
		nativeRegion = "Türkiye";
		iso2Region = "TR";
		iso3Region = "TUR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new TrTR();
}