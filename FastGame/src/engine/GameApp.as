package engine 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class GameApp extends Sprite 
	{
		private static var _instance:GameApp;
		protected static var _scene:Scene;
		
		public function GameApp(){
			if(_instance){
				throw new Error("GameApp... use getInstance()");
			} 
			_instance = this;
		}

		public static function getInstance():GameApp{
			if(!_instance){
				new GameApp();
			} 
			return _instance;
		}
		
		public static function set scene(s:Scene):void
		{
			if (s == null)
				return;
				
			if (_scene != null && s != _scene && GameApp.getInstance().contains(_scene))
				GameApp.getInstance().removeChild(_scene);
				
			_scene = s;
			
			GameApp.getInstance().addChild(_scene);
		}
		
		public static function get scene():Scene
		{
			return _scene;
		}
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (child != _scene)
				return child;
			else
				return super.addChild(child);
		}
		
		public override function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			if (child != _scene)
				return child;
			else
				return super.addChildAt(child,index);
		}
	}

}