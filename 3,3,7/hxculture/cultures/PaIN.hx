package hxculture.cultures;

import hxculture.Culture;

class PaIN extends Culture {
	function new() {
		language = hxculture.languages.Pa.language;
		name = "pa-IN";
		english = "Punjabi (India)";
		native = "ਪੰਜਾਬੀ (ਭਾਰਤ)";
		date = new hxculture.core.DateTimeInfo(
			["ਜਨਵਰੀ", "ਫ਼ਰਵਰੀ", "ਮਾਰਚ", "ਅਪ੍ਰੈਲ", "ਮਈ", "ਜੂਨ", "ਜੁਲਾਈ", "ਅਗਸਤ", "ਸਤੰਬਰ", "ਅਕਤੂਬਰ", "ਨਵੰਬਰ", "ਦਸੰਬਰ", ""],
			["ਜਨਵਰੀ", "ਫ਼ਰਵਰੀ", "ਮਾਰਚ", "ਅਪ੍ਰੈਲ", "ਮਈ", "ਜੂਨ", "ਜੁਲਾਈ", "ਅਗਸਤ", "ਸਤੰਬਰ", "ਅਕਤੂਬਰ", "ਨਵੰਬਰ", "ਦਸੰਬਰ", ""],
			["ਐਤਵਾਰ", "ਸੋਮਵਾਰ", "ਮੰਗਲਵਾਰ", "ਬੁਧਵਾਰ", "ਵੀਰਵਾਰ", "ਸ਼ੁੱਕਰਵਾਰ", "ਸ਼ਨੀਚਰਵਾਰ"],
			["ਐਤ.", "ਸੋਮ.", "ਮੰਗਲ.", "ਬੁਧ.", "ਵੀਰ.", "ਸ਼ੁਕਰ.", "ਸ਼ਨੀ."],
			["ਐ", "ਸ", "ਮ", "ਬ", "ਵ", "ਸ਼", "ਸ਼"],
			"ਸਵੇਰੇ",
			"ਸ਼ਾਮ",
			"-",
			":",
			1,
			"%B, %Y",
			"%d %B",
			"%d %B %Y %A",
			"%d-%m-%y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %A %p %I:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%p %I:%M:%S",
			"%p %I:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		digits = ["੦", "੧", "੨", "੩", "੪", "੫", "੬", "੭", "੮", "੯"];
		number = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n %", "n %");
		englishCurrency = "Indian Rupee";
		nativeCurrency = "ਰੁਪਿਆ";
		currencySymbol = "ਰੁ";
		currencyIso = "INR";
		englishRegion = "India";
		nativeRegion = "ਭਾਰਤ";
		iso2Region = "IN";
		iso3Region = "IND";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new PaIN();
}