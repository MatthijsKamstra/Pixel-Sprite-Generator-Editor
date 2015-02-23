
package psg;

class Mask 
{

	public var data(get_data, set_data):Array<Int>;
	private var _data:Array<Int>;

	function get_data():Array<Int> { return _data; }
	function set_data(value:Array<Int>):Array<Int>
	{
		return _data = value;
	}

	public var width(get_width, set_width):Int;
	private var _width:Int;
	
	function get_width():Int { return _width; }
	function set_width(value:Int):Int
	{
		return _width = value;
	}

	public var height(get_height, set_height):Int;
	private var _height:Int;
	
	function get_height():Int { return _height; }
	function set_height(value:Int):Int
	{
		return _height = value;
	}

	public var mirrorX(get_mirrorX, set_mirrorX):Bool;
	private var _mirrorX:Bool;
	
	function get_mirrorX():Bool { return _mirrorX; }
	function set_mirrorX(value:Bool):Bool
	{
		return _mirrorX = value;
	}

	public var mirrorY(get_mirrorY, set_mirrorY):Bool;
	private var _mirrorY:Bool;
	
	function get_mirrorY():Bool { return _mirrorY; }
	function set_mirrorY(value:Bool):Bool
	{
		return _mirrorY = value;
	}

	// public var data:Array<Int>;
	// public var width:Int;
	// public var height:Int;
	// public var mirrorX:Bool;
	// public var mirrorY:Bool;

	/**
	*   The Mask class defines a 2D template form which sprites can be generated.
	*
	*   @class Mask
	*   @constructor
	*   @param {data} Integer array describing which parts of the sprite should be
	*   empty, body, and border. The mask only defines a semi-ridgid stucture
	*   which might not strictly be followed based on randomly generated numbers.
	*
	*      -1 = Always border (black)
	*       0 = Empty
	*       1 = Randomly chosen Empty/Body
	*       2 = Randomly chosen Border/Body
	*
	*   @param {width} Width of the mask data array
	*   @param {height} Height of the mask data array
	*   @param {mirrorX} A boolean describing whether the mask should be mirrored on the x axis
	*   @param {mirrorY} A boolean describing whether the mask should be mirrored on the y axis
	*/
	public function new(data_:Array<Int>, width_:Int, height_:Int, ?mirrorX_:Bool = true, ?mirrorY_:Bool = true):Void
	{
		data = data_;
		width = width_;
		height = height_;
		mirrorX = mirrorX_;
		mirrorY = mirrorY_;
	}

	function toString():String
	{
		var _str = '';
		_str += data + " , " + width + " , " +  height + " , " + mirrorX + " , " + mirrorY;
		return _str;
	}
}
