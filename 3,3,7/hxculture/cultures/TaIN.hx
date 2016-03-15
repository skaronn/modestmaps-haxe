package hxculture.cultures;

import hxculture.Culture;

class TaIN extends Culture {
	function new() {
		language = hxculture.languages.Ta.language;
		name = "ta-IN";
		english = "Tamil (India)";
		native = "தமிழ் (இந்தியா)";
		date = new hxculture.core.DateTimeInfo(
			["ஜனவரி", "பெப்ரவரி", "மார்ச்", "ஏப்ரல்", "மே", "ஜூன்", "ஜூலை", "ஆகஸ்ட்", "செப்டம்பர்", "அக்டோபர்", "நவம்பர்", "டிசம்பர்", ""],
			["ஜன.", "பெப்.", "மார்.", "ஏப்.", "மே", "ஜூன்", "ஜூலை", "ஆக.", "செப்.", "அக்.", "நவ.", "டிச.", ""],
			["ஞாயிறு", "திங்கள்", "செவ்வாய்", "புதன்", "வியாழன்", "வெள்ளி", "சனி"],
			["ஞா", "தி", "செ", "பு", "வி", "வெ", "ச"],
			["ஞ", "த", "ச", "ப", "வ", "வ", "ச"],
			"காலை",
			"மாலை",
			"-",
			":",
			1,
			"%B %Y",
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
		nativeCurrency = "ரூபாய்";
		currencySymbol = "ரூ";
		currencyIso = "INR";
		englishRegion = "India";
		nativeRegion = "இந்தியா";
		iso2Region = "IN";
		iso3Region = "IND";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new TaIN();
}