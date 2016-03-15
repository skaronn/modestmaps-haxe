package hxculture.cultures;

import hxculture.Culture;

class ZhCN extends Culture {
	function new() {
		language = hxculture.languages.ZhHans.language;
		name = "zh-CN";
		english = "Chinese (People's Republic of China)";
		native = "中文(中华人民共和国)";
		date = new hxculture.core.DateTimeInfo(
			["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
			["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
			["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
			["日", "一", "二", "三", "四", "五", "六"],
			["日", "一", "二", "三", "四", "五", "六"],
			"上午",
			"下午",
			"/",
			":",
			0,
			"%Y年%f月",
			"%f月%e日",
			"%Y年%f月%e日",
			"%Y/%f/%e",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y年%f月%e日 %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "非数字";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "负无穷大";
		symbolPosInf = "正无穷大";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ".", [3], ",", "$-n", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n%", "n%");
		englishCurrency = "PRC Yuan Renminbi";
		nativeCurrency = "人民币";
		currencySymbol = "￥";
		currencyIso = "CNY";
		englishRegion = "People's Republic of China";
		nativeRegion = "中华人民共和国";
		iso2Region = "CN";
		iso3Region = "CHN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new ZhCN();
}