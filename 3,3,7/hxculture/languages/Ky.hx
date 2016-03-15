package hxculture.languages;

import hxculture.Language;

class Ky extends Language {
	function new() {
		name = "ky";
		english = "Kyrgyz";
		native = "Кыргыз";
		iso2 = "ky";
		iso3 = "kir";
		Language.add(this);
	}
	public static var language : Language = new Ky();
}