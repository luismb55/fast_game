package 
{
	import com.fivelephants.engine.components.MonoBehaviour;
	import com.fivelephants.engine.components.SpriteRenderer;
	import com.fivelephants.engine.scripting.BaseScript;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class EnemyBulletScript extends MonoBehaviour 
	{
		protected var _spriteRenderer:SpriteRenderer;	
	
		public function EnemyBulletScript() 
		{
			super();
		}
		
		public override function start():void
		{
		//	_spriteRenderer = gameObject.getComponent(SpriteRenderer) as SpriteRenderer;
		}
		
		public override function update():void
		{
			if(_gameObject == null)
				return;
			
			/*if(_spriteRenderer){
				_spriteRenderer.update();
			}*/
			
			gameObject.transform.position = gameObject.transform.position.add(new Point(0.3,0.3));
			//trace("enemy bullet script update");
		}
		
		public function mutafakas(object:Object):void
		{
			trace("mutafakas",object);
		}
	}
}