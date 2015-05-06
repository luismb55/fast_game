package com.fivelephants.engine
{
	public class BaseObject
	{
		//private static var _objects:Vector.<BaseObject> = new Vector.<BaseObject>();
		
		protected var _name:String;
		protected var _destroyOnLoad:Boolean = true;
		
		public function BaseObject()
		{
			/*if(_objects.indexOf(this) < 0)
				_objects.push(this);*/
		}
		
		public function toString():String
		{
			return _name;
		}
		
		
		protected function destroy():void
		{
			
		}
		
		// MARK TO DESTROY AT THE END OF THE UPDATE
		/*public static function destroy(obj:BaseObject):void
		{
			var index:int = _objects.indexOf(obj);
			
			if(index >= 0)
				_objects.splice(index,1);
		}*
		
		/** Destroy objects automatically when loading a new scene .*/
		/*private static function onLoadScene():void // TODO test
		{
			_objects = _objects.filter(
				function(element:*, index:int, vec:Vector.<BaseObject>):Boolean {
					return (element._destroyOnLoad == false);
				}
			);
		}*/
		
		/** Returns the first active loaded object of Type type. */
		/*public static function findObjectOfType(type:Class):BaseObject
		{
			var object:BaseObject;
			
			for each(var tempObj:BaseObject in _objects){
				if(typeof(tempObj) is type){
					object = tempObj;
					break;
				}
			}
			return object;
		}*/
		
		/** Returns a vector of all active loaded objects of Type type. */
		/*public static function findObjectsOfType(type:Class):Vector.<BaseObject>
		{
			var objects:Vector.<BaseObject> = new Vector.<BaseObject>();
			
			for each(var tempObj:BaseObject in _objects){
				if(typeof(tempObj) is type){
					objects.push(tempObj);
				}
			}
			return objects;
		}*/
		
		/** Prevent destroying the object automatically when loading a new scene .*/
		/*public static function DontDestroyOnLoad(object:BaseObject):void
		{
			object._destroyOnLoad = true;
		}*/
		
		/** Clones the object original and returns the clone.*/
		public static function instantiate(original:BaseObject):BaseObject
		{
			// TODO
			return null;
		}
	}
}