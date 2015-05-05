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
		
		public function BaseComponent(object:GameObject = null) 
		{
			gameObject = object;
		}
		
		public function update():void
		{
		
		}
	}

}