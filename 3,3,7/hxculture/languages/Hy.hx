package hxculture.languages;

import hxculture.Language;

class Hy extends Language {
	function new() {
		name = "hy";
		english = "Armenian";
		native = "Հայերեն";
		iso2 = "hy";
		iso3 = "hye";
		Language.add(this);
	}
	public static var language : Language = new Hy();
}