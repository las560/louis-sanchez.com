package  {
	import flash.display.MovieClip;
	
	public class Caption extends MovieClip{
		
		// constructor code
		public function Caption() {
			//center(object)
		}
		
		public function center(object) {
			this.x = (object.stageWidth - this.width) / 2;
			this.y = (object.stageHeight - this.height) / 2;
			//this.x = object.x;
			//this.y = object.y;
		}

	}
	
}
