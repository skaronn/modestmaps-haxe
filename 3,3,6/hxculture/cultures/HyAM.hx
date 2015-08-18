package hxculture.cultures;

import hxculture.Culture;

class HyAM extends Culture {
	function new() {
		language = hxculture.languages.Hy.language;
		name = "hy-AM";
		english = "Armenian (Armenia)";
		native = "Հայերեն (Հայաստան)";
		date = new hxculture.core.DateTimeInfo(
			["Հունվար", "Փետրվար", "Մարտ", "Ապրիլ", "Մայիս", "Հունիս", "Հուլիս", "Օգոստոս", "Սեպտեմբեր", "Հոկտեմբեր", "Նոյեմբեր", "Դեկտեմբեր", ""],
			["ՀՆՎ", "ՓՏՎ", "ՄՐՏ", "ԱՊՐ", "ՄՅՍ", "ՀՆՍ", "ՀԼՍ", "ՕԳՍ", "ՍԵՊ", "ՀՈԿ", "ՆՈՅ", "ԴԵԿ", ""],
			["Կիրակի", "Երկուշաբթի", "Երեքշաբթի", "Չորեքշաբթի", "Հինգշաբթի", "ՈՒրբաթ", "Շաբաթ"],
			["Կիր", "Երկ", "Երք", "Չրք", "Հնգ", "ՈՒր", "Շբթ"],
			["Կ", "Ե", "Ե", "Չ", "Հ", "Ո", "Շ"],
			null,
			null,
			".",
			":",
			1,
			"%B, %Y",
			"%e %B",
			"%e %B, %Y",
			"%d.%m.%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%e %B, %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Armenian Dram";
		nativeCurrency = "դրամ";
		currencySymbol = "դր.";
		currencyIso = "AMD";
		englishRegion = "Armenia";
		nativeRegion = "Հայաստան";
		iso2Region = "AM";
		iso3Region = "ARM";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new HyAM();
}