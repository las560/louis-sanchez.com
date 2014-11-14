package  {
	
	import flash.display.MovieClip;
	import flash.globalization.NumberFormatter;
	import fl.transitions.easing.None;
	
	
	public class Block extends MovieClip {
		// data layout
		public static var blockSize: Number = 46;
		public var blockType: String; 
		public var isBeingPushed;
		public var mapChar;
		public var fell;
		public var isFalling;
		
		/**
		 * xcor and ycor holds coordinates in the actual block matrix
		 * To use xcor and ycor in the map, add one to both
		 */
		public var xcor: Number;
		public var ycor: Number;
		
		// construct a block with coodinates
		public function Block(xcor: Number, ycor: Number) {
			this.xcor = xcor;
			this.ycor = ycor;
			this.blockType = "Block";
			this.isBeingPushed = false;
			this.isFalling = false;
			this.fell = false;
		}
		public function setLocation(home_x, home_y) {
			this.x = home_x;
			this.y = home_y;
		}
	}
	
}
