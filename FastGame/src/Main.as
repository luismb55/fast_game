package
{
	import com.fivelephants.engine.GameApp;
	import com.fivelephants.engine.GameObject;
	import com.fivelephants.engine.GameScene;
	import com.fivelephants.engine.components.Animation;
	import com.fivelephants.engine.components.SpriteRenderer;
	import com.sibirjak.asdpc.treeview.TreeView;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import org.as3commons.collections.framework.IDataProvider;
	
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class Main extends Sprite 
	{
		protected static var _app:GameApp;

		protected var drawableController:DrawableController;
		protected var gameController:GameController;
		protected var player:Player;
		
		public function Main() 
		{	
			addEventListener(Event.ADDED_TO_STAGE, start, false, 0, true);
			
			return;
			
			drawableController = new DrawableController(stage);
			gameController = new GameController(stage, drawableController);

			init();
			
			test();
		}
		
		protected function start(e:Event):void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			GameApp.getInstance().init();
			
			addChild(GameApp.getInstance());
			
			// TEST
			var mainScene:GameScene = new GameScene();
			GameApp.getInstance().scene = mainScene;
			
			var enemy1:Enemy01 = new Enemy01();
			enemy1.transform.position.x = 50;
			enemy1.transform.position.y = 50;
			//bullet.addComponent(SpriteRenderer);
			//bullet.addComponent(SpriteRenderer);
			//bullet.addComponent(SpriteRenderer);
			enemy1.addComponent(EnemyBulletScript);
			
			enemy1.sendMessage("mutafakas", "hola");
			
			var enemy2:Enemy02 = new Enemy02();
			enemy2.transform.position.x = 300;
			enemy2.transform.position.y = 300;
			enemy2.transform.setParent(enemy1.transform);
			
			//enemy2.addComponent(EnemyBulletScript);
			
			//bullet.update();
			//bullet.removeComponent(SpriteRenderer);
			//bullet.removeComponent(SpriteRenderer);
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
		/*protected function onAddedToStage(e:Event):void
		{
			
			
			// TODO REMOVE this is a test
			var mainScene:GameScene = new GameScene();
			GameApp.scene = mainScene;
			
			var bullet:GameObject = new GameObject();
			
			var renderer:SpriteRenderer = new SpriteRenderer(bullet);
			renderer.sprite = new animation_enemy_bullet_idle();
			
			var bulletScript:EnemyBulletScript = new EnemyBulletScript();
			
			mainScene.addGameObject(bullet);
			bullet.addComponent(renderer);
			bullet.addScript(bulletScript);
			
			renderer.sprite = new animation_enemy_bullet_hit();
			
			//test();
			uitest();
		}*/
		
		// TODO REMOVE
		protected function test():void
		{
			var anim1:Animation = new Animation(stage, new animation_enemy_bullet_spawn(), false, false);
			var anim2:Animation = new Animation(stage, new animation_enemy_bullet_idle(), true, true);
			var anim3:Animation = new Animation(stage, new animation_enemy_bullet_hit(), false, false);
			
			anim1.x = 20;
			anim1.y = 20;
			
			anim2.x = 40;
			anim2.y = 40;
			
			anim3.x = 60;
			anim3.y = 60;
			
			//anim1["holaif"] = 1;
			Animation.prototype.hola = 2;
			anim1.hola = 4;
			//anim1.hola = 5;
			
			trace("enumerable",anim1.propertyIsEnumerable("hola"));
			
			for(var id:String in anim1) {
			  var value:Object = anim1[id];

			  trace(id + " = " + value);
			}
			
			trace("\n");
			
			for(var id2:String in anim2) {
			  var value2:Object = anim2[id2];

			  trace(id2 + " = " + value2);
			}
			
			stage.addChild(anim1);
			stage.addChild(anim2);
			stage.addChild(anim3);
		}
		
		public function uitest():void
		{
			var treeView : TreeView = new TreeView();
			treeView.setSize(440, 360);
			treeView.dataSource = stage;
			treeView.dataSourceAdapterFunction = getAdapter;
			treeView.expandNodeAt(0);
			addChild(treeView);
		}
		
		private function getAdapter(item : *) : IDataProvider {
			if (item is DisplayObjectContainer) {
				return new DOCAdapter(item);
			}
			return null;
		}
	}
	
}