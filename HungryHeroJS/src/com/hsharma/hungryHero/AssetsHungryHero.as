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
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * This class holds all embedded textures, fonts and sounds and other embedded files.  
	 * By using static access methods, only one instance of the asset file is instantiated. This 
	 * means that all Image types that use the same bitmap will use the same Texture on the video card.
	 * 
	 * @author hsharma
	 * 
	 */
	public class AssetsHungryHero
	{
		/**
		 * Texture Atlas 
		 */
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="flash.display.Bitmap")]
		[Embed(source="../../../../media/graphics/mySpritesheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="XML")]
		[Embed(source="../../../../media/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		/**
		 * Background Assets 
		 */
		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="flash.display.Bitmap")]
		[Embed(source="../../../../media/graphics/bgLayer1.jpg")]
		public static const BgLayer1:Class;
		
		[Factory(factoryClass="flash.utils.FlashEmbed.getEmbed",type="flash.display.Bitmap")]
		[Embed(source="../../../../media/graphics/bgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		/**
		 * Texture Cache 
		 */
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		/**
		 * Returns the Texture atlas instance.
		 * @return the TextureAtlas instance (there is only oneinstance per app)
		 */
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas=new TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlas;
		}
		
		/**
		 * Returns a texture from this class based on a string key.
		 * 
		 * @param name A key that matches a static constant of Bitmap type.
		 * @return a starling texture.
		 */
		public static function getTexture(name:String):Texture
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new AssetsHungryHero[name]();
				gameTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
	}
}
