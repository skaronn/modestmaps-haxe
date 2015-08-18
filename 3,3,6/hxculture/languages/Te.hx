package hxculture.languages;

import hxculture.Language;

class Te extends Language {
	function new() {
		name = "te";
		english = "Telugu";
		native = "తెలుగు";
		iso2 = "te";
		iso3 = "tel";
		Language.add(this);
	}
	public static var language : Language = new Te();
}