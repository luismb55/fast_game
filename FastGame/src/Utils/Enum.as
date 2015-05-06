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
				//this[arg] = i;
				
				// This part is optional. We can dynamically generate a setter and 
				// a getter for each property. In this case we use the default getter
				// and setter methods, thus they only do the basic operations of
				// setting and getting the data. The params passed as well as the 
				// return values in the functions are needed by the system to 'understand'
				// the kind of data types to be set and gotten).
				//
				// GETTER EXAMPLE: 
				// function(needed data):int { returning data (could be processed or somewhat) }
				// function(index:int):int { return index / 2 + 54; }
				this[arg] = new DynamicProperty(this, arg, 
					function(index:int):int { return index - 1; },
					function(index:int):int { return index; } );
				this[arg].value = i;
				
				i++;
			}
		}
	}

}