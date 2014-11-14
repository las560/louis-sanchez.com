$(document).ready(function() {
	
	$(".text").focus(function() {
		$(this).attr("value", "").css({"color" : "#000000"});
	});
});