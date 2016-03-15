package hxculture.languages;

import hxculture.Language;

class Is extends Language {
	function new() {
		name = "is";
		english = "Icelandic";
		native = "íslenska";
		iso2 = "is";
		iso3 = "isl";
		Language.add(this);
	}
	public static var language : Language = new Is();
}