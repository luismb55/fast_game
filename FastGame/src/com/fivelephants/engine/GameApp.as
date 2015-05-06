package com.fivelephants.engine 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class GameApp extends Sprite 
	{
		private static var _instance:GameApp;
		protected static var _scene:GameScene;
	
		private static var isPaused:Boolean;
		
		public function GameApp(){
			if(_instance){
				throw new Error("GameApp... use getInstance()");
			} 
			_instance = this;
		}

		public static function getInstance():GameApp
		{
			if(!_instance){
				new GameApp();
				isPaused = false;
			} 
			return _instance;
		}
		
		public function init():void
		{
			if(!hasEventListener(Event.ENTER_FRAME)){
				addEventListener(Event.ENTER_FRAME, mainLoop);
			}
		}
		
		protected function mainLoop(e:Event):void
		{
			if(!isPaused){
				update();
				draw();
			}
		}
		
		private function update():void
		{
			if(_scene != null)
				_scene.update();
		}
		
		private function draw():void
		{
			if(_scene != null)
				_scene.draw();
		}
		
		public function set scene(s:GameScene):void
		{
			if (s == null || s == _scene)
				return;
				
			if (_scene != null){
				_scene.removeEventListener(Event.ADDED_TO_STAGE, onSceneAddedToStage);
				
				if(contains(_scene))
					removeChild(_scene);
			}
			
			_scene = s;
			_scene.init();
			
			addChild(_scene);
			_scene.addEventListener(Event.ADDED_TO_STAGE, onSceneAddedToStage);
		}
		
		protected function onSceneAddedToStage(e:Event):void
		{
			GameScene(e.target).init();
		}
		
		public static function get scene():GameScene
		{
			return _scene;
		}
		
		public override function addChild(child:DisplayObject):DisplayObject
		{
			if (child != _scene)
				return child;
			else
				return super.addChild(child);
		}
		
		public override function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			if (child != _scene)
				return child;
			else
				return super.addChildAt(child,index);
		}
	}

}