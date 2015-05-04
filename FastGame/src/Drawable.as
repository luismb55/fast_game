package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	
	public class Drawable extends Sprite
	{
		protected var position:Point = new Point(0, 0);
		protected var direction:Point = new Point(0, 0);
		protected var graphic:MovieClip;
		protected var gameStage:Stage;
		
		public function Drawable(s:Stage)
		{
			gameStage = s;
			addChild(graphic);
		}
		
		public function init():void
		{
			//trace('init drawable');
		}
		
		public function move():void
		{
			position.x += direction.x;
			position.y += direction.y;
			graphic.x = position.x;
			graphic.y = position.y;
		}
		
		public function isActive():Boolean
		{
			return true;
		}
	}
}