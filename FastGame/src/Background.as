package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class Background extends Drawable
	{
		public static const BACKGROUND_VSPEED:Number = 5;
		
		protected static const BACKGROUND_ZONES:Dictionary = new Dictionary();
		{
			BACKGROUND_ZONES["GROUND_ZONE"] = graphics_bg_ground;
			BACKGROUND_ZONES["WATER_ZONE"] = graphics_bg_water;
		}
		
		protected var backgroundCanvas:MovieClip;
		protected var backgroundIndex:int;
		protected var backgroundSequence:Array;
		
		public function Background(s:Stage)
		{
			backgroundSequence = new Array();
			backgroundSequence.push(BACKGROUND_ZONES["GROUND_ZONE"]);
			backgroundSequence.push(BACKGROUND_ZONES["WATER_ZONE"]);

			backgroundIndex = 0;
			graphic = new MovieClip();
			
			backgroundCanvas = new backgroundSequence[backgroundIndex]();
			addChild(backgroundCanvas);
			
			super(s);
			
			init();
		}
		
		public override function init():void
		{
			backgroundCanvas.x = gameStage.stageWidth * 0.5;
			backgroundCanvas.y = gameStage.stageHeight;
		}
		
		public override function move():void
		{
			backgroundCanvas.y += BACKGROUND_VSPEED;
			
			if (backgroundCanvas.y > (gameStage.stageHeight * 2.0)) {
				ChangeBackgroundZone();
			}
		}
		
		protected function ChangeBackgroundZone():void
		{
			backgroundIndex++;
			
			if (backgroundIndex >= backgroundSequence.length) {
				backgroundIndex = 0;
			}
			
			removeChild(backgroundCanvas);
			backgroundCanvas = new backgroundSequence[backgroundIndex]();
			backgroundCanvas.x = gameStage.stageWidth * 0.5;
			backgroundCanvas.y = 0;
			addChild(backgroundCanvas);
			
			/*removeChild(graphic);
			
			switch(bgType) {
				case BACKGROUND_TYPE_GROUND:
					graphic = new graphics_bg_ground();
					break;
							
				case BACKGROUND_TYPE_WATER:
					graphic = new graphics_bg_water();
					break;
					
				default:
					graphic = new graphics_bg_ground();
			}
			
			addChild(graphic);
			
			// TO-DO: ground transitions
			
			*/
		}
	}
}
