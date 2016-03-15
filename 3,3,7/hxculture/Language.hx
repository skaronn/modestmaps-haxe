package hxculture;

class Language {
	public var name(default, null) : String;
	public var iso2(default, null) : String;
	public var iso3(default, null) : String;
	public var native(default, null) : String;
	public var english(default, null) : String;

	static var langs = new Map();
	public static function get(name : String) : Language {
		return langs.get(name);
	}

	public static function names() {
		return langs.keys();
	}

	public static function add(language : Language) {
		if(!langs.exists(language.iso2))
			langs.set(language.iso2, language);
	}
}