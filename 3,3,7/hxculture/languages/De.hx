package hxculture.languages;

import hxculture.Language;

class De extends Language {
	function new() {
		name = "de";
		english = "German";
		native = "Deutsch";
		iso2 = "de";
		iso3 = "deu";
		Language.add(this);
	}
	public static var language : Language = new De();
}