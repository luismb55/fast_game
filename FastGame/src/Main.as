package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import Utils.DynamicProperty;
	import Utils.Enum;
	
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class Main extends Sprite 
	{
		protected var drawableController:DrawableController;
		protected var gameController:GameController;
		protected var player:Player; // no se usa?
		
		public function Main() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			drawableController = new DrawableController(stage);
			gameController = new GameController(stage, drawableController);

			init();
			
			var enum:Enum = new Enum("HOLA", "QUE", "TAL");
			//trace((enum["HOLA"] as DynamicProperty).value);
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
	}
	
}