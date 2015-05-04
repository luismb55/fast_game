package
{
	import flash.display.Stage;
	import flash.geom.Point;
	
	public class PlayerBullet extends Bullet
	{
		protected var player:Player;
		private var frames:int = 0;
		private var time:Number;
		
		public function PlayerBullet(s:Stage, player:Player)
		{
			graphic = new graphic_ship_bullet();
			super(s);
			this.player = player;
			resetPosition();
		}
		
		public function resetPosition()
		{
			position.copyFrom(player.getPosition());
			direction.x = player.getDirection().x;
			direction.y = -20;
			frames = 0;
			time = (new Date()).time;
		}
		
		public override function isActive():Boolean
		{
			return position.y > (0 - graphic.height);
		}
		
		public override function move():void
		{
			frames++;
			trace(frames + ": " + ((new Date()).time - time) + " : " + position.toString() + direction.toString());
			super.move();
		}
	
	}

}