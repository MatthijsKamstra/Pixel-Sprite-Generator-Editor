
package util;

import sys.io.FileInput;

import sys.io.File;
import sys.FileSystem;

import haxe.io.Bytes;

class SaveImage 
{

	function new():Void
	{



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
	

	/**
	 * util.SaveImage.saveImage(bitmapdata, '_assets');
	 * 
	 * @param  image.display.BitmapData [description]
	 * @param  outputFile               [description]
	 * @return                          [description]
	 */
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

}