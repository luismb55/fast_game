package MessageSystem 
{
	import flash.utils.Dictionary;
	import Utils.Tools;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class MessageBus 
	{
		private var subscriber_lists:Dictionary;
		
		private static var static_instance:MessageBus;
		
		public function MessageBus() 
		{
			if(static_instance) {
				subscriber_lists = new Dictionary();
			} else {
				Tools.Log("You must use the static instance of this class", Tools.MESSAGE_TYPE_ERROR);
			}
		}
		
		/*
		 * Singleton for the message bus
		 */
		public static function getInstance():MessageBus
		{
			if (static_instance == null) {
				static_instance = new MessageBus();
			}
			
			return static_instance;
		}
		
		/*
		 * Assigns a subscriber to each message sent through the bus
		 */
		public function AddSubscriber(subscriber:MessageSubscriber):void
		{
			var msg_types:Vector.<int> = subscriber.messageTypes;
			
			for each(var type:int in msg_types) {
				AddSubscriberToMessage(type, subscriber);
			}
		}
		
		/*
		 * Assigns a subscriber to an specific message in the bus
		 */
		public function AddSubscriberToMessage(type:int, subscriber:MessageSubscriber):void
		{
			if (!subscriber_lists[type]) {
				subscriber_lists[type] = new Vector.<MessageSubscriber>();
			}
			
			(subscriber_lists[type] as Vector.<MessageSubscriber>).push(subscriber);
		}
		
		/*
		 * The method for broadcasting messages to susbcribers through the bus
		 */
		public function SendMessage(message:Message):void
		{
			var subscribers:Vector.<MessageSubscriber> = subscriber_lists[message.messageType];
			
			if (subscriber_lists[message.messageType]) {
				for (var i:int = 0; i < subscribers.length; i++) {
					SendMessageToSubscriber(message, subscribers[i]);
				}
			}
		}
		
		/*
		 * Sends a message to an specific subscriber
		 */
		public function SendMessageToSubscriber(message:Message, subscriber:MessageSubscriber):void
		{
			//subscriber.handler.HandleMessage(message);
		}
		
	}

}