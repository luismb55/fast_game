package
{
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class CBackground extends Drawable
	{
		protected static const BACKGROUND_PIECE_SPEED:Number = 5;
		
		public function CBackground(s:Stage)
		{
			graphic = new graphics_bg_ground();
			super(s);
		}
		
		public override function init():void
		{
			graphic.x = (stage.width - graphic.width) * 0.5;
			graphic.y = (stage.height - graphic.height) * 0.5;
		}
		
		public override function move():void
		{
			graphic.y += BACKGROUND_PIECE_SPEED;
			
			if (graphic.y > (mainStage.stageHeight * 2.0))
			{
				trace("HEY!!");
			}
		}
	}
}