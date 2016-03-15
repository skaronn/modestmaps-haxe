package hxculture.languages;

import hxculture.Language;

class Sl extends Language {
	function new() {
		name = "sl";
		english = "Slovenian";
		native = "slovenski";
		iso2 = "sl";
		iso3 = "slv";
		Language.add(this);
	}
	public static var language : Language = new Sl();
}