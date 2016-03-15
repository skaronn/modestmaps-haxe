package hxculture.languages;

import hxculture.Language;

class Pa extends Language {
	function new() {
		name = "pa";
		english = "Punjabi";
		native = "ਪੰਜਾਬੀ";
		iso2 = "pa";
		iso3 = "pan";
		Language.add(this);
	}
	public static var language : Language = new Pa();
}