
package view;

import openfl.display.Sprite;
import openfl.display.*;
import openfl.events.*;

import model.constants.*;

import msignal.Signal;

class CanvasView extends Sprite
{
	var _mask : psg.Mask;
	var _isDrag : Bool;
	var _container : Sprite;

		
	public var signal = new Signal1(psg.Mask);

	function new(mask:psg.Mask):Void
	{
		super();

		this._mask = mask;
		init(_mask);
	}

	function init(mask:psg.Mask):Void
	{
		var w = (mask.width * BlockConstant.WIDTH) + 1;
		var h = (mask.height * BlockConstant.WIDTH) + 1;
		var p = 10;

		var _bg = new Sprite();
		_bg.graphics.clear();
		_bg.graphics.beginFill(ColorConstant.CANVAS_BORDER, 1);
		_bg.graphics.drawRect(0, 0, w , h );
		_bg.graphics.endFill();
		this.addChild(_bg);




		_container = new Sprite();

		var counter = 0;
		for (j in 0...mask.height) 
		{
			for (i in 0...mask.width) 
			{
				var _block = new Block();
				_block.id = counter;
				_block.value = mask.data[counter];
				_block.x = i * BlockConstant.WIDTH;
				_block.y = j * BlockConstant.WIDTH;

				_block.mouseChildren = false;
				_block.mouseEnabled = false;

				_container.addChild(_block);
				
				counter++;
			}
		}

		this.addChild(_container);

		var _cover = new Sprite();
		_cover.graphics.clear();
		_cover.graphics.beginFill(ColorConstant.CANVAS_BORDER, 0);
		_cover.graphics.drawRect(-p, -p, w + (2*p), h + (2*p));
		_cover.graphics.endFill();
		this.addChild(_cover);

		_cover.addEventListener( MouseEvent.MOUSE_DOWN, onMouseDownHandler );
		_cover.addEventListener( MouseEvent.MOUSE_UP, onMouseUpHandler );
		// _cover.addEventListener( MouseEvent.MOUSE_OUT, onMouseOutHandler );
	}



	function hitTest(x:Int,y:Int):Void
	{
		var _colorArray = [];
		for (i in 0..._container.numChildren) {
			

			var block = cast(_container.getChildAt(i), Block);

			_colorArray.push(block.value);
			
			if((block.x < x) && ((block.x + BlockConstant.WIDTH) > x ) && (block.y < y) && ((block.y + BlockConstant.WIDTH) > y )){
				block.value = Main._currentColor;
			}
		}

		// trace( "_colorArray: " + _colorArray );

		_mask.data = _colorArray;

		// [mck] little to heavy for most targets
		// signal.dispatch(_mask);
		
	}
	
	// ____________________________________ handlers ____________________________________

	// function onMouseOutHandler(e:MouseEvent):Void
	// {
	// 	if(openfl.Lib.current.stage.hasEventListener(MouseEvent.MOUSE_MOVE)) 
	// 		openfl.Lib.current.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
	// }

	function onMouseDownHandler(e:MouseEvent):Void
	{
		_isDrag = true;
		openfl.Lib.current.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
		// openfl.Lib.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
	}
	
	function onMouseUpHandler (e:MouseEvent):Void
	{
		_isDrag = false;
		hitTest(Std.int (e.localX),Std.int (e.localY));
		openfl.Lib.current.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
		signal.dispatch(_mask);
	}

	function onMouseMoveHandler (e:MouseEvent):Void
	{
		hitTest(Std.int (e.localX),Std.int (e.localY));
	}
}