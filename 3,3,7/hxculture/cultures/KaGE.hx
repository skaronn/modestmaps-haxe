package hxculture.cultures;

import hxculture.Culture;

class KaGE extends Culture {
	function new() {
		language = hxculture.languages.Ka.language;
		name = "ka-GE";
		english = "Georgian (Georgia)";
		native = "ქართული (საქართველო)";
		date = new hxculture.core.DateTimeInfo(
			["იანვარი", "თებერვალი", "მარტი", "აპრილი", "მაისი", "ივნისი", "ივლისი", "აგვისტო", "სექტემბერი", "ოქტომბერი", "ნოემბერი", "დეკემბერი", ""],
			["იან", "თებ", "მარ", "აპრ", "მაის", "ივნ", "ივლ", "აგვ", "სექ", "ოქტ", "ნოემ", "დეკ", ""],
			["კვირა", "ორშაბათი", "სამშაბათი", "ოთხშაბათი", "ხუთშაბათი", "პარასკევი", "შაბათი"],
			["კვირა", "ორშაბათი", "სამშაბათი", "ოთხშაბათი", "ხუთშაბათი", "პარასკევი", "შაბათი"],
			["კ", "ო", "ს", "ო", "ხ", "პ", "შ"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%d %m",
			"%Y წლის %d %m, %A",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y წლის %d %m, %A %k:%M:%S",
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
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n %", "n %");
		englishCurrency = "Lari";
		nativeCurrency = "ლარი";
		currencySymbol = "Lari";
		currencyIso = "GEL";
		englishRegion = "Georgia";
		nativeRegion = "საქართველო";
		iso2Region = "GE";
		iso3Region = "GEO";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new KaGE();
}