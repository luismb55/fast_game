package
{
	import flash.display.Stage;
	
	public class Enemy extends Drawable
	{
		protected var player:Player;
		protected var behavior:EnemyBehavior;
		
		public final function Enemy(s:Stage)
		{
			graphic = new graphic_enemy_0();
			super(s);
			position.x = Math.random() * gameStage.stageWidth - graphic.width * 1.5;
			position.x += graphic.width * .7;
		}
		
		public override function isActive():Boolean
		{
			return position.y < (gameStage.stageHeight + graphic.height);
		}
		
		public function getPlayer():Player
		{
			return player;
		}
		
		public function setPlayer(p:Player):void
		{
			position.y = -graphic.height;
			player = p;
		}
		
		public function getBehavior():EnemyBehavior
		{
			return behavior;
		}
		
		public function setBehavior(b:EnemyBehavior):void
		{
			behavior = b;
			trace(this + " changed behavior to " + behavior);
		}
		
		public override function move():void
		{
			if (behavior)
			{
				behavior.move(this);
			}
			else
			{
				trace("Enemy without behavior can't move");
			}
			super.move();
		}
	}
}