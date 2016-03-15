package hxculture.languages;

import hxculture.Language;

class No extends Language {
	function new() {
		name = "no";
		english = "Norwegian";
		native = "norsk";
		iso2 = "no";
		iso3 = "nor";
		Language.add(this);
	}
	public static var language : Language = new No();
}