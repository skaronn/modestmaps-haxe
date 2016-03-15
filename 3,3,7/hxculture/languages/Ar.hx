package hxculture.languages;

import hxculture.Language;

class Ar extends Language {
	function new() {
		name = "ar";
		english = "Arabic";
		native = "العربية";
		iso2 = "ar";
		iso3 = "ara";
		Language.add(this);
	}
	public static var language : Language = new Ar();
}