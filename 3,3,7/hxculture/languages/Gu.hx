package hxculture.languages;

import hxculture.Language;

class Gu extends Language {
	function new() {
		name = "gu";
		english = "Gujarati";
		native = "ગુજરાતી";
		iso2 = "gu";
		iso3 = "guj";
		Language.add(this);
	}
	public static var language : Language = new Gu();
}