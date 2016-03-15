package hxculture.cultures;

import hxculture.Culture;

class IdID extends Culture {
	function new() {
		language = hxculture.languages.Id.language;
		name = "id-ID";
		english = "Indonesian (Indonesia)";
		native = "Bahasa Indonesia (Indonesia)";
		date = new hxculture.core.DateTimeInfo(
			["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "Nopember", "Desember", ""],
			["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agust", "Sep", "Okt", "Nop", "Des", ""],
			["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"],
			["Minggu", "Sen", "Sel", "Rabu", "Kamis", "Jumat", "Sabtu"],
			["M", "S", "S", "R", "K", "J", "S"],
			null,
			null,
			"/",
			":",
			1,
			"%B %Y",
			"%d %B",
			"%d %B %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%d %B %Y %k:%M:%S",
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
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(0, ",", [3], ".", "($n)", "$n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Indonesian Rupiah";
		nativeCurrency = "Rupiah";
		currencySymbol = "Rp";
		currencyIso = "IDR";
		englishRegion = "Indonesia";
		nativeRegion = "Indonesia";
		iso2Region = "ID";
		iso3Region = "IDN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new IdID();
}