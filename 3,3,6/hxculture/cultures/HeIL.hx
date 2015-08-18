package hxculture.cultures;

import hxculture.Culture;

class HeIL extends Culture {
	function new() {
		language = hxculture.languages.He.language;
		name = "he-IL";
		english = "Hebrew (Israel)";
		native = "עברית (ישראל)";
		date = new hxculture.core.DateTimeInfo(
			["ינואר", "פברואר", "מרץ", "אפריל", "מאי", "יוני", "יולי", "אוגוסט", "ספטמבר", "אוקטובר", "נובמבר", "דצמבר", ""],
			["ינו", "פבר", "מרץ", "אפר", "מאי", "יונ", "יול", "אוג", "ספט", "אוק", "נוב", "דצמ", ""],
			["יום ראשון", "יום שני", "יום שלישי", "יום רביעי", "יום חמישי", "יום שישי", "שבת"],
			["יום א", "יום ב", "יום ג", "יום ד", "יום ה", "יום ו", "שבת"],
			["א", "ב", "ג", "ד", "ה", "ו", "ש"],
			"AM",
			"PM",
			"/",
			":",
			0,
			"%B %Y",
			"%d %B",
			"%A %d %B %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A %d %B %Y %H:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%H:%M:%S",
			"%H:%M");
		symbolNaN = "לא מספר";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "אינסוף שלילי";
		symbolPosInf = "אינסוף חיובי";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$-n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n%", "n%");
		englishCurrency = "Israeli New Shekel";
		nativeCurrency = "שקל חדש";
		currencySymbol = "₪";
		currencyIso = "ILS";
		englishRegion = "Israel";
		nativeRegion = "ישראל";
		iso2Region = "IL";
		iso3Region = "ISR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new HeIL();
}