package
{
	import flash.display.Stage;
	import flash.geom.Point;
	
	public class PlayerBullet extends Bullet
	{
		
		public function PlayerBullet(s:Stage, player:Player)
		{
			graphic = new graphic_ship_bullet();
			super(s);
			position.copyFrom(player.getPosition())
			direction.x = player.getDirection().x;
			direction.y = -20;
		}
	
	}

}