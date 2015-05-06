package com.fivelephants.engine.components
{
	import com.fivelephants.engine.Component;
	
	public class Behaviour extends Component
	{
		private var _enabled:Boolean = false;
		private var _isActiveAndEnabled:Boolean = false;
		
		public function Behaviour()
		{
			super();
		}
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set enabled(e:Boolean):void
		{
			_enabled = e;
			
			if(e)
				_isActiveAndEnabled = true;
		}
		
		
	}
}