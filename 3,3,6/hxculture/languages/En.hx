package hxculture.languages;

import hxculture.Language;

class En extends Language {
	function new() {
		name = "en";
		english = "English";
		native = "English";
		iso2 = "en";
		iso3 = "eng";
		Language.add(this);
	}
	public static var language : Language = new En();
}