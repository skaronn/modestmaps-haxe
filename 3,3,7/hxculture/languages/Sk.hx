package hxculture.languages;

import hxculture.Language;

class Sk extends Language {
	function new() {
		name = "sk";
		english = "Slovak";
		native = "slovenčina";
		iso2 = "sk";
		iso3 = "slk";
		Language.add(this);
	}
	public static var language : Language = new Sk();
}