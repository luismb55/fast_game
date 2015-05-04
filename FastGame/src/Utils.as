package 
{
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class Utils 
	{
		public static const MESSAGE_TYPE_LOG:String = "LOG";
		public static const MESSAGE_TYPE_ERROR:String = "ERROR";
		
		public static function Log(message:String, type:String = MESSAGE_TYPE_LOG):void
		{
			trace(">> [" + type + "]: " + message);
		}
		
		public static function RoundToPrecision(n:Number, precision:Number):Number
		{
			return Math.round(n * precision) / precision;
		}
	}
}