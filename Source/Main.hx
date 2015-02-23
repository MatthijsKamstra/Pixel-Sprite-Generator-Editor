// package;


import openfl.display.Sprite;
import lets.easing.Cubic;

import openfl.display.*;
import openfl.events.MouseEvent;
import openfl.events.Event;

import openfl.Lib;

import openfl.display.StageAlign;
import openfl.display.StageScaleMode;


import model.constants.*;
import model.constants.ToolsConstant;

import com.bit101.components.*;

// import flash.desktop.Clipboard;
// import flash.desktop.ClipboardFormats;

class Main extends Sprite {
	
	private var _canvasContainer:Sprite = new Sprite();
	private var _menuContainer:Sprite = new Sprite();
	private var _previewContainer:Sprite = new Sprite();
	
	// private var nsInstance:NumericStepper;
	// private var nsDuration:NumericStepper;
	// private var comboBox0:ComboBox;
	// private var btn:PushButton;

/**
 *   *       colored         : true,   // boolean
  *       edgeBrightness  : 0.3,    // value from 0 to 1
  *       colorVariations : 0.2,    // value from 0 to 1
  *       brightnessNoise : 0.3,    // value from 0 to 1
  *       saturation      : 0.5     // value from 0 to 1
 */

	public var isColored:Bool = true;
	public var edgeBrightness:Float = 0.3;
	public var colorVariations:Float = 0.2;
	public var brightnessNoise:Float = 0.3;
	public var saturation:Float = 0.5;


	/**
 	*      -1 = Always border (black)
   	*       0 = Empty
   	*       1 = Randomly chosen Empty/Body
   	*       2 = Randomly chosen Border/Body
	*/


// private var spaceship:psg.Mask;
// private var humanoid:psg.Mask;
// private var dragon:psg.Mask;
// private var robot:psg.Mask;


	var spaceship = new psg.Mask([
	0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 1, 1,
	0, 0, 0, 0, 1,-1,
	0, 0, 0, 1, 1,-1,
	0, 0, 0, 1, 1,-1,
	0, 0, 1, 1, 1,-1,
	0, 1, 1, 1, 2, 2,
	0, 1, 1, 1, 2, 2,
	0, 1, 1, 1, 2, 2,
	0, 1, 1, 1, 1,-1,
	0, 0, 0, 1, 1, 1,
	0, 0, 0, 0, 0, 0
	], 6, 12, true, false);
	var humanoid = new psg.Mask([
	0, 0, 0, 0, 1, 1, 1, 1,
	0, 0, 0, 0, 1, 1, 2,-1,
	0, 0, 0, 0, 1, 1, 2,-1,
	0, 0, 0, 0, 0, 0, 2,-1,
	0, 0, 1, 1, 1, 1, 2,-1,
	0, 1, 1, 2, 2, 1, 2,-1,
	0, 0, 1, 1, 0, 1, 1, 2,
	0, 0, 0, 0, 1, 1, 1, 2,
	0, 0, 0, 0, 1, 1, 1, 2,
	0, 0, 0, 0, 1, 1, 0, 0,
	0, 0, 0, 1, 1, 1, 0, 0,
	0, 0, 0, 1, 2, 1, 0, 0,
	0, 0, 0, 1, 2, 1, 0, 0,
	0, 0, 0, 1, 2, 2, 0, 0
	], 8, 14, true, false);
	var dragon = new psg.Mask([
	0,0,0,0,0,0,0,0,0,0,0,0,
	0,0,0,0,1,1,1,1,0,0,0,0,
	0,0,0,1,1,2,2,1,1,0,0,0,
	0,0,1,1,1,2,2,1,1,1,0,0,
	0,0,0,0,1,1,1,1,1,1,1,0,
	0,0,0,0,0,0,1,1,1,1,1,0,
	0,0,0,0,0,0,1,1,1,1,1,0,
	0,0,0,0,1,1,1,1,1,1,1,0,
	0,0,1,1,1,1,1,1,1,1,0,0,
	0,0,0,1,1,1,1,1,1,0,0,0,
	0,0,0,0,1,1,1,1,0,0,0,0,
	0,0,0,0,0,0,0,0,0,0,0,0
	], 12, 12, false, false);
	var robot = new psg.Mask([
	0, 0, 0, 0,
	0, 1, 1, 1,
	0, 1, 2, 2,
	0, 0, 1, 2,
	0, 0, 0, 2,
	1, 1, 1, 2,
	0, 1, 1, 2,
	0, 0, 0, 2,
	0, 0, 0, 2,
	0, 1, 2, 2,
	1, 1, 0, 0
	], 4, 11, true, false);
	var custom = new psg.Mask([
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	], 15, 15, true, false);

	private var SPRITE_COUNT:Int = 10; 
	private var SPRITE_XMAX:Int = 700;
	private var SPRITE_SPACING:Int = 10;
	private var SPRITE_SCALE:Float = 3;

	public static var _currentColor:Int = -1;
	private var _currentMask:psg.Mask;
	private var sprite:psg.Sprite;
	private var _y:Int;
	private var _x:Int;

	private var _preSetArray : Array<Dynamic> ;


	
	private var _canvasWStepper : NumericStepper;
	private var _canvasHStepper : NumericStepper;
	private var _canvasMirrorXCheckbox : CheckBox;
	private var _canvasMirrorYCheckbox : CheckBox;
	private var _textArea : TextArea;
	private var _slider : HSlider;

	private var combobox : ComboBox;


	public function new () 
	{
		super ();
		initialize ();
		buildMenu();
		updateCanvas();
		updatePreview ();
		updateCurrentColor();
		copyData();
	}


	private function initialize():Void 
	{
		_preSetArray   = [
				{ label : 'custom', data : custom }, 
				{ label : 'humanoid', data : humanoid }, 
				{ label : 'spaceship', data : spaceship }, 
				{ label : 'dragon', data : dragon }, 
				{ label : 'robot', data : robot }
			];

		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.frameRate = 60;

		_currentMask = humanoid;

		this.addChild(_canvasContainer);
		this.addChild(_previewContainer);
		
		_menuContainer = new Sprite();
		_menuContainer.scaleX = _menuContainer.scaleY = 1.0;
		this.addChild(_menuContainer);

		var fps:FPSMeter = new FPSMeter(this, stage.stageWidth-100, 20);
	}

	// var _toolArray:Array<String> = ['pencil tool (p)', 'eraser tool (e)', 'zoom tool (z)', 'canvas tool (c)', 'flip horizontal', 'flip vertical'];

	function buildMenu():Void
	{
		Style.setStyle(Style.LIGHT);	

		var window:Window = new Window(_menuContainer, 10, 10, 'Tools');
		window.hasMinimizeButton = true;
		// window.hasCloseButton = true;


		var vbox1 = new VBox(window.content);

		var _groupName = 'toolsRadioBtn';

		var radioBtn  = new RadioButton(vbox1, 0, 0, ToolsConstant.PENCIL.description, true, radiobuttonHandler);
		radioBtn.groupName = _groupName;
		/*
		var radioBtn  = new RadioButton(vbox1, 0, 0, ToolsConstant.ERASER.description, false, radiobuttonHandler);
		radioBtn.groupName = _groupName;
		var radioBtn  = new RadioButton(vbox1, 0, 0, ToolsConstant.ZOOM.description, false, radiobuttonHandler);
		radioBtn.groupName = _groupName;
		*/


		var Label = new Label(vbox1, 0, 0, 'Zoom level canvas:');
		_slider = new com.bit101.components.HSlider(vbox1, 0,0, ZoomSliderHandler);
		_slider.setSliderParams(0.5, 3, 1);

		// [mck] doesn't fit, so leave it for now
		// var slider = new HUISlider(vbox1, 0, 0, Zoom level canvas:', ZoomSliderHandler);
		// slider.setSliderParams(0.5, 3, 1);

		// var btn = new PushButton(vbox1, 0, 0, ToolsConstant.PENCIL.description, pushbuttonHandler);
		// var btn = new PushButton(vbox1, 0, 0, ToolsConstant.ERASER.description, pushbuttonHandler);
		// var btn = new PushButton(vbox1, 0, 0, ToolsConstant.ZOOM.description, pushbuttonHandler);
		var btn = new PushButton(vbox1, 0, 0, ToolsConstant.REFRESH.description, pushbuttonHandler);
		// var btn = new PushButton(vbox1, 0, 0, ToolsConstant.COPY.description, pushbuttonHandler);
		var btn = new PushButton(vbox1, 0, 0, ToolsConstant.EXPORT.description, pushbuttonHandler);


		window.height = window.content.height + 20 + 20;



		var window4:Window = new Window(_menuContainer, 200, 10, 'Canvas');
		window4.hasMinimizeButton = true;
		// window.hasCloseButton = true;


		var vbox4 = new VBox(window4.content);

		// var _array = ['spaceship','humanoid','dragon','robot'];




		combobox = new ComboBox(vbox4, 0, 0, _preSetArray[1].label, _preSetArray );
		combobox.selectedIndex = 1;
		combobox.addEventListener(Event.SELECT, onComboBoxHandler);

		var Label = new Label(vbox4, 0, 0, 'canvas width');
		_canvasWStepper = new NumericStepper(vbox4, 0, 0, numStepperHandler);
		_canvasWStepper.value = _currentMask.width;
		_canvasWStepper.step = 1;

		var Label = new Label(vbox4, 0, 0, 'canvas height');
		_canvasHStepper = new NumericStepper(vbox4, 0, 0, numStepperHandler);
		_canvasHStepper.value = _currentMask.height;
		_canvasHStepper.step = 1;

		_canvasMirrorXCheckbox = new CheckBox(vbox4, 0, 0, ToolsConstant.FLIP_V.description, checkBoxHandler);
		_canvasMirrorXCheckbox.selected = _currentMask.mirrorX;
		_canvasMirrorYCheckbox = new CheckBox(vbox4, 0, 0, ToolsConstant.FLIP_H.description, checkBoxHandler);
		_canvasMirrorYCheckbox.selected = _currentMask.mirrorY;

		window4.height = window4.content.height + 20 + 20;



/**
 *    *      -1 = Always border (black)
   *       0 = Empty
   *       1 = Randomly chosen Empty/Body
   *       2 = Randomly chosen Border/Body
 */

		var window2:Window = new Window(_menuContainer, 10, 200, 'Color');
		window2.hasMinimizeButton = true;
		// window2.hasCloseButton = true;


		var hbox2 = new HBox(window2.content);
		var vbox2 = new VBox(hbox2);
		var vbox2b = new VBox(hbox2);

		var _groupName = 'colorRadioBtn';

		var radioBtn  = new RadioButton(vbox2, 0, 0, ColorConstant.BORDER.description, true, radiobuttonHandler);
		radioBtn.groupName = _groupName;
		var radioBtn  = new RadioButton(vbox2, 0, 0, ColorConstant.EMPTY.description, false, radiobuttonHandler);
		radioBtn.groupName = _groupName;
		var radioBtn  = new RadioButton(vbox2, 0, 0, ColorConstant.EMPTY_OR_BODY.description, false, radiobuttonHandler);
		radioBtn.groupName = _groupName;
		var radioBtn  = new RadioButton(vbox2, 0, 0, ColorConstant.BORDER_OR_BODY.description, false, radiobuttonHandler);
		radioBtn.groupName = _groupName;

		var _array = [ColorConstant.BORDER.color, ColorConstant.EMPTY.color, ColorConstant.EMPTY_OR_BODY.color, ColorConstant.BORDER_OR_BODY.color];

		var w = 10;
		var h = 10;
		for (i in 0..._array.length) {
			var shape = new Shape();
			shape.graphics.clear();
			shape.graphics.beginFill(_array[i], 1);
			shape.graphics.drawRect(0, 0, w, h);
			shape.graphics.endFill();
			vbox2b.addChild(shape);
		}
	
		window2.height = window2.content.height + 20 + 20;

	/**
 colored : true, // boolean
* edgeBrightness : 0.3, // value from 0 to 1
* colorVariations : 0.2, // value from 0 to 1
* brightnessNoise : 0.3, // value from 0 to 1
* saturation : 0.5 // value from 0 to 1
	 */
		


		var window3:Window = new Window(_menuContainer, 10, 350, 'Settings');
		window3.hasMinimizeButton = true;
		// window3.hasCloseButton = true;


		var vbox3 = new VBox(window3.content);


		var checkbox = new CheckBox(vbox3, 0, 0, SettingsConstant.COLORED.description, checkBoxHandler);
		checkbox.selected = isColored;

		var slider = new HUISlider(vbox3, 0, 0, SettingsConstant.EDGE_BRIGHTNESS.description, sliderHandler);
		slider.maximum = SettingsConstant.EDGE_BRIGHTNESS.maximum;
		slider.minimum = SettingsConstant.EDGE_BRIGHTNESS.minimum;
		slider.value = SettingsConstant.EDGE_BRIGHTNESS.value;
		slider.tick = SettingsConstant.EDGE_BRIGHTNESS.tick;

		var slider = new HUISlider(vbox3, 0, 0, SettingsConstant.VARIATION.description, sliderHandler);
		slider.maximum = SettingsConstant.VARIATION.maximum;
		slider.minimum = SettingsConstant.VARIATION.minimum;
		slider.value = SettingsConstant.VARIATION.value;
		slider.tick = SettingsConstant.VARIATION.tick;
		
		var slider = new HUISlider(vbox3, 0, 0, SettingsConstant.BRIGHTNESS.description, sliderHandler);
		slider.maximum = SettingsConstant.BRIGHTNESS.maximum;
		slider.minimum = SettingsConstant.BRIGHTNESS.minimum;
		slider.value = SettingsConstant.BRIGHTNESS.value;
		slider.tick = SettingsConstant.BRIGHTNESS.tick;
		
		var slider = new HUISlider(vbox3, 0, 0, SettingsConstant.SATURATION.description, sliderHandler);
		slider.maximum = SettingsConstant.SATURATION.maximum;
		slider.minimum = SettingsConstant.SATURATION.minimum;
		slider.value = SettingsConstant.SATURATION.value;
		slider.tick = SettingsConstant.SATURATION.tick;
		


		window3.height = window3.content.height + 20 + 20;
		window3.width = window3.content.width + 100;


		var window4:Window = new Window(_menuContainer, this.stage.stageWidth-210, 50, 'Export data');
		window4.hasMinimizeButton = true;	
		window4.width = 200;
		window4.height = 400;
		window4.minimized = true;


		var vbox4 = new VBox(window4.content);

		_textArea = new TextArea (vbox4, 0,0 , '');
		_textArea.width = 200;

		// var Label = new Label(vbox4, 0, 0, 'copy data');

		var btn = new PushButton(vbox4, 0, 0, "Refresh Data", pushbuttonHandler);

		window4.height = window3.content.height + 70;
	}

	// ____________________________________ update ____________________________________

	function updateCanvas():Void
	{
		// remove all childern
		while (_canvasContainer.numChildren > 0) {
			_canvasContainer.removeChildAt(0);
		}

		var canvasView = new view.CanvasView(_currentMask);
		canvasView.signal.add(onSignalHandler);
		_canvasContainer.addChild(canvasView);

		centerCanvas();
	}

	function centerCanvas():Void
	{
		_canvasContainer.x = Std.int ((this.stage.stageWidth - _canvasContainer.width )/2);
		_canvasContainer.y = Std.int ((this.stage.stageHeight - _canvasContainer.height )/2);
	}

	function updatePreview():Void
	{
		// remove all childern
		while (_previewContainer.numChildren > 0) {
			_previewContainer.removeChildAt(0);
		}


		for (i in 0...SPRITE_COUNT)
		{
			if (isColored)
				sprite = new psg.Sprite(_currentMask, true , edgeBrightness, colorVariations, brightnessNoise, saturation );
			else 
				sprite = new psg.Sprite(_currentMask, false );

			placeSprite( sprite , _previewContainer, i);
		}

		_previewContainer.x = Std.int (this.stage.stageWidth - _previewContainer.width - SPRITE_SPACING);
		_previewContainer.y = Std.int (this.stage.stageHeight - _previewContainer.height  - SPRITE_SPACING);
	}

	function updateCurrentColor():Void
	{
		// 
	}

	// ____________________________________ utils ____________________________________

	/**
	* Enlarges and places sprite to the view.
	* @return
	*/
	private function placeSprite( sprite:psg.Sprite , container:Sprite, xpos:Int):Void
	{
		sprite.bitmap.scaleX = SPRITE_SCALE;
		sprite.bitmap.scaleY = SPRITE_SCALE;

		sprite.bitmap.x = xpos * (sprite.bitmap.width + SPRITE_SPACING);

		container.addChild( sprite.bitmap );
	}

	function export():Void
	{
		trace( "export"  );
		sprite = new psg.Sprite(_currentMask, true , edgeBrightness, colorVariations, brightnessNoise, saturation );
		
		#if (neko)
		var _unique = Date.now().toString();
		util.SaveImage.saveImage(sprite.bitmap.bitmapData, null, util.SaveImage.Directory.Desktop,'_pixel-sprite-export');
		#end
	}

	function copyData():Void
	{
		var _str = "var custom = new psg.Mask("+ _currentMask + ");";
		_textArea.text = _str;

		trace( "\n----- Copy data:  ------\n" + _str + "\n-------------------");

		#if (flash)
		var clip = flash.desktop.Clipboard.generalClipboard;
		clip.clear();
		clip.setData( flash.desktop.ClipboardFormats.TEXT_FORMAT, _str);
		trace("Copied! in flash");
		#end
	}

	// ____________________________________ handlers ____________________________________
	
	function ZoomSliderHandler(e:Event):Void
	{
		_canvasContainer.scaleX = 
		_canvasContainer.scaleY = _slider.value; 
		centerCanvas();
	}

	private function onSignalHandler(mask:psg.Mask):Void 
	{ 
		_currentMask = mask;
		updatePreview();
	}

	function onComboBoxHandler(e:Event):Void{

		var combobox = cast (e.currentTarget, ComboBox);
		// trace(combobox.selectedIndex + " // " + _preSetArray[combobox.selectedIndex]);

		_currentMask = _preSetArray[combobox.selectedIndex].data;


		_canvasWStepper.value = _currentMask.width;
		_canvasHStepper.value = _currentMask.height;
		_canvasMirrorXCheckbox.selected = _currentMask.mirrorX;
		_canvasMirrorYCheckbox.selected = _currentMask.mirrorY;

		updateCanvas();
		updatePreview();
		copyData();
	}
	
	function numStepperHandler(e:Event):Void
	{
		if(combobox.selectedIndex != 0) combobox.selectedIndex = 0;
		// _canvasWStepper.value = _currentMask.width;
		// _canvasHStepper.value = _currentMask.height;

		var _arr = [];
		for (i in 0... (Std.int (_canvasWStepper.value) * Std.int (_canvasHStepper.value)) ) {
			_arr.push(0);
		}

		var _tempMask:psg.Mask = new psg.Mask(_arr,  Std.int (_canvasWStepper.value), Std.int (_canvasHStepper.value), _canvasMirrorXCheckbox.selected, _canvasMirrorYCheckbox.selected);
		_currentMask = _tempMask;

		updatePreview();
		updateCanvas();

	}

	function radiobuttonHandler(e:Event):Void
	{
		// trace(e.currentTarget);
		var component = cast (e.currentTarget, RadioButton);


		switch (component.label) {

			case 'black', "border (-1)" 			: _currentColor = -1; //trace ("black");
			case 'empty', "empty (0)" 				: _currentColor =  0; //trace ("empty");
			case 'empty/body', "empty/body (1)" 	: _currentColor =  1; //trace ("empty/body");
			case 'border/body', "border/body (2)" 	: _currentColor =  2; //trace ("border/body");

			case "eraser tool" : trace ("eraser tool");
			case "zoom tool" : trace ("zoom tool");
			case "pencil tool" : trace ("pencil tool");

			default : trace('case "' + component.label + '" : trace ("' + component.label + '");');
		}

		updateCurrentColor();

	}

	function sliderHandler(e:Event):Void
	{
		var component = cast (e.currentTarget, HUISlider);
		switch (component.label) {

			case 'edgeBrightness' 	: edgeBrightness = component.value;//  trace ("edgeBrightness");
			case 'colorVariations' 	: colorVariations = component.value; //trace ("colorVariations");
			case 'brightnessNoise' 	: brightnessNoise = component.value; //trace ("brightnessNoise");
			case 'saturation' 		: saturation = component.value; //trace ("saturation");

			default : trace('case "' + component.label + '" : trace ("' + component.label + '");');
		}

		updatePreview ();
	}

	function pushbuttonHandler(e:MouseEvent):Void
	{
		// trace(e.currentTarget);
		var btn = cast (e.currentTarget, PushButton);
	
		switch (btn.label) {

			case "refresh" 			: updatePreview() ; // trace ("refresh");
			case "copy array" 		: copyData();
			case "export" 			: export();
			case "Refresh Data" 	: copyData();

			default : trace('case "' + btn.label + '" : trace ("' + btn.label + '");');
		}

	}

	function checkBoxHandler(e:MouseEvent):Void
	{
		// trace(e.currentTarget);
		var checkbox = cast (e.currentTarget, CheckBox);
		switch (checkbox.label) 
		{
			case 'flip vertical' 	: _currentMask.mirrorX = checkbox.selected; updatePreview(); // trace ("flip vertical"); 
			case 'flip horizontal' 	: _currentMask.mirrorY = checkbox.selected; updatePreview(); // trace ("flip horizontal"); 
			case 'colored' 			: isColored = checkbox.selected; updatePreview(); // trace ("colored");

			default : trace('case "' + checkbox.label + '" : trace ("' + checkbox.label + '");');
		}

	}

	public function onClick(e:MouseEvent):Void 
	{
		trace("click");
	}
	public function onSelect(e:Event):Void 
	{
		// stopTweens();
		// _curTest = this.comboBox0.selectedItem.data;
		// _curTest = new GoTest();
	}
	public function onChange(e:Event):Void 
	{
		// trace("onChange");
		// stopTweens();
	}
	
		
}