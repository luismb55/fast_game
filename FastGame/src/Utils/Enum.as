package Utils 
{
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Albert Badosa, 2015
	 */
	public dynamic class Enum extends Object
	{
		public function Enum(... args)
		{
			var i:int = 0;
			for each(var arg:String in args) {
				// Creates the new dynamic property and assigns the passed value:
				this[arg] = i;
				i++;
			}
		}
	}

}