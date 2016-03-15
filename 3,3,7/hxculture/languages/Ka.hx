package hxculture.languages;

import hxculture.Language;

class Ka extends Language {
	function new() {
		name = "ka";
		english = "Georgian";
		native = "ქართული";
		iso2 = "ka";
		iso3 = "kat";
		Language.add(this);
	}
	public static var language : Language = new Ka();
}