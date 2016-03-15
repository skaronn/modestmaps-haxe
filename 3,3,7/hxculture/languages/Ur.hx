package hxculture.languages;

import hxculture.Language;

class Ur extends Language {
	function new() {
		name = "ur";
		english = "Urdu";
		native = "اُردو";
		iso2 = "ur";
		iso3 = "urd";
		Language.add(this);
	}
	public static var language : Language = new Ur();
}