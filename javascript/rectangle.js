$(document).ready(function() {
	
	// keeps track of current module
	var last = "#home";
	
	// set the current section
	setHome();
	
	$("#home").click(function() {
		if (last != "#home")
			setSection("#homepage", last+"page");
		last = "#home";
	});
	
	$("#about").click(function() {
		if (last != "#about")
			setSection("#aboutpage", last+"page");
		last = "#about";
	});
});

function setHome() {	
	var left = $("#louis_div").offset().left;
	var top = $("#louis_div").offset().top;
	$("#rect").offset({"left" : left, "top" : top});
	$("#rect").css("visibility", "visible");
}

function setSection(section, last) {
	
	// fade last section
	$(last).fadeOut("slow", function() {
		//$(last).css("visibility", "hidden");	
		
		// animate rectangle based on section
		switch(section) {
			case "#homepage":  $("#rect").animate({"width": "1060px"}, "slow", function() {
									$(section).css("visibility", "visible");
									$(section).fadeIn("slow");		
							   });
						   	   break;
			case "#aboutpage": $("#rect").animate({"width": "350px"}, "slow");
						   	   break;
			default:		   break;
		}
		
	});
}