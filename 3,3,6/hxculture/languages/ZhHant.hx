package hxculture.languages;

import hxculture.Language;

class ZhHant extends Language {
	function new() {
		name = "zh-Hant";
		english = "Chinese (Traditional)";
		native = "中文(繁體)";
		iso2 = "zh";
		iso3 = "zho";
		Language.add(this);
	}
	public static var language : Language = new ZhHant();
}