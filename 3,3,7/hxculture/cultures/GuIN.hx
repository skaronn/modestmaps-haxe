package hxculture.cultures;

import hxculture.Culture;

class GuIN extends Culture {
	function new() {
		language = hxculture.languages.Gu.language;
		name = "gu-IN";
		english = "Gujarati (India)";
		native = "ગુજરાતી (ભારત)";
		date = new hxculture.core.DateTimeInfo(
			["જાન્યુઆરી", "ફેબ્રુઆરી", "માર્ચ", "એપ્રિલ", "મે", "જૂન", "જુલાઈ", "ઑગસ્ટ", "સપ્ટેમ્બર", "ઑક્ટ્બર", "નવેમ્બર", "ડિસેમ્બર", ""],
			["જાન્યુ", "ફેબ્રુ", "માર્ચ", "એપ્રિલ", "મે", "જૂન", "જુલાઈ", "ઑગસ્ટ", "સપ્ટે", "ઑક્ટો", "નવે", "ડિસે", ""],
			["રવિવાર", "સોમવાર", "મંગળવાર", "બુધવાર", "ગુરુવાર", "શુક્રવાર", "શનિવાર"],
			["રવિ", "સોમ", "મંગળ", "બુધ", "ગુરુ", "શુક્ર", "શનિ"],
			["ર", "સ", "મ", "બ", "ગ", "શ", "શ"],
			"પૂર્વ મધ્યાહ્ન",
			"ઉત્તર મધ્યાહ્ન",
			"-",
			":",
			1,
			"%B, %Y",
			"%d %B",
			"%d %B %Y",
			"%d-%m-%y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %H:%M:%S",
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
		digits = ["૦", "૧", "૨", "૩", "૪", "૫", "૬", "૭", "૮", "૯"];
		number = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n %", "n %");
		englishCurrency = "Indian Rupee";
		nativeCurrency = "રૂપિયો";
		currencySymbol = "રૂ";
		currencyIso = "INR";
		englishRegion = "India";
		nativeRegion = "ભારત";
		iso2Region = "IN";
		iso3Region = "IND";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new GuIN();
}