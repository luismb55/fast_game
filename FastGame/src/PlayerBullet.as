package
{
	import flash.display.Stage;
	import flash.geom.Point;
	
	public class PlayerBullet extends Bullet
	{
		protected var player:Player;
		
		public function PlayerBullet(s:Stage)
		{
			graphic = new graphic_ship_bullet();
			super(s);
		}
		
		public function setPlayer(p:Player):void
		{
			this.player = p;
			position.copyFrom(player.getPosition());
			direction.x = player.getDirection().x;
			direction.y = -40;
		}
		
		public override function isActive():Boolean
		{
			return position.y > (0 - graphic.height);
		}
	
	}

}