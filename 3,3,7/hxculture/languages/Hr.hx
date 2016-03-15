package hxculture.languages;

import hxculture.Language;

class Hr extends Language {
	function new() {
		name = "hr";
		english = "Croatian";
		native = "hrvatski";
		iso2 = "hr";
		iso3 = "hrv";
		Language.add(this);
	}
	public static var language : Language = new Hr();
}