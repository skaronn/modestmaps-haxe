package hxculture.cultures;

import hxculture.Culture;

class EsCL extends Culture {
	function new() {
		language = hxculture.languages.Es.language;
		name = "es-CL";
		english = "Spanish (Chile)";
		native = "Español (Chile)";
		date = new hxculture.core.DateTimeInfo(
			["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre", ""],
			["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic", ""],
			["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"],
			["dom", "lun", "mar", "mié", "jue", "vie", "sáb"],
			["do", "lu", "ma", "mi", "ju", "vi", "sá"],
			null,
			null,
			"-",
			":",
			0,
			"%B de %Y",
			"%d %B",
			"%A, %d de %B de %Y",
			"%d-%m-%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %d de %B de %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NeuN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinito";
		symbolPosInf = "Infinito";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-$ n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Chilean Peso";
		nativeCurrency = "Peso";
		currencySymbol = "$";
		currencyIso = "CLP";
		englishRegion = "Chile";
		nativeRegion = "Chile";
		iso2Region = "CL";
		iso3Region = "CHL";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EsCL();
}