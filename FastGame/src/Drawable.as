package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Drawable extends Sprite
	{
		protected var posX:int;
		protected var posY:int;
		
		protected var direction:Point;
		
		protected var graphic:MovieClip;
		
		public function Drawable()
		{
			
		}
		
		public function move():void
		{
			trace('moving drawable');
		}
	}

}