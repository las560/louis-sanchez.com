$(document).ready(function() {
	
	// boolean for resume viewing
	var resume = 0;
	var mouseResume;
	
	/**
	 * viewing resume
	 */
    $('#resume').click(function(){
		
		// get the width and height of window
		var windowWidth= $(window).width();
		var windowHeight = $(window).height();
		
		// set up centering
		var pos = (windowWidth - 600) / 2;
		
        // dim the underlay
		$(".container_24").css({
			"opacity" : "0.3"
		});
		$("#rect").css({
			"opacity" : "0.3"
		});
		
		// make the div visible
		$("#resumediv").css({
			"left" : "" + pos + "px",
			"display" : "inline" 
		});	
		
		// animate the div
		$("#resumediv").animate({"height" : "" + windowHeight, "width" : "600"}, "slow", function() {
		
			// load the html into the div
			$("#resumediv").load("http://louis-sanchez.com/html/resume.html", function() {
				$("#resumediv").css({"overflow" : "auto"});
				resume = 1;	
			});
		});
    });
    
    /**
     * exiting the resume
     */
    $("#resumediv").hover(function() { 
        mouseResume = true; 
    	}, function() { 
        mouseResume = false; 
    }); 
     
    $("body").mouseup(function() {
        if (resume == 1 && !mouseResume) {

	        // make the div invisible
			$("#resumediv").css({
				"display" : "none",
				"width" : "0px",
				"height" : "0px"
			});
			
			$("#resumediv").html("");
			
			// restore opacity
        	$(".container_24").css({
				"opacity": "1.0"
			});
			
			$("#rect").css({
				"opacity": "1.0"
			});
			
			// switch
			resume = 0;
    	}
    }); 
});