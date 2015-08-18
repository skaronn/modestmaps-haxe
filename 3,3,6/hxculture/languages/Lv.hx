package hxculture.languages;

import hxculture.Language;

class Lv extends Language {
	function new() {
		name = "lv";
		english = "Latvian";
		native = "latviešu";
		iso2 = "lv";
		iso3 = "lav";
		Language.add(this);
	}
	public static var language : Language = new Lv();
}