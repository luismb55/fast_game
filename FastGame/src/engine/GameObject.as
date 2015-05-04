package engine 
{
	import engine.components.BaseComponent;
	import flash.display.Sprite;
	import engine.interfaces.IDisposable;
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class GameObject extends Sprite implements IDisposable
	{
		// core info
		
		// scripts
		protected var scripts:Vector.<BaseScript> = new Vector.<BaseScript>();
		
		// components
		protected var components:Vector.<BaseComponent> = new Vector.<BaseComponent>();
		
		public function GameObject() 
		{
			
		}
		
		public function dispose():void
		{
			
		}
		
		public function clone():void
		{
			
		}
		
		public function addComponent(component:BaseComponent):void
		{
			components.push(component);
			// TODO ¿check for duplicates ?
		}
		
		public function removeComponent(component:BaseComponent):void
		{
			components.splice(components.indexOf(component),1);
			// TODO ¿check for duplicates ?
		}
		
		// get component by name
		// get component by type
		
		// add script
		public function addScript(script:BaseScript):void
		{
			scripts.push(script);
			// TODO ¿check for duplicates ?
		}
		
		public function removeScript(script:BaseScript):void
		{
			scripts.splice(scripts.indexOf(script),1);
			// TODO ¿check for duplicates ?
		}
		// remove script by name ?
		// remove script by type
	}

}