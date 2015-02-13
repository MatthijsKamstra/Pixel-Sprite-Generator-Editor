
package model.constants;

class ToolsConstant 
{

	public static var PENCIL 	: TypeTool  = {description:'pencil tool' , shortcut:"p"};
	public static var ERASER 	: TypeTool  = {description:'eraser tool' , shortcut:"e"};
	public static var ZOOM 		: TypeTool  = {description:'zoom tool' , shortcut:"z"};
	public static var CANVAS 	: TypeTool  = {description:'canvas tool' , shortcut:"c"};
	public static var FLIP_H 	: TypeTool  = {description:'flip horizontal' , shortcut:""};
	public static var FLIP_V 	: TypeTool  = {description:'flip vertical' , shortcut:""};
	

	public static var COPY 		: TypeTool  = {description:'copy array' , shortcut:""};
	public static var REFRESH 	: TypeTool  = {description:'refresh' , shortcut:""};
	public static var EXPORT 	: TypeTool  = {description:'export' , shortcut:""};


}

typedef TypeTool = 
{
	var shortcut:String;
	var description:String;
}