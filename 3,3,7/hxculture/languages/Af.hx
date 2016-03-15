package hxculture.languages;

import hxculture.Language;

class Af extends Language {
	function new() {
		name = "af";
		english = "Afrikaans";
		native = "Afrikaans";
		iso2 = "af";
		iso3 = "afr";
		Language.add(this);
	}
	public static var language : Language = new Af();
}