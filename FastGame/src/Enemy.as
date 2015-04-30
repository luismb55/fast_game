package 
{
	public class Enemy extends Drawable
	{
		public function Enemy(x:int) 
		{
			posX = x;
			posY = 10;
			graphic = new AssetTestBackground();
			super();
		}
		
		 
		public override function move():void
		{
			posY += 1;
			
			graphic.x = posX;
			graphic.y = posY;
			
			trace(posX.toString() + ' x ' + posY.toString());
			
			super.move();
		}

	}
}