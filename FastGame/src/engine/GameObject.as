package engine 
{
	import flash.display.Sprite;
	import engine.interfaces.IDisposable;
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class GameObject extends Sprite implements IDisposable
	{
		// core info
		public var x:Number;
		public var y:Number;
		
		// scripts
		protected var scripts:Vector.<BaseScript> = new Vector.<BaseScript>();
		
		// components
		protected var components:Vector.<GameComponent> = new Vector.<GameComponent>();
		
		public function GameObject() 
		{
			
		}
		
		public function dispose():void
		{
			
		}
		
		public function clone():void
		{
			
		}
		
		// add component
		// remove component
		// get component by name
		// get component by type
		
		// add script
		// remove script
	}

}