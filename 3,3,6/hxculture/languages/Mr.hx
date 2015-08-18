package hxculture.languages;

import hxculture.Language;

class Mr extends Language {
	function new() {
		name = "mr";
		english = "Marathi";
		native = "मराठी";
		iso2 = "mr";
		iso3 = "mar";
		Language.add(this);
	}
	public static var language : Language = new Mr();
}