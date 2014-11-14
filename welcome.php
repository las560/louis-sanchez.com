<?php
	/* bootstrap */
	require_once "config.php";

?>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="Keywords" content="Louis, Sanchez, NYU" />
	<meta name="Description" content="Louis Sanchez's Website" />
		
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="css/1080_24_10_10.css" />
	<link rel="stylesheet" type="text/css" href="css/debug.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css" />
	<link rel="stylesheet" type="text/css" href="css/home.css" />
	<!—[if lt IE 7]>
		<link rel="stylesheet" type="text/css" href="css/ie6.css" />
	<![endif]—>
	<title>Welcome</title>
</head>
<body>
		
	<!-- homepage contents -->
	<div id="container" class="container_24">
		
		<!-- header (tool bar) -->
		<div id="header" class="container_24">
			<div class="grid_24">
				<div class="grid_6 alpha ">
					<img src="images/louis-sanchez.png" />
				</div>
				<div class="grid_1 push_13">
					<a href="http://www.facebook.com/ls.snchz" target="_blank">
					<img src="images/icons/facebook_32x32.png" />
					</a>
				</div>
				<div class="grid_1 push_13">
					<a href="https://twitter.com/#!/loo1326" target="_blank">
					<img src="images/icons/twitter_32x32.png" />
					</a>
				</div>
				<div class="grid_1 push_13">
					<a href="http://www.linkedin.com/in/sanchezlouis" target="_blank">
					<img src="images/icons/linkedin_32x32.png" />
					</a>
				</div>
				<div id="resume" class="grid_2 push_13 omega">
					<span>resume</span>
				</div>
			</div>
		</div>
			
		<!-- body (main content) -->
		<div id="body" class="container_24"></div>
		
		<!-- footer -->
		<div id="footer" class="container_24">
			<div id="footer_content" class="grid_24">
				<span class="cr">copyright&nbsp;&nbsp;&copy;&nbsp;&nbsp;2014&nbsp;&nbsp;Louis&nbsp;&nbsp;Sanchez</span>
			</div>
		</div>
	</div>
	
	<!-- resume contents -->
	<div id="resumediv"></div>
</body>
	
<!-- scripts -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	/**
	 * Collect global config
	 */
	 var config = {
	 	"basepath" : "<?php echo $config['basepath']; ?>",
		"baseurl"  : "<?php echo $config['baseurl'];  ?>"
	};
</script>
<script type="text/javascript" src="<?php echo $config['baseurl'];?>/javascript/SiteManager.js"></script>
<script type="text/javascript" src="<?php echo $config['baseurl'];?>/javascript/bootstrap.js"></script>
</html>
