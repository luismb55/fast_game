package 
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author ...
	 */
	public class Background 
	{
		protected var zoneName:String;
		protected var zoneData:MovieClip;
		
		public function Background(zoneName:String, zoneData:MovieClip) 
		{
			this.zoneName = zoneName;
			this.zoneData = zoneData;
		}
		
		public function get name():String
		{
			return zoneName;
		}
		
		public function get data():MovieClip
		{
			return zoneData;
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
	}
}