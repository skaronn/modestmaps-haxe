package hxculture.languages;

import hxculture.Language;

class Tr extends Language {
	function new() {
		name = "tr";
		english = "Turkish";
		native = "Türkçe";
		iso2 = "tr";
		iso3 = "tur";
		Language.add(this);
	}
	public static var language : Language = new Tr();
}