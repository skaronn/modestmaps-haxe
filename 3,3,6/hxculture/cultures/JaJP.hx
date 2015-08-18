package hxculture.cultures;

import hxculture.Culture;

class JaJP extends Culture {
	function new() {
		language = hxculture.languages.Ja.language;
		name = "ja-JP";
		english = "Japanese (Japan)";
		native = "日本語 (日本)";
		date = new hxculture.core.DateTimeInfo(
			["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月", ""],
			["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", ""],
			["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
			["日", "月", "火", "水", "木", "金", "土"],
			["日", "月", "火", "水", "木", "金", "土"],
			"午前",
			"午後",
			"/",
			":",
			0,
			"%Y年%f月",
			"%f月%e日",
			"%Y年%f月%e日",
			"%Y/%m/%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y年%f月%e日 %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN (非数値)";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-∞";
		symbolPosInf = "+∞";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(0, ".", [3], ",", "-$n", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n%", "n%");
		englishCurrency = "Japanese Yen";
		nativeCurrency = "円";
		currencySymbol = "¥";
		currencyIso = "JPY";
		englishRegion = "Japan";
		nativeRegion = "日本";
		iso2Region = "JP";
		iso3Region = "JPN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new JaJP();
}