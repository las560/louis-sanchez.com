/**
 * Config file used for Site
 */
 
var path = window.location.href.split("/");
path.pop();
path = path.join("/");
 
 var config = {
 	'baseurl' : path,
 };