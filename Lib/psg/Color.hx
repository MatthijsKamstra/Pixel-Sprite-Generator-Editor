
package psg;

class Color 
{

  public var r:Float;
  public var g:Float;
  public var b:Float;

  public function new(r_:Float, g_:Float, b_:Float):Void
  {
    r = r_;
    g = g_;
    b = b_;
  }


  /**
   * Update color with RGB values
   * @param r_ Red
   * @param g_ Green
   * @param b_ Blue
   */
  public function setRGB(r_:Float, g_:Float, b_:Float):Void
  {
    r = r_;
    g = g_;
    b = b_;
  }

  /**
   * Get RGB color
   * @return Int in format 0xRRGGBB
   */
  public function getRGB():Int
  {
    var rgb:Int;

    rgb = (Math.round(r*0xff) << 16) | (Math.round(g*0xff) << 8) | (Math.round(b*0xff));
    return rgb;
  }


  /**
   * Update color with HSL values
   * @param h Hue
   * @param s Saturation
   * @param l Light
   */
  public function setHSL(h:Float, s:Float, l:Float):Void
  {
    var i:Float;
    var f:Float;
    var p:Float;
    var q:Float;
    var t:Float;

    i = Math.floor(h * 6);
    f = h * 6 - i;
    p = l * (1 - s);
    q = l * (1 - f * s);
    t = l * (1 - (1 - f) * s);
    
    switch (i % 6) {
      case 0: r = l; g = t; b = p;
      case 1: r = q; g = l; b = p;
      case 2: r = p; g = l; b = t;
      case 3: r = p; g = q; b = l;
      case 4: r = t; g = p; b = l;
      case 5: r = l; g = p; b = q;
    }
  }

}
