$(document).ready(function() {
	
	/**
	 * Test for mouse over selection in picker
	 */
	$(".project_list").mouseover(function(){
		$(this).clearQueue();
		$(this).animate({"left" : "+=75px"}, "1000");
	
	});

	/**
	 * Test for mouse out of selection in picker
	 */
	$(".project_list").mouseout(function(){
		$(this).animate({"left" : "-=75px"}, "1000");
	});
});