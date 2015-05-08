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
		
		public function getDirection():Point
		{
			return direction;
		}
		
		public function setDirection(x:int, y:int):void
		{
			setDirectionX(x);
			setDirectionY(y);
		}
		
		public function setDirectionX(x:int):void
		{
			direction.x = x;
		}
		
		public function setDirectionY(y:int):void
		{
			direction.y = y;
		}
		
		public function getPosition():Point
		{
			return position;
		}
		
		public function getStage():Stage
		{
			return gameStage;
		}
	}
}