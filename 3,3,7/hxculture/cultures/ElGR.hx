package hxculture.cultures;

import hxculture.Culture;

class ElGR extends Culture {
	function new() {
		language = hxculture.languages.El.language;
		name = "el-GR";
		english = "Greek (Greece)";
		native = "ελληνικά (Ελλάδα)";
		date = new hxculture.core.DateTimeInfo(
			["Ιανουάριος", "Φεβρουάριος", "Μάρτιος", "Απρίλιος", "Μάιος", "Ιούνιος", "Ιούλιος", "Αύγουστος", "Σεπτέμβριος", "Οκτώβριος", "Νοέμβριος", "Δεκέμβριος", ""],
			["Ιαν", "Φεβ", "Μαρ", "Απρ", "Μαϊ", "Ιουν", "Ιουλ", "Αυγ", "Σεπ", "Οκτ", "Νοε", "Δεκ", ""],
			["Κυριακή", "Δευτέρα", "Τρίτη", "Τετάρτη", "Πέμπτη", "Παρασκευή", "Σάββατο"],
			["Κυρ", "Δευ", "Τρι", "Τετ", "Πεμ", "Παρ", "Σαβ"],
			["Κυ", "Δε", "Τρ", "Τε", "Πε", "Πα", "Σά"],
			"πμ",
			"μμ",
			"/",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%A, %e %B %Y",
			"%e/%f/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e %B %Y %l:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%l:%M:%S %p",
			"%l:%M %p");
		symbolNaN = "μη αριθμός";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Άπειρο";
		symbolPosInf = "Άπειρο";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Euro";
		nativeCurrency = "ευρώ";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Greece";
		nativeRegion = "Ελλάδα";
		iso2Region = "GR";
		iso3Region = "GRC";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ElGR();
}