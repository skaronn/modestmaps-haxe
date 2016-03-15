package hxculture.languages;

import hxculture.Language;

class Sa extends Language {
	function new() {
		name = "sa";
		english = "Sanskrit";
		native = "संस्कृत";
		iso2 = "sa";
		iso3 = "san";
		Language.add(this);
	}
	public static var language : Language = new Sa();
}