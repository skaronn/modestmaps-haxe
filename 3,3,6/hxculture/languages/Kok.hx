package hxculture.languages;

import hxculture.Language;

class Kok extends Language {
	function new() {
		name = "kok";
		english = "Konkani";
		native = "कोंकणी";
		iso2 = "kok";
		iso3 = "kok";
		Language.add(this);
	}
	public static var language : Language = new Kok();
}