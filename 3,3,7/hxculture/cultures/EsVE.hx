package hxculture.cultures;

import hxculture.Culture;

class EsVE extends Culture {
	function new() {
		language = hxculture.languages.Es.language;
		name = "es-VE";
		english = "Spanish (Venezuela)";
		native = "Español (Republica Bolivariana de Venezuela)";
		date = new hxculture.core.DateTimeInfo(
			["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre", ""],
			["ene", "feb", "mar", "abr", "may", "jun", "jul", "ago", "sep", "oct", "nov", "dic", ""],
			["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"],
			["dom", "lun", "mar", "mié", "jue", "vie", "sáb"],
			["do", "lu", "ma", "mi", "ju", "vi", "sá"],
			"a.m.",
			"p.m.",
			"/",
			":",
			0,
			"%B de %Y",
			"%d %B",
			"%A, %d de %B de %Y",
			"%d/%m/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %d de %B de %Y %I:%M:%S %p",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%I:%M:%S %p",
			"%I:%M %p");
		symbolNaN = "NeuN";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinito";
		symbolPosInf = "Infinito";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "$ -n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n %", "n %");
		englishCurrency = "Venezuelan Bolivar";
		nativeCurrency = "Bolívar";
		currencySymbol = "Bs";
		currencyIso = "VEB";
		englishRegion = "Venezuela";
		nativeRegion = "Republica Bolivariana de Venezuela";
		iso2Region = "VE";
		iso3Region = "VEN";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new EsVE();
}