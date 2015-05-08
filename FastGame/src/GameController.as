package
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import BackgroundSystem.Background;
	
	public class GameController
	{
		private var gameStage:Stage;
		private var drawableController:DrawableController;
		private var bgManager:Background;
		private var player:Player;
		private var playerBullets:DrawableManager;
		private var enemies:DrawableManager;
		private var frameCount:Number = 0;
		
		public function GameController(s:Stage, dc:DrawableController)
		{
			gameStage = s;
			drawableController = dc;
			
			bgManager = new Background(gameStage);
			player = new Player(gameStage);
			playerBullets = new DrawableManager(gameStage, PlayerBullet);
			enemies = new DrawableManager(gameStage, Enemy);
			
			drawableController.addDrawable(bgManager);
			drawableController.addDrawable(player);
			
			drawableController.init();
			
			gameStage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			gameStage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
		
		}
		
		protected function onEnterFrame(e:Event)
		{
			frameCount++;
			if (frameCount % 25 == 0)
			{
				addEnemy(new EnemyBehavior0());
			}
		}
		
		protected function addEnemy(b:EnemyBehavior):Enemy
		{
			var posX:int = (Math.random() * gameStage.width), gameStage;
			var e:Enemy = enemies.getOne() as Enemy;
			e.setBehavior(b);
			e.setPlayer(player);
			drawableController.addDrawable(e);
			return e;
		}
		
		protected function onMouseClick(e:MouseEvent):void
		{
			var bullet:PlayerBullet = playerBullets.getOne() as PlayerBullet;
			bullet.setPlayer(player);
			drawableController.addDrawable(bullet);
		}
	}

}