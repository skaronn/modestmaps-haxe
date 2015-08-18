package hxculture.languages;

import hxculture.Language;

class It extends Language {
	function new() {
		name = "it";
		english = "Italian";
		native = "italiano";
		iso2 = "it";
		iso3 = "ita";
		Language.add(this);
	}
	public static var language : Language = new It();
}