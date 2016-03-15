package hxculture.languages;

import hxculture.Language;

class Hu extends Language {
	function new() {
		name = "hu";
		english = "Hungarian";
		native = "magyar";
		iso2 = "hu";
		iso3 = "hun";
		Language.add(this);
	}
	public static var language : Language = new Hu();
}