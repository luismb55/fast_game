package
{
	import flash.display.Stage;
	import flash.geom.Point;
	
	public class EnemyBehavior1 implements EnemyBehavior
	{
		public static var speed:int = 6;
		
		public function move(enemy:Enemy):void
		{
			var enemyPosition:Point = enemy.getPosition();
			var player:Player = enemy.getPlayer();
			var playerPosition:Point;
			if (player == null)
			{
				var stage:Stage = enemy.getStage();
				playerPosition = new Point(stage.stageWidth / 2, stage.stageHeight * .7)
			}
			else
			{
				playerPosition = player.getPosition();
			}
			
			if (playerPosition.y > enemyPosition.y)
			{
				var x:int = speed * ((enemyPosition.x > playerPosition.x) ? -1 : 1);
				enemy.setDirection(x, speed);
			}
		}
	}

}