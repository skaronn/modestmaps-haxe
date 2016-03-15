package hxculture.languages;

import hxculture.Language;

class Kk extends Language {
	function new() {
		name = "kk";
		english = "Kazakh";
		native = "Қазащb";
		iso2 = "kk";
		iso3 = "kaz";
		Language.add(this);
	}
	public static var language : Language = new Kk();
}