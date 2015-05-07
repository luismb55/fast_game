package com.fivelephants.engine 
{
	import avmplus.getQualifiedClassName;
	
	import com.fivelephants.engine.components.BaseComponent;
	import com.fivelephants.engine.components.MonoBehaviour;
	import com.fivelephants.engine.components.Transform;
	import com.fivelephants.engine.interfaces.IDisposable;
	import com.fivelephants.engine.interfaces.IUpdateable;
	import com.fivelephants.engine.scripting.BaseScript;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;

	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class GameObject extends BaseObject
	{
		protected var _activeInHierarchy:Boolean;
		public var isStatic:Boolean; // TODO check usefulness
		public var layer:int;
		public var tag:String;
		
		public var transform:Transform;
		protected var components:Vector.<Component> = new Vector.<Component>();
		
		// My own thing
		public var display:Sprite;
		
		public function GameObject() 
		{
			transform = new Transform();
			transform.gameObject = this;
			components = new Vector.<Component>();
			
			//display = new graphic_enemy_0();
			// TODO AUTO ADD TO STAGE
			GameApp.getInstance().scene.addGameObject(this);
		}
		
		final public function update():void
		{
			for each(var component:Component in components){
				if (component is MonoBehaviour && MonoBehaviour(component).enabled){
					MonoBehaviour(component).update();
				}
			}
		}
		
		public function draw():void
		{
			if(display){
				display.scaleX = transform.scale.x;
				display.scaleY = transform.scale.y;
				//display.rotationX = transform.direction.x;
				//display.rotationY = transform.direction.y;
				display.rotation = transform.rotation;
				display.x = transform.position.x;
				display.y = transform.position.y;
			}
			
			for each(var child:Transform in transform.children){
				child.gameObject.draw();
			}
			
		}
		
		protected override function destroy():void
		{
			// DESTROY ALL TRANSFORM CHILDREN GAME OBJECTS	
		} 
		
		/** Adds a component class named className to the game object. */
		public function addComponent(objectClass:Class):Component
		{
			var component:Component;
			
			if(objectClass == null)
				return null;
			
			for each(var tempComp:Component in components){
				if (tempComp is objectClass)
					return tempComp;
			}
			
			component = new objectClass();
			component.gameObject = this;

			components.push(component);
			
			return component;
		}
		
		public function getComponent(objectClass:Class):BaseComponent
		{
			if(objectClass == null)
				return null;
			
			for each(var component:BaseComponent in components){
				if(component is objectClass)
					return component;
			}
			return null;
		}
		
		/** Returns the component of Type type in the GameObject or any of its children using depth first search. */
		public function getComponentInChildren(objectClass:Class):BaseComponent
		{
			// TODO
			return null;
		}
		
		/** Finds component in the parent. */
		public function getComponentInParent(objectClass:Class):BaseComponent
		{
			// TODO
			return null;
		}
		
		/** Returns all components of Type type in the GameObject. */
		public function getComponents(objectClass:Class):Vector.<BaseComponent>
		{
			// TODO
			return null;
		}
		
		/** Returns all components of Type type in the GameObject or any of its children. */
		public function getComponentsInChildren(objectClass:Class):Vector.<BaseComponent>
		{
			// TODO
			return null;
		}
		
		/** Returns all components of Type type in the GameObject or any of its parent. */
		public function getComponentsInParent(objectClass:Class):Vector.<BaseComponent>
		{
			// TODO
			return null;
		}
		
		/** Calls the method named methodName on every MonoBehaviour in this game object or any of its children. */
		public function broadcastMessage():void
		{
			// TODO
		}
		
		/** Calls the method named methodName on every MonoBehaviour in this game object. */
		public function sendMessage(methodName:String, value:Object = null):void
		{
			var tempBehaviour:MonoBehaviour;
			var func:Function;
			
			for each(var tempComp:Component in components){
				if (tempComp is MonoBehaviour){
					tempBehaviour = tempComp as MonoBehaviour;
					
					if(tempBehaviour.hasOwnProperty(methodName)){
						func = tempBehaviour[methodName] as Function;
						if(func.length > 0)
							func(value);
						else
							func();
					}
				}
					
			}
		}
		
		/** Calls the method named methodName on every MonoBehaviour in this game object and on every ancestor of the behaviour. */
		public function sendMessageUpwards():void
		{
			// TODO
		}
		
		/** TODO */
		public function get isActive():Boolean
		{
			return _activeInHierarchy;
		}
		
		/** Activates/Deactivates the GameObject. */
		public function set isActive(value:Boolean):void
		{
			_activeInHierarchy = value;
		}
		
		/*public function removeComponent(objectClass:Class):void
		{
			if(objectClass == null)
				return;
			
			for(var i:int = 0; i < components.length; i++){
				if(components[i] is objectClass){
					components.splice(i,1);
					break;	
				}
			}
		}*/
	}
}