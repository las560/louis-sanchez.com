package  {
	
	import flash.display.MovieClip;
	
	
	public class RedBlock extends Block {
		// data members
		public var explode;

		// construct a RedBlock with coodinates
		public function RedBlock(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "RedBlock";
			this.explode = false;
			this.mapChar = '4';
			this.fell = false;
			this.isFalling = false;
		}
	}
}
