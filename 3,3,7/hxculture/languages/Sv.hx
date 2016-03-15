package hxculture.languages;

import hxculture.Language;

class Sv extends Language {
	function new() {
		name = "sv";
		english = "Swedish";
		native = "svenska";
		iso2 = "sv";
		iso3 = "swe";
		Language.add(this);
	}
	public static var language : Language = new Sv();
}