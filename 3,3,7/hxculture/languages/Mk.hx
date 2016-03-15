package hxculture.languages;

import hxculture.Language;

class Mk extends Language {
	function new() {
		name = "mk";
		english = "Macedonian";
		native = "македонски јазик";
		iso2 = "mk";
		iso3 = "mkd";
		Language.add(this);
	}
	public static var language : Language = new Mk();
}