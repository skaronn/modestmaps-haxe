package hxculture.languages;

import hxculture.Language;

class Bg extends Language {
	function new() {
		name = "bg";
		english = "Bulgarian";
		native = "български";
		iso2 = "bg";
		iso3 = "bul";
		Language.add(this);
	}
	public static var language : Language = new Bg();
}