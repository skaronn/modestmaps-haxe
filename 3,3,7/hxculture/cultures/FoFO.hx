package hxculture.cultures;

import hxculture.Culture;

class FoFO extends Culture {
	function new() {
		language = hxculture.languages.Fo.language;
		name = "fo-FO";
		english = "Faroese (Faroe Islands)";
		native = "føroyskt (Føroyar)";
		date = new hxculture.core.DateTimeInfo(
			["januar", "februar", "mars", "apríl", "mai", "juni", "juli", "august", "september", "oktober", "november", "desember", ""],
			["jan", "feb", "mar", "apr", "mai", "jun", "jul", "aug", "sep", "okt", "nov", "des", ""],
			["sunnudagur", "mánadagur", "týsdagur", "mikudagur", "hósdagur", "fríggjadagur", "leygardagur"],
			["sun", "mán", "týs", "mik", "hós", "frí", "leyg"],
			["su", "má", "tý", "mi", "hó", "fr", "ley"],
			null,
			null,
			"-",
			".",
			1,
			"%B %Y",
			"%e. %B",
			"%e. %B %Y",
			"%d-%m-%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e. %B %Y %H.%M.%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H.%M.%S",
			"%H.%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-INF";
		symbolPosInf = "INF";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Danish Krone";
		nativeCurrency = "Dansk krone";
		currencySymbol = "kr";
		currencyIso = "DKK";
		englishRegion = "Faroe Islands";
		nativeRegion = "Føroyar";
		iso2Region = "FO";
		iso3Region = "FRO";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new FoFO();
}