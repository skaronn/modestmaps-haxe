package hxculture.languages;

import hxculture.Language;

class Hi extends Language {
	function new() {
		name = "hi";
		english = "Hindi";
		native = "हिंदी";
		iso2 = "hi";
		iso3 = "hin";
		Language.add(this);
	}
	public static var language : Language = new Hi();
}