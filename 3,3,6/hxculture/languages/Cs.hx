package hxculture.languages;

import hxculture.Language;

class Cs extends Language {
	function new() {
		name = "cs";
		english = "Czech";
		native = "čeština";
		iso2 = "cs";
		iso3 = "ces";
		Language.add(this);
	}
	public static var language : Language = new Cs();
}