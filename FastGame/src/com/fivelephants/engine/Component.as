package com.fivelephants.engine
{
	import com.fivelephants.engine.components.BaseComponent;
	
	public class Component extends BaseObject
	{
		protected var _gameObject:GameObject;
		
		public function Component()
		{
			super();
		}
		
		protected override function destroy():void
		{
			// TODO remove parent
		}
		
		public function getComponent(objectClass:Class):BaseComponent
		{
			return _gameObject.getComponent(objectClass);
		}
		
		public function getComponents(objectClass:Class):Vector.<BaseComponent>
		{
			return _gameObject.getComponents(objectClass);
		}
		
		public function getComponentInChildren(objectClass:Class):BaseComponent
		{
			return _gameObject.getComponentInChildren(objectClass);
		}
		
		public function getComponentsInChildren(objectClass:Class):Vector.<BaseComponent>
		{
			return _gameObject.getComponentsInChildren(objectClass);
		}
		
		public function getComponentInParent(objectClass:Class):BaseComponent
		{
			return _gameObject.getComponentInParent(objectClass);
		}
		
		public function getComponentsInParent(objectClass:Class):Vector.<BaseComponent>
		{
			return _gameObject.getComponentsInParent(objectClass);
		}
		
		public function get gameObject():GameObject
		{
			return _gameObject;
		}
		
		public function set gameObject(object:GameObject):void
		{
			_gameObject = object;
		}
		
		// TODO
		//BroadcastMessage	Calls the method named methodName on every MonoBehaviour in this game object or any of its children.
		//GetComponent	Returns the component of Type type if the game object has one attached, null if it doesn't.
		//GetComponentInChildren	Returns the component of Type type in the GameObject or any of its children using depth first search.
		//GetComponentInParent	Returns the component of Type type in the GameObject or any of its parents.
		//GetComponents	Returns all components of Type type in the GameObject.
		//GetComponentsInChildren	Returns all components of Type type in the GameObject or any of its children.
		//GetComponentsInParent	Returns all components of Type type in the GameObject or any of its parents.
		//SendMessage	Calls the method named methodName on every MonoBehaviour in this game object.
		//SendMessageUpwards	Calls the method named methodName on every MonoBehaviour in this game object and on every ancestor of the behaviour.
	}
}