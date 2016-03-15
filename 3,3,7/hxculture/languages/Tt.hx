package hxculture.languages;

import hxculture.Language;

class Tt extends Language {
	function new() {
		name = "tt";
		english = "Tatar";
		native = "Татар";
		iso2 = "tt";
		iso3 = "tat";
		Language.add(this);
	}
	public static var language : Language = new Tt();
}