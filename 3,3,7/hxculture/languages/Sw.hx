package hxculture.languages;

import hxculture.Language;

class Sw extends Language {
	function new() {
		name = "sw";
		english = "Kiswahili";
		native = "Kiswahili";
		iso2 = "sw";
		iso3 = "swa";
		Language.add(this);
	}
	public static var language : Language = new Sw();
}