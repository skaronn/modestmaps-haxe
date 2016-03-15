package hxculture.cultures;

import hxculture.Culture;

class PlPL extends Culture {
	function new() {
		language = hxculture.languages.Pl.language;
		name = "pl-PL";
		english = "Polish (Poland)";
		native = "polski (Polska)";
		date = new hxculture.core.DateTimeInfo(
			["styczeń", "luty", "marzec", "kwiecień", "maj", "czerwiec", "lipiec", "sierpień", "wrzesień", "październik", "listopad", "grudzień", ""],
			["sty", "lut", "mar", "kwi", "maj", "cze", "lip", "sie", "wrz", "paź", "lis", "gru", ""],
			["niedziela", "poniedziałek", "wtorek", "środa", "czwartek", "piątek", "sobota"],
			["N", "Pn", "Wt", "Śr", "Cz", "Pt", "So"],
			["N", "Pn", "Wt", "Śr", "Cz", "Pt", "So"],
			null,
			null,
			"-",
			":",
			1,
			"%B %Y",
			"%e %B",
			"%e %B %Y",
			"%Y-%m-%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "nie jest liczbą";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-nieskończoność";
		symbolPosInf = "+nieskończoność";
		number = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], " ", "-n%", "n%");
		englishCurrency = "Polish Zloty";
		nativeCurrency = "Złoty";
		currencySymbol = "zł";
		currencyIso = "PLN";
		englishRegion = "Poland";
		nativeRegion = "Polska";
		iso2Region = "PL";
		iso3Region = "POL";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new PlPL();
}