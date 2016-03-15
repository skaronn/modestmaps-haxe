package hxculture.languages;

import hxculture.Language;

class Sr extends Language {
	function new() {
		name = "sr";
		english = "Serbian";
		native = "srpski";
		iso2 = "sr";
		iso3 = "srp";
		Language.add(this);
	}
	public static var language : Language = new Sr();
}