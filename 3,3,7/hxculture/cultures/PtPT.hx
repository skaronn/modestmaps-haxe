package hxculture.cultures;

import hxculture.Culture;

class PtPT extends Culture {
	function new() {
		language = hxculture.languages.Pt.language;
		name = "pt-PT";
		english = "Portuguese (Portugal)";
		native = "português (Portugal)";
		date = new hxculture.core.DateTimeInfo(
			["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro", ""],
			["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez", ""],
			["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"],
			["dom", "seg", "ter", "qua", "qui", "sex", "sáb"],
			["dom", "seg", "ter", "qua", "qui", "sex", "sáb"],
			null,
			null,
			"-",
			":",
			1,
			"%B de %Y",
			"%e/%f",
			"%A, %e de %B de %Y",
			"%d-%m-%Y",
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
		currency = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n $", "n $");
		percent = new hxculture.core.NumberInfo(2, ",", [3], ".", "-n%", "n%");
		englishCurrency = "Euro";
		nativeCurrency = "euro";
		currencySymbol = "€";
		currencyIso = "EUR";
		englishRegion = "Portugal";
		nativeRegion = "Portugal";
		iso2Region = "PT";
		iso3Region = "PRT";
		isMetric = false;
		Culture.add(this);
	}
	public static var culture : Culture = new PtPT();
}