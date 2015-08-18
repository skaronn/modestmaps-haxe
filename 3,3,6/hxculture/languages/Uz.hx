package hxculture.languages;

import hxculture.Language;

class Uz extends Language {
	function new() {
		name = "uz";
		english = "Uzbek";
		native = "U'zbek";
		iso2 = "uz";
		iso3 = "uzb";
		Language.add(this);
	}
	public static var language : Language = new Uz();
}