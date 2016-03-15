package hxculture.cultures;

import hxculture.Culture;

class HiIN extends Culture {
	function new() {
		language = hxculture.languages.Hi.language;
		name = "hi-IN";
		english = "Hindi (India)";
		native = "हिंदी (भारत)";
		date = new hxculture.core.DateTimeInfo(
			["जनवरी", "फरवरी", "मार्च", "अप्रैल", "मई", "जून", "जुलाई", "अगस्त", "सितम्बर", "अक्तूबर", "नवम्बर", "दिसम्बर", ""],
			["जनवरी", "फरवरी", "मार्च", "अप्रैल", "मई", "जून", "जुलाई", "अगस्त", "सितम्बर", "अक्तूबर", "नवम्बर", "दिसम्बर", ""],
			["रविवार", "सोमवार", "मंगलवार", "बुधवार", "गुरुवार", "शुक्रवार", "शनिवार"],
			["रवि.", "सोम.", "मंगल.", "बुध.", "गुरु.", "शुक्र.", "शनि."],
			["र", "स", "म", "ब", "ग", "श", "श"],
			"पूर्वाह्न",
			"अपराह्न",
			"-",
			":",
			1,
			"%B, %Y",
			"%d %B",
			"%d %B %Y",
			"%d-%m-%Y",
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
		number = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n %", "n %");
		englishCurrency = "Indian Rupee";
		nativeCurrency = "रुपया";
		currencySymbol = "रु";
		currencyIso = "INR";
		englishRegion = "India";
		nativeRegion = "भारत";
		iso2Region = "IN";
		iso3Region = "IND";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new HiIN();
}