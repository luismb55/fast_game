package Utils 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.errors.IOError;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	/**
	 * ...
	 * @author 3Elephants
	 */
	public class XMLParser 
	{
		protected var c_url:String;
		protected var xml:XML;
		protected var xmlResult:Object;
		protected var loader:URLLoader;
		protected var loadedCallback:Function;
		
		public function XMLParser() 
		{ }
		
		/*
		 * Allows to read an XML file from an external source (must be present in the same SWF folder)
		 */
		public function LoadAndParseExternalXML(url:String, loadedCallback:Function = null):void
		{
			c_url = url;
			this.loadedCallback = loadedCallback;
			
			try {
				loader = new URLLoader(new URLRequest(c_url));
				loader.addEventListener(Event.COMPLETE, OnXMLDocumentLoaded);
				
			} catch (e:IOError) {
				("The background sequence XML file cannot be read", Tools.MESSAGE_TYPE_ERROR);
			}
		}
		
		/*
		 * Parse-only an already embedded XML file or data, turning it to an AS3 Object
		 */
		public function ConvertXML2Object(xmlData:XML):Object
		{
			var document:XMLDocument = new XMLDocument();
			
			document.ignoreWhite = true;
			document.parseXML(xmlData);
			
			xmlResult = node2Object(document);
			
			return xmlResult;
		}
		
		/* ---------------------------------------------------------------------------------------- */
		
		/*
		 * Called once the specified XML file is fully loaded
		 */
		private function OnXMLDocumentLoaded(e:Event):void
		{
			Tools.Log("XML file '" + c_url + "' successfully loaded!");
			
			xml = XML(loader.data);
			
			ConvertXML2Object(xml);
			
			if (loadedCallback != null) loadedCallback();
		}
		
		/*
		 * Converts an XML node into an AS3 Object
		 */
		private function node2Object(node:XMLNode):Object
		{
			var xmlObject:Object = new Object();
			
			// Current node's attributes:
			var attributes:Object;
			for (var attr_name:String in node.attributes) {
				if (!attributes) attributes = new Object();
				attributes[attr_name] = parseXMLValue(node.attributes[attr_name]);
			}
			
			if (attributes != null) xmlObject["_attrib"] = attributes;
			
			// Current node's children:
			for (var child_node:XMLNode = node.firstChild; child_node != null; child_node = child_node.nextSibling) {
				if (child_node.nodeType == 3) { // text-type
					xmlObject["_text"] = parseXMLValue(child_node.nodeValue);
					continue;
				}
				
				if (child_node.nodeType != 1) continue;
				
				// recursively call the same method for the node's children:
				var child_obj:Object = node2Object(child_node);
				
				if (!xmlObject[child_node.nodeName]) {
					xmlObject[child_node.nodeName] = child_obj;
				} else {
					// if the child already exists, this converts this part of the object into an array
					if (!(xmlObject[child_node.nodeName] is Array)) {
						var existingObject:Object = xmlObject[child_node.nodeName];
						
						xmlObject[child_node.nodeName] = new Array();
						xmlObject[child_node.nodeName].push(existingObject);
					}
					
					xmlObject[child_node.nodeName].push(child_obj);
				}
			}
			
			return xmlObject;
		}
		
		/*
		 * Checks whether the value is a number or not, or if it's a boolean
		 */
		private function parseXMLValue(value:String):*
		{
			if (parseFloat(value).toString() == value) return parseFloat(value);
			else if (value == "false") return false;
			else if (value == "true") return true;
			else return value;
		}
		
		public function GetXMLObject():Object
		{
			return xmlResult;
		}
	
		public function GetURL():String
		{
			return c_url;
		}
	}
}