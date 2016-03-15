package hxculture.languages;

import hxculture.Language;

class Pl extends Language {
	function new() {
		name = "pl";
		english = "Polish";
		native = "polski";
		iso2 = "pl";
		iso3 = "pol";
		Language.add(this);
	}
	public static var language : Language = new Pl();
}