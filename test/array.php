<?
	/* create 2 arrays */
	$arr1 = array();
	$arr2 = array();
	
	/* fill both arrays with random data */
	for ($i = 0; $i < 2; $i++) {
		for ($j = 0; $j < 10; $j++) {
			
			/* if first array */
			if ($i == 0)
				$arr1[] = rand(1, 10);
			
			/* else if second */
			else
				$arr2[] = rand(1, 10);
		}
	}
	
	/* create ArrayController */
	$controller = new ArrayController($arr1, $arr2);
	
	/* print the controller's arrays */
	echo ArrayController::$message."<br>";
	$controller->printArrays();
	$controller->intersection();

	class ArrayController {
		public static $message = "ArrayController";
		public $first;
		public $second;
		public $length;
		public $intersection;
	
		public function __construct($first, $second) {
			$this->first = $first;
			$this->second = $second;
			$this->length = count($first);
			$this->intersection = array();
		}
		
		public function printArrays() {
		
			for ($i = 0; $i < 2; $i++) {
				for ($j = 0; $j < $this->length; $j++) {
					
					/* if first array */
					if ($i == 0)
						echo $this->first[$j]." ";
					
					/* else if second */
					else
						echo $this->second[$j]." ";
				}
				echo "<br>";
			}
			echo "<br>";
		}
		
		public function intersection() {
		
			foreach ($this->first as $f) {
				foreach($this->second as $s) {
					if ($f == $s && !in_array($f, $this->intersection)) {
						$this->intersection[] = $f;
						echo $f." ";
					}
				}
			}
		}
	}

?>