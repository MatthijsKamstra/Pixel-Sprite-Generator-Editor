
package model.constants;

class ColorConstant 
{

	public static var WHITE  			: Int = 0xecf0f1;
	public static var BLACK  			: Int = 0x2c3e50;
	public static var BLUE  			: Int = 0x2980b9;
	public static var GREEN  			: Int = 0x27ae60;
	

	public static var CANVAS_BORDER  			: Int = 0xbdc3c7; // silver gray



	public static var BORDER 			: TypeColor = {value:-1 , description:"border (-1)" , color: ColorConstant.BLACK}; // (black)
	public static var EMPTY 			: TypeColor = {value:0  , description:"empty (0)" , color: ColorConstant.WHITE}; //  (empty)
	public static var EMPTY_OR_BODY 	: TypeColor = {value:1  , description:"empty/body (1)" , color: ColorConstant.BLUE}; //  (empty/body)
	public static var BORDER_OR_BODY 	: TypeColor = {value:2  , description:"border/body (2)" , color: ColorConstant.GREEN}; //  (border/body)





	public static function getColor(id:Int):Int
	{

		var _color : Int = ColorConstant.WHITE;
		switch (id) {
			case -1 	: _color = ColorConstant.BLACK; 
			case 0 		: _color = ColorConstant.WHITE; 
			case 1 		: _color = ColorConstant.BLUE; 
			case 2 		: _color = ColorConstant.GREEN; 
			default : ColorConstant.WHITE;
		}
		return _color;
	}

}

typedef TypeColor = {
	var value : Int;
	var description : String;
	@:optional var color : Int;
}