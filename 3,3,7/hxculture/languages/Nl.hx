package hxculture.languages;

import hxculture.Language;

class Nl extends Language {
	function new() {
		name = "nl";
		english = "Dutch";
		native = "Nederlands";
		iso2 = "nl";
		iso3 = "nld";
		Language.add(this);
	}
	public static var language : Language = new Nl();
}