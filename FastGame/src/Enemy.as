package 
{
	import flash.display.Stage;
	
	public class Enemy extends Drawable
	{
		public function Enemy(x:int, s:Stage) 
		{
			super(s);
			position.x = x;
			position.y = 0;
			direction.y = 2;
		}

		public override function isActive():Boolean
		{
			return position.y < (gameStage.height + graphic.height);
		}
	}
}