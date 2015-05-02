package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class BackgroundController extends Drawable
	{
		/*
		 * These are the different background zones available
		 */
		public static const ZONE_GROUND:String = "GROUND";
		public static const ZONE_WATER:String = "WATER";
		
		/*
		 * Defines the background's sequence; it automatically loops
		 */
		protected static const BACKGROUND_SEQUENCE:Vector.<String> = new <String>[
			ZONE_GROUND,
			ZONE_WATER,
			ZONE_WATER,
			ZONE_GROUND,
			ZONE_WATER,
		];
		
		public static const BACKGROUND_VSPEED:Number = 10;
		
		/*
		 * Internal class attributes
		 */
		protected var backgroundSequence:Array;
		protected var backgroundSequenceIndex:uint;
		
		private var visibleZoneA:Background;
		private var visibleZoneB:Background;
		
		private var nextSet:Boolean = false;
		
		public function BackgroundController(s:Stage)
		{
			graphic = new MovieClip();	
			super(s);
			
			CreateZonesSequence();
		}
		
		public override function init():void
		{
			var nextIndex:int = (backgroundSequenceIndex + 1) % backgroundSequence.length;
				
			visibleZoneA = backgroundSequence[backgroundSequenceIndex];
			Utils.log("LOADED INITIAL ZONE: " + visibleZoneA.name);
			
			visibleZoneA.AddTransitionZone(visibleZoneA.name, backgroundSequence[nextIndex].name);
			
			visibleZoneA.x = gameStage.stageWidth * 0.5;
			visibleZoneA.y = -visibleZoneA.height + gameStage.stageHeight;
			
			visibleZoneB = new Background("", new MovieClip());
			
			graphic.addChild(visibleZoneA.data);
			graphic.addChild(visibleZoneB.data);
		}
		
		public override function move():void
		{
			if (visibleZoneA && graphic.contains(visibleZoneA.data)) 
				visibleZoneA.y += BACKGROUND_VSPEED;
			if (visibleZoneB && graphic.contains(visibleZoneB.data))
				visibleZoneB.y += BACKGROUND_VSPEED;
			
			if (!nextSet && visibleZoneA.y > -BACKGROUND_VSPEED) {
				backgroundSequenceIndex++;
				backgroundSequenceIndex %= backgroundSequence.length;
				
				if (graphic.contains(visibleZoneB.data)) graphic.removeChild(visibleZoneB.data);
				
				var nextIndex:int = (backgroundSequenceIndex + 1) % backgroundSequence.length;
				
				visibleZoneB = backgroundSequence[backgroundSequenceIndex];
				Utils.log("LOADED UPCOMING ZONE: " + visibleZoneB.name);
				
				visibleZoneB.AddTransitionZone(visibleZoneB.name, backgroundSequence[nextIndex].name);
				visibleZoneB.x = gameStage.stageWidth * 0.5;
				visibleZoneB.y = -visibleZoneB.height;
				
				graphic.addChild(visibleZoneB.data);
			
				nextSet = true;
			}
			
			if (nextSet && visibleZoneB.y > -BACKGROUND_VSPEED) {
				backgroundSequenceIndex++;
				backgroundSequenceIndex %= backgroundSequence.length;
				
				if (graphic.contains(visibleZoneA.data)) graphic.removeChild(visibleZoneA.data);
				
				nextIndex = (backgroundSequenceIndex + 1) % backgroundSequence.length;
				
				visibleZoneA = backgroundSequence[backgroundSequenceIndex];
				Utils.log("LOADED UPCOMING ZONE: " + visibleZoneA.name);
				
				visibleZoneA.AddTransitionZone(visibleZoneA.name, backgroundSequence[nextIndex].name);
				visibleZoneA.x = gameStage.stageWidth * 0.5;
				visibleZoneA.y = -visibleZoneA.height;
				
				graphic.addChild(visibleZoneA.data);
				
				nextSet = false;
			}
		}
		
		/*
		 * Creates the different zones needed to perform the sequence
		 */
		protected function CreateZonesSequence():void
		{
			backgroundSequenceIndex = 0;
			
			backgroundSequence = new Array();
			
			BACKGROUND_SEQUENCE.forEach(function(zoneName:String, i:int, list:Vector.<String>):void
				{
					var zoneClass:Class = getDefinitionByName("graphics_bg_" + zoneName.toLowerCase()) as Class;
					backgroundSequence.push(new Background(zoneName, 
						(new zoneClass() as MovieClip), gameStage));
				});
		}
	}
}
