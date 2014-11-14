package  {
	
	import flash.display.MovieClip;
	
	
	public class RedBlockExplode extends Block {
		// data members

		// construct a RedBlock with coodinates
		public function RedBlockExplode(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "RedBlockExplode";
			this.mapChar = '4';
		}
	}
}
