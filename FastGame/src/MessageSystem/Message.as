package MessageSystem 
{
	import Utils.Enum;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class Message 
	{
		public static const message_enum:Enum = new Enum(
			"TYPE_MESSAGE_NONE",
			"TYPE_MESSAGE_TEST1",
			"TYPE_MESSAGE_TEST2"
		);
		
		protected var message_type:int;
		protected var message_data:Object;
		
		public function Message() 
		{
			//
		}
		
		public function get messageType():int
		{
			return message_type;
		}
		
	}

}