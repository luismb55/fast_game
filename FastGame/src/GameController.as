package
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class GameController
	{
		
		private var stage:Stage;
		private var dc:DrawableController;
		private var player:Player;
		private var playerBullets:Vector.<PlayerBullet> = new Vector.<PlayerBullet>();
		
		public function GameController(s:Stage, dc:DrawableController)
		{
			this.stage = s;
			this.dc = dc;
			
			player = new Player(this.stage);
			
			this.dc.addDrawable(player);
			
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
		}
		
		protected function findUnusedBullet():PlayerBullet
		{
			
			for (var i:int = 0; i < playerBullets.length; i++)
			{
				if (!playerBullets[i].isActive())
				{
					trace("Reusing " + playerBullets[i] + " (" + (i + 1) + " of " + playerBullets.length + ")");
					playerBullets[i].resetPosition();
					return playerBullets[i];
				}
			}
			trace("Creating new PlayerBullet");
			var result:PlayerBullet = new PlayerBullet(this.stage, player);
			playerBullets.push(result);
			return result;
		}
		
		protected function onMouseClick(e:MouseEvent):void
		{
			var bullet:PlayerBullet = findUnusedBullet();
			dc.addDrawable(bullet);
		}
	}
}