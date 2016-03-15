package hxculture.cultures;

import hxculture.Culture;

class KoKR extends Culture {
	function new() {
		language = hxculture.languages.Ko.language;
		name = "ko-KR";
		english = "Korean (Korea)";
		native = "한국어 (대한민국)";
		date = new hxculture.core.DateTimeInfo(
			["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월", ""],
			["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", ""],
			["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
			["일", "월", "화", "수", "목", "금", "토"],
			["일", "월", "화", "수", "목", "금", "토"],
			"오전",
			"오후",
			"-",
			":",
			0,
			"%Y년 %f월",
			"%f월 %e일",
			"%Y년 %f월 %e일 %A",
			"%Y-%m-%d",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%Y년 %f월 %e일 %A %p %l:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%p %l:%M:%S",
			"%p %l:%M");
		symbolNaN = "NaN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinity";
		symbolPosInf = "Infinity";
		number = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n", "n");
		currency = new hxculture.core.NumberInfo(0, ".", [3], ",", "-$n", "$n");
		percent = new hxculture.core.NumberInfo(2, ".", [3], ",", "-n %", "n %");
		englishCurrency = "Korean Won";
		nativeCurrency = "원";
		currencySymbol = "₩";
		currencyIso = "KRW";
		englishRegion = "Korea";
		nativeRegion = "대한민국";
		iso2Region = "KR";
		iso3Region = "KOR";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new KoKR();
}