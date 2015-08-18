package hxculture.languages;

import hxculture.Language;

class Da extends Language {
	function new() {
		name = "da";
		english = "Danish";
		native = "dansk";
		iso2 = "da";
		iso3 = "dan";
		Language.add(this);
	}
	public static var language : Language = new Da();
}