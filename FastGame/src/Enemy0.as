package
{
	import flash.display.Stage;
	
	public class Enemy0 extends Enemy
	{
		
		public function Enemy0(x:int, s:Stage)
		{
			graphic = new graphic_enemy_0();
			
			x *= (graphic.width * 1.5);
			x += graphic.width;
			
			super(x, s)
		}
	}

}