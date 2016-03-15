package hxculture.languages;

import hxculture.Language;

class Fr extends Language {
	function new() {
		name = "fr";
		english = "French";
		native = "français";
		iso2 = "fr";
		iso3 = "fra";
		Language.add(this);
	}
	public static var language : Language = new Fr();
}