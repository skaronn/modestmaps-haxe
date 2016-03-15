package hxculture.languages;

import hxculture.Language;

class Syr extends Language {
	function new() {
		name = "syr";
		english = "Syriac";
		native = "ܣܘܪܝܝܐ";
		iso2 = "syr";
		iso3 = "syr";
		Language.add(this);
	}
	public static var language : Language = new Syr();
}