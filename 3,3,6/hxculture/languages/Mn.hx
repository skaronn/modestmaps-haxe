package hxculture.languages;

import hxculture.Language;

class Mn extends Language {
	function new() {
		name = "mn";
		english = "Mongolian";
		native = "Монгол хэл";
		iso2 = "mn";
		iso3 = "mon";
		Language.add(this);
	}
	public static var language : Language = new Mn();
}