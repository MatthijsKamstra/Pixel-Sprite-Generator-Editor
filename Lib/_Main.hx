/**
 * Pixel Sprite Generator v0.0.2
 *
 * This is a Haxe version of David Bollinger's pixelrobots and
 * pixelspaceships algorithm.
 *
 * More info:
 * http://www.davebollinger.com/works/pixelrobots/
 * http://www.davebollinger.com/works/pixelspaceships/
 *
 * Archived website (links above are down):
 * http://web.archive.org/web/20080228054405/http://www.davebollinger.com/works/pixelrobots/
 * http://web.archive.org/web/20080228054410/http://www.davebollinger.com/works/pixelspaceships/
 *
 */

package;

import openfl.text.TextField;


class Main extends openfl.display.Sprite {
  
  private var spaceship:psg.Mask;
  private var humanoid:psg.Mask;
  private var dragon:psg.Mask;
  private var robot:psg.Mask;

  private var SPRITE_COUNT:Int = 40; //116;
  private var SPRITE_XMAX:Int = 700;
  private var SPRITE_SPACING:Int = 10;
  private var SPRITE_SCALE:Float = 3;
  
  private var sprite:psg.Sprite;
  private var _y:Int;
  private var _x:Int;

  
  public function new () {
    
    super ();
    
    spaceship = new psg.Mask([
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

    humanoid = new psg.Mask([
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

    dragon = new psg.Mask([
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
                    
    robot = new psg.Mask([
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


    // removeChildren(0, numChildren);


    showExamples();
  }


  private function showExamples():Void
  {
    var i:Int = 0;
    _y = SPRITE_SPACING;
    _x = SPRITE_SPACING;
    
    // Example 1

    placeTextField( "Colored ship sprites");

    for (i in 0...SPRITE_COUNT)
    {
      sprite = new psg.Sprite(spaceship, true);
      placeSprite( sprite );
    }
    prepareForNextExample();


    // Example 2

    placeTextField( "Colored humanoids (with low saturation)");

    for (i in 0...SPRITE_COUNT)
    {
      sprite = new psg.Sprite(humanoid, true, null, null, null, 0.1);
      placeSprite( sprite );
    }
    prepareForNextExample();


    // Example 3

    placeTextField( "Colored ship sprites (with many color variations per ship)");

    for (i in 0...SPRITE_COUNT)
    {
      sprite = new psg.Sprite(spaceship, true, null, 0.9, null, 0.8);
      placeSprite( sprite );
    }
    prepareForNextExample();


    // Example 4

    placeTextField( "Colored dragon sprites");

    for (i in 0...SPRITE_COUNT)
    {
      sprite = new psg.Sprite(dragon, true);
      placeSprite( sprite );
    }
    prepareForNextExample();



    // Example 5

    placeTextField( "Black & white robot sprites");

    for (i in 0...SPRITE_COUNT)
    {
      sprite = new psg.Sprite(robot);
      placeSprite( sprite );
    }
    prepareForNextExample();


  }


  private function placeTextField( str:String ):Void
  {
    var text:TextField = new TextField();
    text.text = str;
    text.x = SPRITE_SPACING;
    text.y = _y;

    text.setTextFormat( new openfl.text.TextFormat("Arial", 16, 0x000000, true) );
    text.selectable = false;

    text.width = 600;
    text.height = 40;

    addChild(text);

    _y += 30;
  }

  /**
   * Enlarges and places sprite to the view.
   * @return
   */
  private function placeSprite( sprite:psg.Sprite ):Void
  {
    sprite.bitmap.scaleX = SPRITE_SCALE;
    sprite.bitmap.scaleY = SPRITE_SCALE;

    if( _x >= SPRITE_XMAX )
    {
      _x = SPRITE_SPACING;
      _y += Math.floor( sprite.bitmap.height + SPRITE_SPACING );
    }
    sprite.bitmap.x = _x;

    _x += Math.floor( (sprite.bitmap.width + SPRITE_SPACING) );

    sprite.bitmap.y = _y;

    addChild( sprite.bitmap );
  }


  private function prepareForNextExample():Void
  {
    _x = SPRITE_SPACING;
    _y += 50;
  }
  
  
}
