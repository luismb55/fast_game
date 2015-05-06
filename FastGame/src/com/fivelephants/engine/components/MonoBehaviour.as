package com.fivelephants.engine.components
{
	import com.fivelephants.engine.GameObject;

	public class MonoBehaviour extends Behaviour
	{
		private static var _behaviours:Vector.<MonoBehaviour> = new Vector.<MonoBehaviour>();
		
		public function MonoBehaviour()
		{
			super();
		}
		
		protected override function destroy():void
		{
			var index:int = _behaviours.indexOf(this);
			
			if(index >= 0)
				_behaviours.splice(index,1);
		} 
		
		public function start():void
		{
			
		}
		
		public function update():void
		{
			
		}
		
		public override function set gameObject(object:GameObject):void
		{
			if(object != null && _gameObject == null)
				_behaviours.push(this);
			
			super.gameObject = object;
		}
		
		public static function get behaviours():Vector.<MonoBehaviour>
		{
			return _behaviours;
		}
	}
}