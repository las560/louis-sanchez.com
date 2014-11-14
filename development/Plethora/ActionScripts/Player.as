package  {
	
	import flash.display.MovieClip;
	
	
	public class Player extends Block {
		// data layout
		public var canMove;
		public var objectAhead;
		public var isLocked;
		public var canPush;
		public var isPushing;
		public var dir;
		public var changeDirection;
		public var travel;
		public var isBlockedOnRight;
		public var isBlockedOnLeft;
		public var isJumping;
		public var jumpdir;
		public var start_y;
		public var isBetween_x;
		public var isBetween_y;
		public var causedExplosion;		
		public var danger;
		public var crush;
		
		// constructor
		public function Player(xcor: Number, ycor: Number) {
			super(xcor, ycor);
			this.blockType = "Player";
			this.canMove = false;
			this.objectAhead = false;
			this.isLocked = false;
			this.canPush = true;
			this.isPushing = false;
			this.changeDirection = false;
			this.isBlockedOnRight = false;
			this.isBlockedOnLeft = false;
			this.isJumping = false;
			this.isFalling = false;
			this.isBetween_x = false;
			this.isBetween_y = false;
			this.causedExplosion = false;
			this.isFalling = false;
			this.jumpdir = 0;
			this.danger = false;
			this.crush = false
		}
	}
	
}
