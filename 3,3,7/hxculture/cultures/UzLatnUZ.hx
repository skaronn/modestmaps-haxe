package hxculture.cultures;

import hxculture.Culture;

class UzLatnUZ extends Culture {
	function new() {
		language = hxculture.languages.Uz.language;
		name = "uz-Latn-UZ";
		english = "Uzbek (Latin, Uzbekistan)";
		native = "U'zbek (U'zbekiston Respublikasi)";
		date = new hxculture.core.DateTimeInfo(
			["yanvar", "fevral", "mart", "aprel", "may", "iyun", "iyul", "avgust", "sentyabr", "oktyabr", "noyabr", "dekabr", ""],
			["yanvar", "fevral", "mart", "aprel", "may", "iyun", "iyul", "avgust", "sentyabr", "oktyabr", "noyabr", "dekabr", ""],
			["yakshanba", "dushanba", "seshanba", "chorshanba", "payshanba", "juma", "shanba"],
			["yak.", "dsh.", "sesh.", "chr.", "psh.", "jm.", "sh."],
			["yak", "dsh", "sesh", "chr", "psh", "jm", "sh"],
			null,
			null,
			"/",
			":",
			1,
			"%B %Y",
			"%e-%B",
			"%Y yil %e-%B",
			"%d/%m %Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y yil %e-%B %H:%M:%S",
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
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(0, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Uzbekistan Sum";
		nativeCurrency = "рубль";
		currencySymbol = "su'm";
		currencyIso = "UZS";
		englishRegion = "Uzbekistan";
		nativeRegion = "U'zbekiston Respublikasi";
		iso2Region = "UZ";
		iso3Region = "UZB";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new UzLatnUZ();
}