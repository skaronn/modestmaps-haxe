package hxculture.languages;

import hxculture.Language;

class He extends Language {
	function new() {
		name = "he";
		english = "Hebrew";
		native = "עברית";
		iso2 = "he";
		iso3 = "heb";
		Language.add(this);
	}
	public static var language : Language = new He();
}