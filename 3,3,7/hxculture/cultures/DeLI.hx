package hxculture.cultures;

import hxculture.Culture;

class DeLI extends Culture {
	function new() {
		language = hxculture.languages.De.language;
		name = "de-LI";
		english = "German (Liechtenstein)";
		native = "Deutsch (Liechtenstein)";
		date = new hxculture.core.DateTimeInfo(
			["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember", ""],
			["Jan", "Feb", "Mrz", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dez", ""],
			["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"],
			["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"],
			["So", "Mo", "Di", "Mi", "Do", "Fr", "Sa"],
			null,
			null,
			".",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%A, %e. %B %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e. %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "n. def.";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-unendlich";
		symbolPosInf = "+unendlich";
		number = new hxculture.core.NumberInfo(2, ".", [3], "'", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], "'", "$-n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], "'", "-n%", "n%");
		englishCurrency = "Swiss Franc";
		nativeCurrency = "Schweizer Franken";
		currencySymbol = "CHF";
		currencyIso = "CHF";
		englishRegion = "Liechtenstein";
		nativeRegion = "Liechtenstein";
		iso2Region = "LI";
		iso3Region = "LIE";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new DeLI();
}