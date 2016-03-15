package hxculture.languages;

import hxculture.Language;

class Be extends Language {
	function new() {
		name = "be";
		english = "Belarusian";
		native = "Беларускі";
		iso2 = "be";
		iso3 = "bel";
		Language.add(this);
	}
	public static var language : Language = new Be();
}