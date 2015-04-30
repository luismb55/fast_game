package
{
	import flash.display.Stage;
	import flash.events.Event;
	
	public class DrawableController
	{
		private var gameStage:Stage;
		private var drawables:Vector.<Drawable> = new Vector.<Drawable>();
		
		public function DrawableController(s:Stage)
		{
			gameStage = s;
			gameStage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		static private function countDrawables(v:Vector.<Drawable>, c:Class):int
		{
			var result:int = 0;
			for (var i:int = 0; i < v.length; i++)
			{
				if (v[i] is c)
				{
					result++;
				}
			}
			return result;
		}
		
		protected function countEnemies():int
		{
			return countDrawables(drawables, Enemy);
		}
		
		private function update(e:Event):void
		{
			if (countEnemies() < 6)
			{
				addDrawable(new Enemy0(drawables.length, gameStage));
			}
			drawables.forEach(function(x:Drawable, i:int, v:Vector.<Drawable>):void
				{
					x.move();
				});
		}
		
		public function addDrawable(d:Drawable):void
		{
			drawables.push(d);
			gameStage.addChild(d);
		}
		
		public function init():void
		{
			drawables.forEach(function(x:Drawable, i:int, v:Vector.<Drawable>):void
				{
					x.init();
				});
		}
	
	}
}