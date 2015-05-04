package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class BackgroundController extends Drawable
	{
		/*
		 * Embedded external XML file which contains the background sequence
		 */
		[Embed(source="XML/background_sequence.xml", mimeType="application/octet-stream")] 
		protected const EmbeddedXMLBgSequence:Class;
		
		/*
		 * These are the different background zones available
		 */
		public static const ZONE_GROUND:String = "GROUND";
		public static const ZONE_WATER:String = "WATER";
		
		/*
		 * Defines the background's sequence, which automatically loops
		 */
		protected static var BACKGROUND_SEQUENCE:Vector.<Object> = new <Object>[
			{ "zone" : ZONE_GROUND, "speed" : 10.0 },
			{ "zone" : ZONE_WATER, "speed" : 10.0 },
			{ "zone" : ZONE_GROUND, "speed" : 10.0 },
		]; // Initialized with a default sequence (in case XML loader fails)
		
		/*
		 * Internal class attributes
		 */
		protected var backgroundSequence:Array;
		protected var backgroundSequenceIndex:uint;
		
		protected var backgroundSpeed:Number = 0.0;
		protected var backgroundInertiaSpeed:Number = 0.0;
		protected var backgroundInertiaPercent:Number = 50; // 50% inertia
		
		private var visibleZoneA:Background;
		private var visibleZoneB:Background;
		
		private var nextSet:Boolean = false;
		private var speedSet:Boolean = false;
		
		private var initialized:Boolean = false;
		
		/*
		 * Debug variables
		 */
		private var debugLabel:TextField;
		private var debugLabelText:String = "";
		
		public function BackgroundController(s:Stage)
		{
			graphic = new MovieClip();	
			super(s);
			
			// (DEBUG)
			debugLabel = new TextField();
			debugLabel.x = debugLabel.y = 0;
			debugLabel.textColor = 0xffffff;
			debugLabel.border = true;
			debugLabel.borderColor = 0x00ff00;
			debugLabel.width = 185;
			debugLabel.height = 50;
			debugLabel.text = "";
			addChild(debugLabel);
			// (DEBUG)
		}
		
		/*
		 * Initializes the first background zone of the sequence
		 */
		public override function init():void
		{	
			// 1) Reads the embedded XML file to retrieve the sequence:
			var byteData:ByteArray = new EmbeddedXMLBgSequence();
			
			var xmlParser:XMLParser = new XMLParser();
			var xmlData:XML = XML(byteData.readUTFBytes(byteData.length));
			var xmlSequence:Object = xmlParser.ConvertXML2Object(xmlData);
			
			if (xmlSequence && xmlSequence.hasOwnProperty("background_sequence")) {
				BACKGROUND_SEQUENCE = new Vector.<Object>();
				
				if (xmlSequence.background_sequence != null) {
					for (var i:int = 0; i < xmlSequence.background_sequence.zone.length; i++) {
						var xmlZone:Object = xmlSequence.background_sequence.zone[i];
						
						BACKGROUND_SEQUENCE.push( { "zone" : xmlZone.type._text, "speed" : xmlZone.vspeed._text } );
					}
				}
			}
			
			// 2) Creates the zones sequence:
			CreateZonesSequence();
			
			// 3) Initializes the first zone of the sequence:
			var nextIndex:int = (backgroundSequenceIndex + 1) % backgroundSequence.length;
				
			visibleZoneA = backgroundSequence[backgroundSequenceIndex];
			
			Utils.Log("LOADED INITIAL ZONE: " + visibleZoneA.name);
			UpdateDebugLabelZones(backgroundSequenceIndex);
			
			visibleZoneA.AddTransitionZone(visibleZoneA.name, backgroundSequence[nextIndex].name);
			
			visibleZoneA.x = gameStage.stageWidth * 0.5;
			visibleZoneA.y = -visibleZoneA.height + gameStage.stageHeight;
			
			backgroundSpeed = visibleZoneA.vSpeed;
			backgroundInertiaSpeed = backgroundSequence[nextIndex].vSpeed;
			
			visibleZoneB = new Background("", new MovieClip());
			
			graphic.addChild(visibleZoneA.data);
			graphic.addChild(visibleZoneB.data);
			
			initialized = true;
		}
		
		/*
		 * Creates the different zones needed to perform the sequence
		 */
		protected function CreateZonesSequence():void
		{
			backgroundSequenceIndex = 0;
			
			backgroundSequence = new Array();
			
			BACKGROUND_SEQUENCE.forEach(function(zoneObject:Object, i:int, list:Vector.<Object>):void
				{
					var zoneClass:Class = getDefinitionByName("graphics_bg_" + zoneObject.zone.toLowerCase()) as Class;
					backgroundSequence.push(new Background(zoneObject.zone, 
						(new zoneClass() as MovieClip), zoneObject.speed));
				});
		}
		
		public override function move():void
		{
			if (!initialized) return;
			
			if (backgroundSpeed != backgroundInertiaSpeed) {
				if(backgroundSpeed > backgroundInertiaSpeed)
					backgroundSpeed -= backgroundInertiaSpeed / backgroundInertiaPercent;
				else
					backgroundSpeed += backgroundInertiaSpeed / backgroundInertiaPercent;
					
				if (Math.abs(backgroundInertiaSpeed - backgroundSpeed) <
					(backgroundInertiaSpeed / backgroundInertiaPercent)) {
						backgroundSpeed = backgroundInertiaSpeed;
					}
			}
			
			UpdateDebugLabelSpeed(backgroundSpeed);
			
			if (visibleZoneA && graphic.contains(visibleZoneA.data)) 
				visibleZoneA.y += backgroundSpeed;
			if (visibleZoneB && graphic.contains(visibleZoneB.data))
				visibleZoneB.y += backgroundSpeed;
			
			if (!nextSet && visibleZoneA.y > -backgroundSpeed) {
				backgroundSequenceIndex++;
				backgroundSequenceIndex %= backgroundSequence.length;
				
				if (graphic.contains(visibleZoneB.data)) graphic.removeChild(visibleZoneB.data);
				
				var nextIndex:int = (backgroundSequenceIndex + 1) % backgroundSequence.length;
				
				visibleZoneB = backgroundSequence[backgroundSequenceIndex];
				
				Utils.Log("LOADED UPCOMING ZONE: " + visibleZoneB.name);
				UpdateDebugLabelZones(backgroundSequenceIndex);
				
				visibleZoneB.AddTransitionZone(visibleZoneB.name, backgroundSequence[nextIndex].name);
				visibleZoneB.x = gameStage.stageWidth * 0.5;
				visibleZoneB.y = -visibleZoneB.height;
				
				graphic.addChild(visibleZoneB.data);
			
				nextSet = true;
			}
			
			if (nextSet && visibleZoneB.y > -backgroundSpeed) {
				backgroundSequenceIndex++;
				backgroundSequenceIndex %= backgroundSequence.length;
				
				if (graphic.contains(visibleZoneA.data)) graphic.removeChild(visibleZoneA.data);
				
				nextIndex = (backgroundSequenceIndex + 1) % backgroundSequence.length;
				
				visibleZoneA = backgroundSequence[backgroundSequenceIndex];
				
				Utils.Log("LOADED UPCOMING ZONE: " + visibleZoneA.name);
				UpdateDebugLabelZones(backgroundSequenceIndex);
				
				visibleZoneA.AddTransitionZone(visibleZoneA.name, backgroundSequence[nextIndex].name);
				visibleZoneA.x = gameStage.stageWidth * 0.5;
				visibleZoneA.y = -visibleZoneA.height;
				
				graphic.addChild(visibleZoneA.data);
				
				nextSet = false;
			}
			
			nextIndex = (backgroundSequenceIndex + 1) % backgroundSequence.length;
			
			if (!speedSet && visibleZoneA.y > (visibleZoneA.height * 0.5)) {
				backgroundInertiaSpeed = backgroundSequence[nextIndex].vSpeed;
				speedSet = true;
			}
			
			if (speedSet && visibleZoneB.y > (visibleZoneB.height * 0.5)) {
				backgroundInertiaSpeed = backgroundSequence[nextIndex].vSpeed;
				speedSet = false;
			}
		}
		
		protected function UpdateDebugLabelZones(curIndex:int):void
		{
			var nextIndex:int = (curIndex + 1) % backgroundSequence.length;
			
			debugLabelText = "> CURRENT ZONE: " 
				+ backgroundSequence[curIndex].name.toLowerCase() 
				+ " (" + backgroundSequence[curIndex].vSpeed.toString() + " u)";
			debugLabelText += "\n> UPCOMING ZONE: " 
				+ backgroundSequence[nextIndex].name.toLowerCase() 
				+ " (" + backgroundSequence[nextIndex].vSpeed.toString() + " u)";
		}
		
		protected function UpdateDebugLabelSpeed(speed:Number):void
		{
			debugLabel.text = debugLabelText 
				+ "\n> CURRENT SPEED: " 
				+ Utils.RoundToPrecision(speed, 10) + " u";
		}
	}
}
