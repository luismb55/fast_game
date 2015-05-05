package engine.components 
{
	import engine.interfaces.IDisposable;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public dynamic class Animation extends Drawable implements IDisposable
	{
		protected var _clip:MovieClip;
		public var interruptable:Boolean;
		public var loops:Boolean;
 
		protected var _frameEvents:Dictionary;
		protected var _labelEvents:Dictionary;
		
		public function Animation(s:Stage, clip:MovieClip, interruptable:Boolean = true, loops:Boolean = false) 
		{
			graphic = clip != null ? clip : new MovieClip(); // TODO change for dummy
			
			this.interruptable = interruptable;
			this.loops = loops;
			
			super(s);
			
			init();
		}
		
		public override function init():void
		{
			super.init();
			
			graphic.addEventListener(Event.ENTER_FRAME, update);
		
			graphic.gotoAndPlay(1);
		}
		
		public function destroy():void
		{
			removeChild(graphic);
			
			graphic.removeEventListener(Event.ENTER_FRAME, update);
			graphic = null;
			
			if (_frameEvents != null)
				for(var fkey:* in _frameEvents) {
					delete _frameEvents[fkey];
				}
				
			if (_labelEvents != null)
				for(var lkey:* in _labelEvents) {
					delete _labelEvents[lkey];
				}
		}
		
		protected function update(e:Event):void
		{
			if(_frameEvents){
				for (var fe:Object in _frameEvents) {
					var event:Function = _frameEvents[fe];
					var frameNumber:int = int(fe);
					
					if(graphic.currentFrame == frameNumber && event != null)
						event();
				}
			}
			
			if (_labelEvents){
				for(var le:Object in _labelEvents){
					var levent:Function = _labelEvents[le];
					var frameLabel:String = String(le);
					
					if (graphic.currentFrameLabel == frameLabel && levent != null)
						levent();
				}
			}
			
			if (!loops && graphic.currentFrame == graphic.totalFrames && graphic.isPlaying)
				graphic.stop();
		}
		
		public function addEventOnFrame(event:Function, frameNumber:int):void
		{
			if (_frameEvents == null)
				_frameEvents = new Dictionary();
			
			_frameEvents[frameNumber] = event;
		}
		
		public function addEventOnLabel(event:Function, frameLabel:String):void
		{
			if (_labelEvents == null)
				_labelEvents = new Dictionary();
				
			_labelEvents[frameLabel] = event;
		}
	}

}