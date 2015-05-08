package MessageSystem 
{
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class MessageController 
	{
		protected var message_types:Vector.<int>;
		protected var message_handler:MessageHandler;
		
		public function MessageController(types:Vector.<int>, handler:MessageHandler) 
		{
			messageTypes = types;
			messageHandler = handler;
		}
		
		public function init():void
		{
			if (!message_types || !message_handler) {
				var subscriber:MessageSubscriber = new MessageSubscriber();
				subscriber.messageTypes = message_types;
				subscriber.messageHandler = message_handler;
				
				MessageBus.getInstance().AddSubscriber(subscriber);
			}
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