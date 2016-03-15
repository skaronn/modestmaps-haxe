package com.modestmaps.extras;

import openfl.display.Bitmap;
import openfl.filters.GlowFilter;
import openfl.text.AntiAliasType;
import openfl.text.TextFormat;

import com.modestmaps.Map;
import com.modestmaps.events.MapEvent;

class VirtualEarthCopyright extends MapCopyright
{
	// required by MS to use Flash to show tiles
	[Embed(source='ve_logo.png')]
	public var VirtualEarthLogo:Type;	

	public var veLogo:Bitmap;

	public function new(map:Map, offsetX:Float=10, offsetY:Float=10)
	{	
		super(map, offsetX, offsetY);
		
		copyrightField.embedFonts = true;
		copyrightField.antiAliasType = AntiAliasType.ADVANCED;
		copyrightField.defaultTextFormat = new TextFormat("Helvetica", 10, 0x202020);
		copyrightField.wordWrap = false;
		copyrightField.selectable = false;
		copyrightField.htmlText = "Copyright goes here...";
		copyrightField.width = copyrightField.textWidth + 4;
		copyrightField.height = copyrightField.textHeight + 4;	
		copyrightField.x = map.getWidth() - this.offsetX - copyrightField.width;
		copyrightField.y = map.getHeight() - this.offsetY - copyrightField.height;
		copyrightField.filters = [new GlowFilter(0xffffff,0.5,4,4,4)];
		
		veLogo = new VirtualEarthLogo();
		addChild(veLogo);
		
		onMapResized(null);
	}

	override private function onMapResized(event:MapEvent):Void
	{
		copyrightField.x = map.getWidth() - this.offsetX - copyrightField.width;
		copyrightField.y = map.getHeight() - this.offsetY - copyrightField.height;
		veLogo.x = map.getWidth() - veLogo.width - 10;
		veLogo.y = copyrightField.y - veLogo.height - 10;
	}	
}