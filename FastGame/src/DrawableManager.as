package
{
	import flash.display.Stage;
	
	public class DrawableManager
	{
		private var gameStage:Stage;
		private var class_:Class;
		private var instances:Vector.<Drawable> = new Vector.<Drawable>;
		
		public function DrawableManager(s:Stage, c:Class)
		{
			gameStage = s;
			class_ = c;
		}
		
		public function getOne():Drawable
		{
			for (var i:int = 0; i < instances.length; i++)
			{
				if (!instances[i].isActive())
				{
					trace("Reusing " + instances[i] + " (" + (i + 1) + " of " + instances.length + ")");
					instances[i].init();
					return instances[i];
				}
			}
			trace("Creating new " + class_ + " with " + gameStage);
			var result:Drawable = new class_(gameStage) as Drawable;
			instances.push(result);
			return result;
		}
	
	}

}