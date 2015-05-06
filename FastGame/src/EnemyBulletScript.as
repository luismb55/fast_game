package 
{
	import com.fivelephants.engine.components.SpriteRenderer;
	import com.fivelephants.engine.scripting.BaseScript;
	
	/**
	 * ...
	 * @author Luis Miguel Blanco
	 */
	public class EnemyBulletScript extends BaseScript 
	{
		protected var _spriteRenderer:SpriteRenderer;	
	
		public function EnemyBulletScript() 
		{
			super();
		}
		
		public override function start():void
		{
			_spriteRenderer = gameObject.getComponent(SpriteRenderer) as SpriteRenderer;
		}
		
		public override function update():void
		{
			if(gameObject == null)
				return;
			
			if(_spriteRenderer){
				_spriteRenderer.update();
			}
			
			gameObject.xPosition += 10;
			gameObject.yPosition += 10;
		}
	}

}