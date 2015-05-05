package 
{
	import com.sibirjak.asdpc.core.dataprovider.IDataSourceAdapter;
	import flash.display.DisplayObjectContainer;

	internal class DOCAdapter implements IDataSourceAdapter {
	  private var _view : DisplayObjectContainer;

	  public function DOCAdapter(view : DisplayObjectContainer) {
		_view = view;
	  }

	  public function get dataSource() : * {
		return _view;
	  }


	  public function cleanUp() : void {
		// empty
	  }
	  
		public function itemAt(index : uint) : * {
			return _view.getChildAt(index);
		}

	  
		public function get size () : uint
		{
			return _view.numChildren;
		}
	}
}