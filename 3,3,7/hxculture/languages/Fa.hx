package hxculture.languages;

import hxculture.Language;

class Fa extends Language {
	function new() {
		name = "fa";
		english = "Persian";
		native = "فارسى";
		iso2 = "fa";
		iso3 = "fas";
		Language.add(this);
	}
	public static var language : Language = new Fa();
}