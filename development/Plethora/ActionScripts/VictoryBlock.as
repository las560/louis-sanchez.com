package  {
	
	import flash.display.MovieClip;
	
	
	public class VictoryBlock extends PurpleBlock {
		// data members

		// construct a VictoryBlock with coodinates
		public function VictoryBlock(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "VictoryBlock";
			this.mapChar = '7';
			this.fell = false;
			this.isFalling = false;
		}
	}
}
