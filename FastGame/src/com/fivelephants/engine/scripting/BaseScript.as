package com.fivelephants.engine.scripting 
{
	import com.fivelephants.engine.GameObject;
	import com.fivelephants.engine.interfaces.IUpdateable;

	/**
	 * ...
	 * @author ...
	 */
	public class BaseScript implements IUpdateable
	{
		public var gameObject:GameObject;
		private var _enabled:Boolean = true;
		
		public function BaseScript(object:GameObject = null) 
		{
			gameObject = object;
		}
		
		public function start():void
		{
			
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