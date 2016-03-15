package hxculture.cultures;

import hxculture.Culture;

class TeIN extends Culture {
	function new() {
		language = hxculture.languages.Te.language;
		name = "te-IN";
		english = "Telugu (India)";
		native = "తెలుగు (భారత దేశం)";
		date = new hxculture.core.DateTimeInfo(
			["జనవరి", "ఫిబ్రవరి", "మార్చి", "ఏప్రిల్", "మే", "జూన్", "జూలై", "ఆగస్టు", "సెప్టెంబర్", "అక్టోబర్", "నవంబర్", "డిసెంబర్", ""],
			["జనవరి", "ఫిబ్రవరి", "మార్చి", "ఏప్రిల్", "మే", "జూన్", "జూలై", "ఆగస్టు", "సెప్టెంబర్", "అక్టోబర్", "నవంబర్", "డిసెంబర్", ""],
			["ఆదివారం", "సోమవారం", "మంగళవారం", "బుధవారం", "గురువారం", "శుక్రవారం", "శనివారం"],
			["ఆది.", "సోమ.", "మంగళ.", "బుధ.", "గురు.", "శుక్ర.", "శని."],
			["ఆ", "స", "మ", "బ", "గ", "శ", "శ"],
			"పూర్వాహ్న",
			"అపరాహ్న",
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
		digits = ["౦", "౧", "౨", "౩", "౪", "౫", "౬", "౭", "౮", "౯"];
		number = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ".", [3, 2], ",", "-n %", "n %");
		englishCurrency = "Indian Rupee";
		nativeCurrency = "రూపాయి";
		currencySymbol = "రూ";
		currencyIso = "INR";
		englishRegion = "India";
		nativeRegion = "భారత దేశం";
		iso2Region = "IN";
		iso3Region = "IND";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new TeIN();
}