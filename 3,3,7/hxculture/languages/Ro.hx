package hxculture.languages;

import hxculture.Language;

class Ro extends Language {
	function new() {
		name = "ro";
		english = "Romanian";
		native = "română";
		iso2 = "ro";
		iso3 = "ron";
		Language.add(this);
	}
	public static var language : Language = new Ro();
}