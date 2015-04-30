package 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class CBackground extends Drawable
	{
		public static const BACKGROUND_VSPEED:Number = 5;
		public static const BACKGROUND_TYPE_GROUND:uint = 0;
		public static const BACKGROUND_TYPE_WATER:uint = 1;
		
		public function CBackground() 
		{
			graphic = new MovieClip();
			super();
		}
		
		public override function init():void
		{
			graphic.mask = new graphics_bg_mask();
			
			ChangeBackgroundGraphic(0);
		}
		
		public override function move():void
		{
			graphic.y += BACKGROUND_VSPEED;
			
			if (graphic.y > (graphic.mask.height * 2.0)) {
				ChangeBackgroundGraphic(1);
			}
		}
		
		protected function ChangeBackgroundGraphic(bgType:uint):void
		{
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
			
			// TO-DO: ground transitions
			
			graphic.x = mainStage.stageWidth * 0.5;
			graphic.y = mainStage.stageHeight;
		}
	}
}