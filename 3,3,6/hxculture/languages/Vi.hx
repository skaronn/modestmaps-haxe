package hxculture.languages;

import hxculture.Language;

class Vi extends Language {
	function new() {
		name = "vi";
		english = "Vietnamese";
		native = "Tiếng Việt";
		iso2 = "vi";
		iso3 = "vie";
		Language.add(this);
	}
	public static var language : Language = new Vi();
}