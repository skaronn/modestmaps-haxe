package com.google.maps;

class CopyrightNotice 
{
	public function new(arg1:String, arg2:Array<Dynamic>)
	{
		super();
		this.prefix = arg1;
		this.copyrightTexts = arg2;
		return;
	}

	public function getTexts():Array<String>
	{
		return this.copyrightTexts;
	}

	public function getPrefix():String
	{
		return this.prefix;
	}

	public function toString():String
	{
		return this.prefix + " " + this.copyrightTexts.join(", ");
	}

	public static function fromObject(arg1:Dynamic):com.google.maps.CopyrightNotice
	{
		return new CopyrightNotice(arg1.getPrefix(), arg1.getTexts());
	}

	private var prefix:String;

	private var copyrightTexts:Array<String>;
}