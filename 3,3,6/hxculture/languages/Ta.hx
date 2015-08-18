package hxculture.languages;

import hxculture.Language;

class Ta extends Language {
	function new() {
		name = "ta";
		english = "Tamil";
		native = "தமிழ்";
		iso2 = "ta";
		iso3 = "tam";
		Language.add(this);
	}
	public static var language : Language = new Ta();
}