package
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Player extends Drawable
	{
		public function Player(s:Stage)
		{
			graphic = new graphic_ship();
			super(s);
			position.x = gameStage.stageWidth / 2;
			position.y = gameStage.stageHeight - graphic.height * 1.5;
		}
		
		public override function move():void
		{
			direction.x = (gameStage.mouseX - position.x) / 10;
			direction.y = (gameStage.mouseY - position.y) / 10;
			super.move();
		}
	}

}