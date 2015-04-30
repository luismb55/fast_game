package
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class Main extends Sprite 
	{
		protected var drawableController:DrawableController;
		
		public function Main() 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// Adds the background object:
			drawableController = new DrawableController(stage);
			drawableController.addDrawable(new Background());
			drawableController.addDrawable(new Enemy(10));
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
		
		private function update(e:Event):void
		{
			drawableController.moveAll();
		}
	}
	
}