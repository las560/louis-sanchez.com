package  {
	
	import flash.display.MovieClip;
	
	
	public class BlueBlockBreaking extends Block {
		// data members

		// construct a RedBlock with coodinates
		public function BlueBlockBreaking(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "BlueBlockBreaking";
			this.mapChar = '2';
		}
	}
}