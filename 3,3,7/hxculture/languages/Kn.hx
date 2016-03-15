package hxculture.languages;

import hxculture.Language;

class Kn extends Language {
	function new() {
		name = "kn";
		english = "Kannada";
		native = "ಕನ್ನಡ";
		iso2 = "kn";
		iso3 = "kan";
		Language.add(this);
	}
	public static var language : Language = new Kn();
}