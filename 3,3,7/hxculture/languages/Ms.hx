package hxculture.languages;

import hxculture.Language;

class Ms extends Language {
	function new() {
		name = "ms";
		english = "Malay";
		native = "Bahasa Malaysia";
		iso2 = "ms";
		iso3 = "msa";
		Language.add(this);
	}
	public static var language : Language = new Ms();
}