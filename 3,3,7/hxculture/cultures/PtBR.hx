package hxculture.cultures;

import hxculture.Culture;

class PtBR extends Culture {
	function new() {
		language = hxculture.languages.Pt.language;
		name = "pt-BR";
		english = "Portuguese (Brazil)";
		native = "Português (Brasil)";
		date = new hxculture.core.DateTimeInfo(
			["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro", ""],
			["jan", "fev", "mar", "abr", "mai", "jun", "jul", "ago", "set", "out", "nov", "dez", ""],
			["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"],
			["dom", "seg", "ter", "qua", "qui", "sex", "sáb"],
			["dom", "seg", "ter", "qua", "qui", "sex", "sáb"],
			null,
			null,
			"/",
			":",
			0,
			"%B de %Y",
			"%d de %B",
			"%A, %e de %B de %Y",
			"%e/%f/%Y",
			"%a, %d %b %Y %H:%M:%S GMT",
			"%A, %e de %B de %Y %k:%M:%S",
			"%Y-%m-%d %H:%M:%SZ",
			"%Y-%m-%dT%H:%M:%S",
			"%k:%M:%S",
			"%k:%M");
		symbolNaN = "NaN (Não é um número)";
		symbolPercent = "%";
		symbolPermille = "‰";
		signNeg = "-";
		signPos = "+";
		symbolNegInf = "-Infinito";
		symbolPosInf = "+Infinito";
		number = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n", "n");
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-$ n", "$ n");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Real";
		nativeCurrency = "Real";
		currencySymbol = "R$";
		currencyIso = "BRL";
		englishRegion = "Brazil";
		nativeRegion = "Brasil";
		iso2Region = "BR";
		iso3Region = "BRA";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new PtBR();
}