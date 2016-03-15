package hxculture.languages;

import hxculture.Language;

class Ko extends Language {
	function new() {
		name = "ko";
		english = "Korean";
		native = "한국어";
		iso2 = "ko";
		iso3 = "kor";
		Language.add(this);
	}
	public static var language : Language = new Ko();
}