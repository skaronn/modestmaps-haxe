package hxculture.languages;

import hxculture.Language;

class ZhHans extends Language {
	function new() {
		name = "zh-Hans";
		english = "Chinese (Simplified)";
		native = "中文(简体)";
		iso2 = "zh";
		iso3 = "zho";
		Language.add(this);
	}
	public static var language : Language = new ZhHans();
}