package com.fivelephants.engine.components 
{
	import flash.display.Sprite;
	import com.fivelephants.engine.game_objects.GameObject;
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class SpriteRenderer extends BaseComponent 
	{
		protected var _sprite:Sprite;
		
		public function SpriteRenderer(object:GameObject) 
		{
			super(object);	
		}
		
		public function get sprite():Sprite 
		{
			return _sprite;
		}
		
		public function set sprite(value:Sprite):void 
		{
			var previousIndex:int = -1;
			
			if (_sprite != null && value != _sprite && 
				gameObject != null && gameObject.contains(_sprite)){
				previousIndex = gameObject.getChildIndex(_sprite);
				gameObject.removeChild(_sprite);
			}
			
			_sprite = value;
			
			if(previousIndex >= 0)
				gameObject.addChildAt(_sprite, previousIndex) // TODO CHECK THE INDEX
			else
				gameObject.addChild(_sprite);
		}
		
	}

}