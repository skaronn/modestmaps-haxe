package hxculture.languages;

import hxculture.Language;

class Dv extends Language {
	function new() {
		name = "dv";
		english = "Divehi";
		native = "ދިވެހިބަސް";
		iso2 = "dv";
		iso3 = "div";
		Language.add(this);
	}
	public static var language : Language = new Dv();
}