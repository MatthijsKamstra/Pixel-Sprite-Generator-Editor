
package util;

import sys.io.FileInput;

import sys.io.File;
import sys.FileSystem;

import haxe.io.Bytes;

class SaveImage 
{

	public static var DOCUMENTS 	: String = 'Documents';
	public static var DESKTOP 		: String = 'Desktop';
	public static var DOWNLOADS 	: String = 'Downloads';
	public static var PICTURES 		: String = 'Pictures';
	public static var SEPARATOR 	: String = '/';

	private var DEBUG : Bool = false;

	function new():Void {}

	function init():Void
	{
		#if (neko)
		var map = Sys.environment();
		for (key in map.keys()) {
	    	if(DEBUG)trace(key + " --> '" + map.get(key) + "'"); 
    	}
    	if(DEBUG){		
	    	trace( "Sys.executablePath(): " + Sys.executablePath() );
	    	trace( "Sys.getCwd(): " + Sys.getCwd() );
	    	trace( "Sys.systemName(): " + Sys.systemName() );
    	}

    	var home = Sys.getEnv('HOME'); // HOME --> '/Volumes/Data HD/Users/matthijs'



 		if(sys.FileSystem.exists(home + "/Desktop"))
 		{
 			var outputFile = (home + "/Desktop/_text.txt");
 			var fo: sys.io.FileOutput = sys.io.File.write(outputFile, false);
			fo.writeString("hello " + Date.now());
			fo.close();
		} else {
			trace("NO DESKTOP?");
		}

		#end


	}



	/**
	 * util.SaveImage.saveImage(bitmapdata, 'pictureName.png', Directory.Pictures, 'backup');
	 * 
	 * @param  image.display.BitmapData [description]
	 * @param  ?nameWithExtension       [description]
	 * @param  ?dir                     [description]
	 * @param  ?folderName              [description]
	 * @return                          [description]
	 */
 	static public function saveImage(image:openfl.display.BitmapData, ?nameWithExtension:String, ?dir:Directory, ?folderName:String):Void
	{
		if(dir == null) dir = Directory.Desktop;
		if(folderName == null) folderName = "_export";

		var _unique = Date.now().toString();
		if(nameWithExtension == null) {
			nameWithExtension = _unique + ".png";
		} else {
			if (nameWithExtension.indexOf('.') == -1){
				nameWithExtension += ".png";
			}
		}

		var home = Sys.getEnv('HOME'); // HOME --> '/Volumes/Data HD/Users/matthijs'	

		if(folderName != null) {			
			//first generate folders...
			if( !FileSystem.exists(home + SEPARATOR + dir + SEPARATOR + folderName) ) FileSystem.createDirectory ( home + SEPARATOR + dir + SEPARATOR + folderName);
		}

		var _extension : String = nameWithExtension.split(".")[1];
		switch (_extension.toLowerCase()) {
			case 'png': 	_extension = 'png';
			case 'jpg': 	_extension = 'jpg';
			case 'jpeg': 	_extension = 'jpg';
		}


 		if(sys.FileSystem.exists(home + SEPARATOR + dir + SEPARATOR + folderName))
 		{
 			var outputFile = (home + SEPARATOR + dir + SEPARATOR + folderName + SEPARATOR + nameWithExtension);

			var imageData:openfl.utils.ByteArray = image.encode(_extension, 1);
			var fo: sys.io.FileOutput = sys.io.File.write(outputFile, true);
			fo.writeBytes(imageData, 0, imageData.length);
			fo.close();
	
			trace( "save image done: " + outputFile );
	
		} else {
			trace( "## No $dir on this platform" );
		}
	}


	
	// function createImage(pw:Int, ph:Int, pPath:String, pColor:Int= 0xff3333, str:String = ''):Void
	// {
	// 	var canvas:nme.display.BitmapData = new nme.display.BitmapData(pw, ph, true, 0);
		
		
	// 	var container:nme.display.Sprite = new nme.display.Sprite();
		

	// 	var matrix = new nme.geom.Matrix();
	// 	// matrix.scale(bit.scaleX, bit.scaleY);


	// 	canvas.draw( container , matrix);
		

	// 	var error:String = null;
	// 	var outputFile = pPath;// 'bin/Assets/test.png';
	// 	try {
	// 		saveImage(canvas, outputFile);
	// 	} catch (e:Dynamic) {
	// 		error = "Error writing file " + outputFile + ": " + e;
	// 	}
	// 	if (error != null) throw error;
	// }
	

/*
	static public function saveImage(image:openfl.display.BitmapData, outputFile:String):Void
	{
		// first generate folders...
		if( !FileSystem.exists('_assets') ) FileSystem.createDirectory ('_assets');

		var imageData:openfl.utils.ByteArray = image.encode('png', 1);
		var fo: sys.io.FileOutput = sys.io.File.write(outputFile, true);
		fo.writeBytes(imageData, 0, imageData.length);
		fo.close();
		trace( "save id done: " + outputFile );
	}
	*/

}

enum Directory {
	Documents;
	Desktop;
	Downloads;
	Pictures;
}