package hxculture.languages;

import hxculture.Language;

class Es extends Language {
	function new() {
		name = "es";
		english = "Spanish";
		native = "español";
		iso2 = "es";
		iso3 = "spa";
		Language.add(this);
	}
	public static var language : Language = new Es();
}