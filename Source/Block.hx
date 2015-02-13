
package ;

import openfl.display.Sprite;
import openfl.display.*;

import flash.events.MouseEvent;

import model.constants.ColorConstant;
import model.constants.BlockConstant;

class Block extends Sprite
{
	public var value(get_value, set_value):Int;
	private var _value:Int;
	
	function get_value():Int { return _value; }
	function set_value(value:Int):Int
	{
		_value = value;
		updateColor(_value);
		return _value;
	}

	public var id(get_id, set_id):Int;
	private var _id:Int = 0;
	
	function get_id():Int { return _id; }
	function set_id(value:Int):Int
	{
		return _id = value;
	}

	public var color(get_color, set_color):Int;
	private var _color:Int;
	
	function get_color():Int { return _color; }
	function set_color(value:Int):Int
	{
		_color = value;
		updateColor(_color);
		return _color;
	}


	var _bg = new Sprite();
	var _colorSprite = new Sprite();
	var w = BlockConstant.WIDTH-1;
	var h = BlockConstant.WIDTH-1;



	function new():Void
	{
		super();
		init();
	}

	function init():Void
	{

		// _bg.graphics.clear();
		// _bg.graphics.beginFill(0x000000, 1);
		// _bg.graphics.drawRect(0, 0, w, h);
		// _bg.graphics.endFill();
		// addChild(_bg);	


		_colorSprite.graphics.clear();
		_colorSprite.graphics.beginFill(0xff3333, 1);
		_colorSprite.graphics.drawRect(1, 1, w, h);
		_colorSprite.graphics.endFill();
		addChild(_colorSprite);	

		// _colorSprite.addEventListener(flash.events.MouseEvent.CLICK, onClickHandler);
		// _colorSprite.addEventListener(flash.events.MouseEvent.MOUSE_DOWN, onDownHandler);
	}

	function onClickHandler(e:MouseEvent):Void
	{
		updateColor(Main._currentColor);
	}

	function updateColor(value:Int):Void
	{
		var _clr : Int;
		switch (value) {
			case -1 	: _clr = ColorConstant.BLACK; 
			case 0 		: _clr = ColorConstant.WHITE; 
			case 1 		: _clr = ColorConstant.BLUE; 
			case 2 		: _clr = ColorConstant.GREEN; 
			default 	: _clr = 0x000000; 
		}

		_colorSprite.graphics.clear();
		_colorSprite.graphics.beginFill(_clr, 1);
		_colorSprite.graphics.drawRect(1, 1, w, h);
		_colorSprite.graphics.endFill();
	}
}