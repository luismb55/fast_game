package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Utils 
	{
		
		public static function log(message:String):void
		{
			trace(">> " + message);
			
			// format messages, different logs, etc
		}
		
		public static function error(message:String):void
		{
			trace(">> ERROR!: " + message);
			
			// format messages, different errors, etc
		}
		
	}

}