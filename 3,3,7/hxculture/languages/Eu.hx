package hxculture.languages;

import hxculture.Language;

class Eu extends Language {
	function new() {
		name = "eu";
		english = "Basque";
		native = "euskara";
		iso2 = "eu";
		iso3 = "eus";
		Language.add(this);
	}
	public static var language : Language = new Eu();
}