package 
{
	import flash.display.Stage;
	import flash.events.Event;
	
	public class DrawableController
	{
		private var stage:Stage;
		private var drawables:Vector.<Drawable> = new Vector.<Drawable>();
		
		public function DrawableController(s:Stage)
		{
			stage = s;
			stage.addEventListener(Event.ENTER_FRAME, update);
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
			trace(countEnemies());
			if (countEnemies < 6)
			{
				addDrawable(new Enemy0(drawables.length, stage));
			}
			drawables.forEach(_moveDrawable, null);
		}
		
		static protected function _moveDrawable(item:Drawable, index:int, vector:Vector.<Drawable>):void
		{
			item.move();
		}
		
		public function addDrawable(d:Drawable):void
		{
			drawables.push(d);
			stage.addChild(d);
		}

public function initAll():void
		{
			drawables.forEach(initDrawable);
		}
static protected function initDrawable(item:Drawable, index:int, vector:Vector.<Drawable>):void
		{
			item.init();
		}
		
	}
}