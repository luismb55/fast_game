package Utils 
{
	/**
	 * ...
	 * @author Albert Badosa, 2015
	 */
	public class DynamicProperty 
	{
		private var getter:Function;
		private var setter:Function;
		private var source:*;
		private var property:String;
		
		public function DynamicProperty(source:*, property:String, getter:Function, setter:Function) 
		{
			this.getter = getter;
			this.setter = setter;
			this.source = source;
			this.property = property;
		}
		
		public function get value():* {
			return getter(source[property]);
		}
		
		public function set value(v:*):void {
			source[property] = setter(v);
		}
	}
}