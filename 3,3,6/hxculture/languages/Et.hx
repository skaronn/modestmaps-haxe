package hxculture.languages;

import hxculture.Language;

class Et extends Language {
	function new() {
		name = "et";
		english = "Estonian";
		native = "eesti";
		iso2 = "et";
		iso3 = "est";
		Language.add(this);
	}
	public static var language : Language = new Et();
}