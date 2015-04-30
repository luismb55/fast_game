package 
{
	import flash.display.Stage;
	public class DrawableController
	{
		private var stage:Stage;
		private var drawables:Vector.<Drawable> = new Vector.<Drawable>();
		
		public function DrawableController(s:Stage) 
		{
			stage = s;
		}
		
		public function initAll():void
		{
			drawables.forEach(initDrawable);
		}
		
		public function moveAll():void
		{
			drawables.forEach(moveDrawable, null);
		}
		
		static protected function initDrawable(item:Drawable, index:int, vector:Vector.<Drawable>):void
		{
			item.init();
		}
		
		static protected function moveDrawable(item:Drawable, index:int, vector:Vector.<Drawable>):void
		{
			item.move();
		}
		
		public function addDrawable(d:Drawable):void
		{
			drawables.push(d);
			stage.addChild(d);
		}
	}
}