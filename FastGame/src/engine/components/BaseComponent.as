package engine.components 
{
	import engine.GameObject;
	/**
	 * ...
	 * @author ...
	 */
	public class BaseComponent 
	{
		protected var _name:String;
		public var gameObject:GameObject;
		
		public function BaseComponent(object:GameObject, name:String = "unnamed component") 
		{
			gameObject = object;
			_name = name;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		
	}

}