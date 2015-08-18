package hxculture.languages;

import hxculture.Language;

class Fi extends Language {
	function new() {
		name = "fi";
		english = "Finnish";
		native = "suomi";
		iso2 = "fi";
		iso3 = "fin";
		Language.add(this);
	}
	public static var language : Language = new Fi();
}