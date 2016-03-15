package hxculture.cultures;

import hxculture.Culture;

class FiFI extends Culture {
	function new() {
		language = hxculture.languages.Fi.language;
		name = "fi-FI";
		english = "Finnish (Finland)";
		native = "suomi (Suomi)";
		date = new hxculture.core.DateTimeInfo(
			["tammikuu", "helmikuu", "maaliskuu", "huhtikuu", "toukokuu", "kesäkuu", "heinäkuu", "elokuu", "syyskuu", "lokakuu", "marraskuu", "joulukuu", ""],
			["tammi", "helmi", "maalis", "huhti", "touko", "kesä", "heinä", "elo", "syys", "loka", "marras", "joulu", ""],
			["sunnuntai", "maanantai", "tiistai", "keskiviikko", "torstai", "perjantai", "lauantai"],
			["su", "ma", "ti", "ke", "to", "pe", "la"],
			["su", "ma", "ti", "ke", "to", "pe", "la"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%e. %Bta",
			"%e. %Bta %Y",
			"%e.%f.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %Bta %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-INF";
		symbolPosInf = "INF";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n %", "n %");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Finland";
		nativeRegion = "Suomi";
		iso2Region = "FI";
		iso3Region = "FIN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new FiFI();
}