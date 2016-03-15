package hxculture.languages;

import hxculture.Language;

class Ja extends Language {
	function new() {
		name = "ja";
		english = "Japanese";
		native = "日本語";
		iso2 = "ja";
		iso3 = "jpn";
		Language.add(this);
	}
	public static var language : Language = new Ja();
}