package
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class GameController
	{
		private var gameStage:Stage;
		private var drawableController:DrawableController;
		private var bgManager:BackgroundManager;
		private var player:Player;
		private var playerBullets:DrawableManager = new DrawableManager(gameStage, PlayerBullet);
		
		public function GameController(s:Stage, dc:DrawableController)
		{
			gameStage = s;
			drawableController = dc;

			bgManager = new BackgroundManager(gameStage);
			player = new Player(gameStage);
			
			drawableController.addDrawable(bgManager);
			drawableController.addDrawable(player);
			
			drawableController.init();
			
			gameStage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
		}

		protected function onMouseClick(e:MouseEvent):void
		{
			var bullet:PlayerBullet = playerBullets.getOne() as PlayerBullet;
			bullet.setPlayer(player);
			drawableController.addDrawable(bullet);
		}
	}

}