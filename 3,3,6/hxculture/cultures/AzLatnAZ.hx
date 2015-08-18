package hxculture.cultures;

import hxculture.Culture;

class AzLatnAZ extends Culture {
	function new() {
		language = hxculture.languages.Az.language;
		name = "az-Latn-AZ";
		english = "Azeri (Latin, Azerbaijan)";
		native = "Azərbaycan­ılı (Azərbaycanca)";
		date = new hxculture.core.DateTimeInfo(
			["Yanvar", "Fevral", "Mart", "Aprel", "May", "İyun", "İyul", "Avgust", "Sentyabr", "Oktyabr", "Noyabr", "Dekabr", ""],
			["Yan", "Fev", "Mar", "Apr", "May", "İyun", "İyul", "Avg", "Sen", "Okt", "Noy", "Dek", ""],
			["Bazar", "Bazar ertəsi", "Çərşənbə axşamı", "Çərşənbə", "Cümə axşamı", "Cümə", "Şənbə"],
			["B", "Be", "Ça", "Ç", "Ca", "C", "Ş"],
			["B", "Be", "Ça", "Ç", "Ca", "C", "Ş"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e %B",
			"%e %B %Y",
			"%d.%m.%Y",
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
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Azerbaijanian Manat";
		nativeCurrency = "manat";
		currencySymbol = "man.";
		currencyIso = "AZM";
		englishRegion = "Azerbaijan";
		nativeRegion = "Azərbaycanca";
		iso2Region = "AZ";
		iso3Region = "AZE";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new AzLatnAZ();
}