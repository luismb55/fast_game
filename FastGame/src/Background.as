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
		
		protected var backgroundSequence:Array;
		protected var backgroundSequenceIndex:int;
		
		private var vMovement:Number;
		
		public function Background(s:Stage)
		{
			backgroundSequence = new Array();
			backgroundSequence.push(BACKGROUND_ZONES["GROUND_ZONE"]);
			backgroundSequence.push(BACKGROUND_ZONES["WATER_ZONE"]);

			backgroundSequenceIndex = 0;
			vMovement = 0.0;
			
			graphic = new MovieClip();
			
			super(s);
			
			init();
		}
		
		public override function init():void
		{
			graphic.addChild(new backgroundSequence[backgroundSequenceIndex]());
			graphic.getChildAt(0).x = gameStage.stageWidth * 0.5;
			graphic.getChildAt(0).y = gameStage.stageHeight;
		}
		
		public override function move():void
		{
			var numTiles:int = graphic.numChildren;
			
			if (numTiles >= 1) graphic.getChildAt(0).y += BACKGROUND_VSPEED;
			if (numTiles == 2) graphic.getChildAt(1).y += BACKGROUND_VSPEED;
			
			if (numTiles == 1) {
				if (graphic.getChildAt(0).y > (gameStage.stageHeight * 2.0)) {
					IncrementBackgroundIndex();
					AddNextBackgroundTile();
				}
			} else if (numTiles == 2) {
				if (graphic.getChildAt(1).y > gameStage.stageHeight) {
					IncrementBackgroundIndex();
					RemovePreviousBackgroundTile();
					AddNextBackgroundTile();
				}
			}
		}
		
		protected function IncrementBackgroundIndex():void
		{
			backgroundSequenceIndex++;
			
			if (backgroundSequenceIndex >= backgroundSequence.length) {
				backgroundSequenceIndex = 0;
			}
		}
		
		protected function AddNextBackgroundTile():void
		{
			graphic.addChild(new backgroundSequence[backgroundSequenceIndex]());
			graphic.getChildAt(1).x = gameStage.stageWidth * 0.5;
			graphic.getChildAt(1).y = 0.0;
		}
		
		protected function RemovePreviousBackgroundTile():void
		{
			if (graphic.numChildren == 2) {
				graphic.removeChildAt(0);
			}
		}
		
		protected function ChangeBackground():void
		{
			if (backgroundSequenceIndex >= backgroundSequence.length) {
				backgroundSequenceIndex = 0;
			}

			/*if(graphic.numChildren == 2) {
				graphic.getChildAt(1).x = gameStage.stageWidth * 0.5;
				graphic.getChildAt(1).y = 0;
			}*/
			
			backgroundSequenceIndex++;
			
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
