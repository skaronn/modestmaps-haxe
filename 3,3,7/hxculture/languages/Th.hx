package hxculture.languages;

import hxculture.Language;

class Th extends Language {
	function new() {
		name = "th";
		english = "Thai";
		native = "ไทย";
		iso2 = "th";
		iso3 = "tha";
		Language.add(this);
	}
	public static var language : Language = new Th();
}