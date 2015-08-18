package hxculture.languages;

import hxculture.Language;

class Uk extends Language {
	function new() {
		name = "uk";
		english = "Ukrainian";
		native = "україньска";
		iso2 = "uk";
		iso3 = "ukr";
		Language.add(this);
	}
	public static var language : Language = new Uk();
}