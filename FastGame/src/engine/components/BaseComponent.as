package engine.components 
{
	import engine.game_objects.GameObject;
	import engine.interfaces.IUpdateable;

	/**
	 * ...
	 * @author ...
	 */
	public class BaseComponent implements IUpdateable
	{
		public var gameObject:GameObject;
		private var _enabled:Boolean = false;
		
		public function BaseComponent(object:GameObject = null) 
		{
			gameObject = object;
		}
		
		public function update():void
		{
		
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set enabled(e:Boolean):void
		{
			_enabled = e;
		}
	}

}