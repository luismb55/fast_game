package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Drawable extends Sprite
	{
		private var posX:int;
		private var posY:int;
		
		private var direction:Point;
		
		private var graphic:MovieClip;
		
		public function Drawable()
		{
			
		}
		
		public function move():void
		{
			trace('moving drawable');
		}
	}

}