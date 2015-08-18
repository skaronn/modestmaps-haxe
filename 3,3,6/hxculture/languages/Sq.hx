package hxculture.languages;

import hxculture.Language;

class Sq extends Language {
	function new() {
		name = "sq";
		english = "Albanian";
		native = "shqipe";
		iso2 = "sq";
		iso3 = "sqi";
		Language.add(this);
	}
	public static var language : Language = new Sq();
}