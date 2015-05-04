package
{
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	public class GameController
	{
		
		private var stage:Stage;
		private var dc:DrawableController;
		private var bgManager:BackgroundManager;
		private var player:Player;
		
		public function GameController(s:Stage, dc:DrawableController)
		{
			this.stage = s;
			this.dc = dc;

			bgManager = new BackgroundManager(stage);
			player = new Player(this.stage);
			
			this.dc.addDrawable(bgManager);
			this.dc.addDrawable(player);
			
			this.dc.init();
			
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClick);
		}
		
		protected function onMouseClick(e:MouseEvent):void
		{
			var bullet:PlayerBullet = new PlayerBullet(this.stage, player);
			dc.addDrawable(bullet);
		}
		
	}

}