package hxculture.languages;

import hxculture.Language;

class Lt extends Language {
	function new() {
		name = "lt";
		english = "Lithuanian";
		native = "lietuvių";
		iso2 = "lt";
		iso3 = "lit";
		Language.add(this);
	}
	public static var language : Language = new Lt();
}