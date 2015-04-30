package 
{
	import flash.display.Stage;
	
	public class Enemy extends Drawable
	{
		public function Enemy(x:int, s:Stage) 
		{
			super();
			position.x = x;
			position.y = 0;
			direction.y = 2;
		}
	}
}