<?php
	/* bootstrap */
	require_once "../config.php";
	
?>
<div id="home" class="grid_24 red">
	<div id="louis_div" class="grid_24 alpha">
		<img id="louis_frame" src="<?php echo $config["baseurl"]; ?>/images/louis_home.png"  />
	</div>
	<div id="slider">
		<img src="<?php echo $config["baseurl"]; ?>/images/scholar.png"   class='default sliding' id='1' />
		<img src="<?php echo $config["baseurl"]; ?>/images/developer.png" class='hidden sliding'  id='2' />
		<img src="<?php echo $config["baseurl"]; ?>/images/achiever.png"  class='hidden sliding'  id='3' />
		<img src="<?php echo $config["baseurl"]; ?>/images/designer.png"  class='hidden sliding'  id='4' />
		<img src="<?php echo $config["baseurl"]; ?>/images/gamer.png"     class='hidden sliding'  id='5' />
	</div>
</div>
<script type="text/javascript" src="<?php echo $config['baseurl'];?>/javascript/home.js"></script>