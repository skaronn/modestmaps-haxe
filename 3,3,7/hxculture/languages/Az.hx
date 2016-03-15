package hxculture.languages;

import hxculture.Language;

class Az extends Language {
	function new() {
		name = "az";
		english = "Azeri";
		native = "Azərbaycan­ılı";
		iso2 = "az";
		iso3 = "aze";
		Language.add(this);
	}
	public static var language : Language = new Az();
}