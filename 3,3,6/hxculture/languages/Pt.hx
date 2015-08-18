package hxculture.languages;

import hxculture.Language;

class Pt extends Language {
	function new() {
		name = "pt";
		english = "Portuguese";
		native = "Português";
		iso2 = "pt";
		iso3 = "por";
		Language.add(this);
	}
	public static var language : Language = new Pt();
}