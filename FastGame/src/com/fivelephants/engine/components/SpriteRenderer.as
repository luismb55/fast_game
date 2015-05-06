package com.fivelephants.engine.components 
{
	import com.fivelephants.engine.Component;
	import com.fivelephants.engine.GameObject;
	
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class SpriteRenderer extends Component 
	{
		protected var _sprite:Sprite;
		
		public function SpriteRenderer() 
		{
			super();	
		}
		
		public function get sprite():Sprite 
		{
			return _sprite;
		}
		
		public function set sprite(value:Sprite):void 
		{
			var previousIndex:int = -1;
			
			if (_sprite != null && value != _sprite && 
				gameObject != null && gameObject.display.contains(_sprite)){
				previousIndex = gameObject.display.getChildIndex(_sprite);
				gameObject.display.removeChild(_sprite);
			}
			
			_sprite = value;
			
			if(previousIndex >= 0)
				gameObject.display.addChildAt(_sprite, previousIndex) // TODO CHECK THE INDEX
			else
				gameObject.display.addChild(_sprite);
		}
		
	}

}