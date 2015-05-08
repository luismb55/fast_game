package MessageSystem 
{
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class MessageSubscriber 
	{
		protected var message_types:Vector.<int>;
		protected var message_handler:MessageHandler;
		
		public function get messageTypes():Vector.<int> {
			return message_types;
		}
		
		public function get messageHandler():MessageHandler
		{
			return message_handler;
		}
		
		public function set messageTypes(types:Vector.<int>):void
		{
			message_types = types;
		}
		
		public function set messageHandler(handler:MessageHandler):void
		{
			message_handler = handler;
		}
	}

}