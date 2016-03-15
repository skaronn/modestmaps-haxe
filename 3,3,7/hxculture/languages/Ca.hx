package hxculture.languages;

import hxculture.Language;

class Ca extends Language {
	function new() {
		name = "ca";
		english = "Catalan";
		native = "català";
		iso2 = "ca";
		iso3 = "cat";
		Language.add(this);
	}
	public static var language : Language = new Ca();
}