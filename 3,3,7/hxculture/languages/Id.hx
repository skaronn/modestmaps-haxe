package hxculture.languages;

import hxculture.Language;

class Id extends Language {
	function new() {
		name = "id";
		english = "Indonesian";
		native = "Bahasa Indonesia";
		iso2 = "id";
		iso3 = "ind";
		Language.add(this);
	}
	public static var language : Language = new Id();
}