
package model.constants;

class SettingsConstant 
{

	public static var COLORED 			: TypeSetting = {description:'colored',minimum:0,maximum:0,value:0,tick:0};
	public static var EDGE_BRIGHTNESS 	: TypeSetting = {description:'edgeBrightness',minimum:0,maximum:1,value:0.3,tick:0.1};
	public static var VARIATION 		: TypeSetting = {description:'colorVariations',minimum:0,maximum:1,value:0.2,tick:0.1};
	public static var BRIGHTNESS 		: TypeSetting = {description:'brightnessNoise',minimum:0,maximum:1,value:0.3,tick:0.1};
	public static var SATURATION 		: TypeSetting = {description:'saturation',minimum:0,maximum:1,value:0.5,tick:0.1};
}

typedef TypeSetting = 
{
	var description:String;
	var minimum : Float;
	var maximum : Float;
	var value : Float;
	var tick: Float;
}