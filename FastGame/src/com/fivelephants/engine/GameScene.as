package com.fivelephants.engine 
{
	import com.fivelephants.engine.interfaces.IUpdateable;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GameScene extends Sprite implements IUpdateable
	{
		protected var objects:Vector.<GameObject> = new Vector.<GameObject>();
		
		public function GameScene()
		{
			super();
		}
		
		public function init():void
		{
			
		}
		
		public function update():void
		{
			/*for (var i:uint = 0; i < numChildren; i++){
				getGameObjectAt(i).update();
			}*/
		}
		
		public function draw():void
		{
			for (var i:uint = 0; i < objects.length; i++){
				objects[i].draw(); // TODO
			}
		}
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			throw new Error("Use addGameObject method");
			
			/*if (child is GameObject)
				return super.addChild(child);
			else
				return child;*/
		}
		
		public override function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			throw new Error("Use addGameObjectAt method");
			
			/*if (child is GameObject)
				return super.addChildAt(child,index);
			else
				return child;*/
		}
		
		public function addGameObject(object:GameObject):void
		{
			super.addChild(object.display);

			objects.push(object);
		}
		
		public function addGameObjectAt(object:GameObject, index:int):void
		{
			super.addChildAt(object.display, index);
			
			objects.push(object);
		}
		
		public function getGameObjectAt(index:int):GameObject
		{
			var child:DisplayObject = getChildAt(index);
			
			return child is GameObject ? child as GameObject : null;
		}
		
		public function getGameObjectByName(name:String):GameObject
		{
			var child:DisplayObject = getChildByName(name);
			
			return child is GameObject ? child as GameObject : null;
		}
	}

}