package hxculture.cultures;

import hxculture.Culture;

class LtLT extends Culture {
	function new() {
		language = hxculture.languages.Lt.language;
		name = "lt-LT";
		english = "Lithuanian (Lithuania)";
		native = "lietuvių (Lietuva)";
		date = new hxculture.core.DateTimeInfo(
			["sausis", "vasaris", "kovas", "balandis", "gegužė", "birželis", "liepa", "rugpjūtis", "rugsėjis", "spalis", "lapkritis", "gruodis", ""],
			["Sau", "Vas", "Kov", "Bal", "Geg", "Bir", "Lie", "Rgp", "Rgs", "Spl", "Lap", "Grd", ""],
			["sekmadienis", "pirmadienis", "antradienis", "trečiadienis", "ketvirtadienis", "penktadienis", "šeštadienis"],
			["Sk", "Pr", "An", "Tr", "Kt", "Pn", "Št"],
			["S", "P", "A", "T", "K", "Pn", "Š"],
			null,
			null,
			".",
			":",
			1,
			"%Y m. %B",
			"%B %e d.",
			"%Y m. %B %e d.",
			"%Y.%m.%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y m. %B %e d. %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-begalybė";
		symbolPosInf = "begalybė";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Lithuanian Litas";
		nativeCurrency = "Litas";
		currencySymbol = "Lt";
		currencyIso = "LTL";
		englishRegion = "Lithuania";
		nativeRegion = "Lietuva";
		iso2Region = "LT";
		iso3Region = "LTU";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new LtLT();
}