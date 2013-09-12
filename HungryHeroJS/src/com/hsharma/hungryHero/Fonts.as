/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.hsharma.hungryHero  
{
	import com.hsharma.hungryHero.customObjects.Font;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;

	/**
	 * This class embeds the bitmap fonts used in the game. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class Fonts
	{
		/**
		 *  Regular font used for UI.
		 */		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="flash.display.Bitmap")]
		[Embed(source="../../../../media/fonts/bitmap/fontRegular.png")]
		public static const Font_Regular:Class;
		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="XML")]
		[Embed(source="../../../../media/fonts/bitmap/fontRegular.fnt", mimeType="application/octet-stream")]
		public static const XML_Regular:Class;
		
		/**
		 * Font for score label. 
		 */		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="flash.display.Bitmap")]
		[Embed(source="../../../../media/fonts/bitmap/fontScoreLabel.png")]
		public static const Font_ScoreLabel:Class;
		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="XML")]
		[Embed(source="../../../../media/fonts/bitmap/fontScoreLabel.fnt", mimeType="application/octet-stream")]
		public static const XML_ScoreLabel:Class;
		
		/**
		 * Font for score value. 
		 */		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="flash.display.Bitmap")]
		[Embed(source="../../../../media/fonts/bitmap/fontScoreValue.png")]
		public static const Font_ScoreValue:Class;
		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="XML")]
		[Embed(source="../../../../media/fonts/bitmap/fontScoreValue.fnt", mimeType="application/octet-stream")]
		public static const XML_ScoreValue:Class;
		
		/**
		 * Font objects.
		 */
		private static var Regular:BitmapFont;
		private static var ScoreLabel:BitmapFont;
		private static var ScoreValue:BitmapFont;
		
		/**
		 * Returns the BitmapFont (texture + xml) instance's fontName property (there is only oneinstance per app).
		 * @return String 
		 */
		public static function getFont(_fontStyle:String):Font
		{
			if (Fonts[_fontStyle] == undefined)
			{
				var texture:Texture = Texture.fromBitmap(new Fonts["Font_" + _fontStyle]());
				var xml:XML = XML(new Fonts["XML_" + _fontStyle]());
				Fonts[_fontStyle] = new BitmapFont(texture, xml);
				TextField.registerBitmapFont(Fonts[_fontStyle]);
			}
// RANDORI BUG: .name should be .get_name()
			return new Font(Fonts[_fontStyle].name, Fonts[_fontStyle].size);
		}
	}
}
