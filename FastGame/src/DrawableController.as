package 
{
	public class DrawableController
	{
		private var drawables:Vector.<Drawable> = new Vector.<Drawable>();
		
		public function DrawableController() 
		{
			
		}
		
		protected function moveAll():void
		{
			drawables.forEach(moveDrawable, null);
		}
		
		static protected function moveDrawable(d:Drawable):void
		{
			d.move();
		}
		
		public function addDrawable(d:Drawable)
		{
			drawables.push(d);
		}
	}
}