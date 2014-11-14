package  {
	
	import flash.display.MovieClip;
	
	
	public class BlueBlock extends Block {
		// data members
		public var slidingdir;
		public var mustStop;
		public var isSliding;

		// construct a BlueBlock with coodinates
		public function BlueBlock(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "BlueBlock";
			this.mapChar = '2';
			this.fell = false;
			this.isFalling = false;
			this.mustStop = false;
			this.isSliding = false;
		}
	}
}
