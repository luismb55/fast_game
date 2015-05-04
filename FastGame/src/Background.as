package 
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author ...
	 */
	public class Background
	{
		protected var zoneName:String;
		protected var zoneData:MovieClip;
		protected var zoneVSpeed:Number;
		protected var zoneTransition:MovieClip;
		
		protected var gameStage:Stage;
		
		private var hasTransition:Boolean = false;
		
		public function Background(zoneName:String, zoneData:MovieClip, zoneVSpeed:Number = 10.0) 
		{
			this.zoneName = zoneName;
			this.zoneData = zoneData;
			this.zoneVSpeed = zoneVSpeed;
		}
		
		public function AddTransitionZone(zoneA:String, zoneB:String):void
		{
			var transitionClass:Class;
			
			if (zoneTransition && zoneData.contains(zoneTransition)) {
					zoneData.removeChild(zoneTransition);
					zoneData.getChildAt(0).y -= zoneTransition.height;
					
					zoneTransition = null;
			}
			
			if (zoneA != zoneB) {
				
				Utils.Log("--> ADDED NEXT TRANSITION FROM " + zoneA + " TO " + zoneB, Utils.MESSAGE_TYPE_LOG);
				
				try {
					transitionClass = getDefinitionByName("graphics_bg_" 
					+ zoneA.toLowerCase() + "2" 
					+ zoneB.toLowerCase()) as Class;
				} catch (e:Error) {
					Utils.Log("INVALID ZONE TRANSITION", Utils.MESSAGE_TYPE_ERROR);
				}
				
				zoneTransition = (new transitionClass() as MovieClip);
				zoneData.getChildAt(0).y += zoneTransition.height;
				zoneTransition.x = 0.0;
				zoneTransition.y = 0.0;
				
				zoneData.addChild(zoneTransition);
				
				hasTransition = true;
			} else {
				Utils.Log("--> NO TRANSITION ZONE ADDED", Utils.MESSAGE_TYPE_LOG);
			}
		}
		
		public function get name():String
		{
			return zoneName;
		}
		
		public function get data():MovieClip
		{
			return zoneData;
		}
		
		public function get vSpeed():Number
		{
			return zoneVSpeed;
		}
		
		public function get transitionData():MovieClip
		{
			return zoneTransition;
		}
		
		public function get height():Number
		{
			return data.height;
		}
		
		public function get width():Number
		{
			return data.width;
		}
		
		public function get x():Number
		{
			return data.x;
		}
		
		public function get y():Number
		{
			return data.y;
		}
		
		public function set x(value:Number):void
		{
			data.x = value;
		}
		
		public function set y(value:Number):void
		{
			data.y = value;
		}
		
		public function set vSpeed(value:Number):void
		{
			zoneVSpeed = value;
		}
	}
}