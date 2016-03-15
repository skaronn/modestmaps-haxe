package hxculture.languages;

import hxculture.Language;

class Gl extends Language {
	function new() {
		name = "gl";
		english = "Galician";
		native = "galego";
		iso2 = "gl";
		iso3 = "glg";
		Language.add(this);
	}
	public static var language : Language = new Gl();
}