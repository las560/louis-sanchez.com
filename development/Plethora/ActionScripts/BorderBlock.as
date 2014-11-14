package  {
	
	import flash.display.MovieClip;
	
	
	public class BorderBlock extends Block {
		
		// construct a BorderBlock with coodinates
		public function BorderBlock(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "BorderBlock";
		}
	}
}
