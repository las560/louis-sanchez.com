<?php

$config = array (
	"basepath" => realpath(dirname(__FILE__)),
	"baseurl"  => "//".$_SERVER['HTTP_HOST'].str_replace($_SERVER['DOCUMENT_ROOT'], '', str_replace('\\', '/', dirname(__FILE__)))
);

?>
