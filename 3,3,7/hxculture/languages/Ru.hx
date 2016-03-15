package hxculture.languages;

import hxculture.Language;

class Ru extends Language {
	function new() {
		name = "ru";
		english = "Russian";
		native = "русский";
		iso2 = "ru";
		iso3 = "rus";
		Language.add(this);
	}
	public static var language : Language = new Ru();
}