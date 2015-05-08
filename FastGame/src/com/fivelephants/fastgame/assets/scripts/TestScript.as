package com.fivelephants.fastgame.assets.scripts
{
	import com.fivelephants.engine.components.MonoBehaviour;
	
	import flash.geom.Point;
	
	public class TestScript extends MonoBehaviour
	{
		public function TestScript()
		{
			super();
		}
		
		public override function update():void
		{
			if(_gameObject == null)
				return;
			
			//gameObject.transform.localPosition = gameObject.transform.localPosition.add(new Point(0.3,0.3));
			//gameObject.transform.localRotation += 5;
		}
		
	}
}