package  {
	
	import flash.display.MovieClip;
	
	
	public class PurpleBlock extends Block {
		// data members

		// construct a PurpleBlock with coodinates
		public function PurpleBlock(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "PurpleBlock";
			this.mapChar = '3';
			this.fell = false;
			this.isFalling = false;
		}
	}
}
