package hxculture.languages;

import hxculture.Language;

class El extends Language {
	function new() {
		name = "el";
		english = "Greek";
		native = "ελληνικά";
		iso2 = "el";
		iso3 = "ell";
		Language.add(this);
	}
	public static var language : Language = new El();
}