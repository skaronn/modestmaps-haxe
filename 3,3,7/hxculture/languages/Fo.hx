package hxculture.languages;

import hxculture.Language;

class Fo extends Language {
	function new() {
		name = "fo";
		english = "Faroese";
		native = "føroyskt";
		iso2 = "fo";
		iso3 = "fao";
		Language.add(this);
	}
	public static var language : Language = new Fo();
}