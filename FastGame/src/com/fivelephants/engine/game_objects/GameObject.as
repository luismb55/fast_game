package com.fivelephants.engine.game_objects 
{
	import com.fivelephants.engine.components.BaseComponent;
	import com.fivelephants.engine.interfaces.IDisposable;
	import com.fivelephants.engine.interfaces.IUpdateable;
	import com.fivelephants.engine.scripting.BaseScript;
	
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class GameObject extends Sprite implements IDisposable, IUpdateable
	{
		// core info
		public var xPosition:Number = 0;
		public var yPosition:Number = 0;
		
		public var xScale:Number = 1.0;
		public var yScale:Number = 1.0;
		
		// TODO rotation
		
		// scripts
		protected var scripts:Vector.<BaseScript> = new Vector.<BaseScript>();
		
		// components
		protected var components:Vector.<BaseComponent> = new Vector.<BaseComponent>();
		
		public function GameObject() 
		{
			
		}
		
		final public function update():void
		{
			for each(var component:BaseComponent in components){
				if(component.enabled) component.update();
			}
			
			for each(var script:BaseScript in scripts){
				if(script.enabled) script.update();
			}
		}
		
		public function draw():void
		{
			scaleX = xScale;
			scaleY = yScale;
			x = xPosition;
			y = yPosition;
		}
		
		protected function debugDraw():void
		{
			
		}
		
		public function destroy():void
		{
			// TODO
		}
		
		public function clone():void
		{
			
		}
		
		public function addComponent(component:BaseComponent):void
		{
			/*for each(var c:BaseComponent in components){
				if (typeof(c) == typeof(component))
					return;
			}*/
			
			components.push(component);
			component.gameObject = this;
		}
		
		public function removeComponent(component:BaseComponent):void
		{
			components.splice(components.indexOf(component),1);
		}
		
		public function getComponent(type:Class):BaseComponent
		{
			for each(var component:BaseComponent in components){
				if(component is type)
					return component;
			}
			return null;
		}
		
		public function addScript(script:BaseScript):void
		{
			for each(var s:BaseScript in scripts){
				if (typeof(s) == typeof(script))
					return;
			}
			
			scripts.push(script);	
			script.gameObject = this;
			script.start(); // TODO
		}
		
		public function removeScript(script:BaseScript):void
		{
			scripts.splice(scripts.indexOf(script),1);
		}
		
		// remove script by type
	}
}