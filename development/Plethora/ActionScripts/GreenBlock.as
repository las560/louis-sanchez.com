package  {
	
	import flash.display.MovieClip;
	
	
	public class GreenBlock extends Block {
		// data members

		// construct a GreenBlock with coodinates
		public function GreenBlock(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "GreenBlock";
			this.mapChar = '1';
			this.fell = false;
			this.isFalling = false;
		}
	}
}
