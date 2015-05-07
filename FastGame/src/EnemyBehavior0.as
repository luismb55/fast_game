package
{
	
	public class EnemyBehavior0 implements EnemyBehavior
	{
		public function move(e:Enemy):void
		{
			
			if (e.getPosition().y > e.getStage().stageHeight / 2)
			{
				e.setBehavior(new EnemyBehavior1());
			}
			else
			{	
				var y:int = Math.sin(e.getPosition().y / 10) * 10;
				e.setDirection(y, 6);
			}
		}
	}
}