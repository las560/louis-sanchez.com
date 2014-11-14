/**
 * ResumeManager class
 * Maintains the resume actions throughout the site
 */
function ResumeManager() {
	
	// booleans for viewing the resume
	this.resume = 0;
	this.mouseResume;
	
}

/**
 * opening the resume
 */
ResumeManager.prototype.openResume = function() {
	
	// store reference to this object
	var that = this;

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
			that.resume = 1;
		});
	});
}	


/**
 * closing the resume
 */
ResumeManager.prototype.closeResume = function() {
	
	// store reference to this object
	var that = this;
	
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
	that.resume = 0;
}

/***********************************************************************************************/

/**
 * Rectangle class
 * Animated rectangle that moves with site navigation
 */
 
function Rectangle() {
	this.current = "#home";
	this.left;
	this.top;
}


/**
 * loading the html for a section
 */
Rectangle.prototype.loadHTMLFor = function(section, obj) {
	
	// store reference to this object
	var that = this;
	
	switch(section) {
		case "homepage": 	$("#" + section).load("html/home.html", function() {
						 	
							 	// set the rectangle for the homepage
							 	that.setHome();

								// prepare animations for the homepage
								obj.resetAnimation();
								
								// animate the images
								obj.animate(obj);
							 });
							 break;
		
	}
}

/**
 * setting the rectangle to homepage
 */
Rectangle.prototype.setHome = function() {
	
	// store reference to this object
	var that = this;
	
	that.left = $("#louis_div").offset().left;
	that.top = $("#louis_div").offset().top;
	$("#rect").offset({"left" : that.left, "top" : that.top});
	$("#rect").css("visibility", "visible");
}

/**
 * setting the rectangle to a section
 */
Rectangle.prototype.setSection = function(section, last, islider) {

	// store reference to this object
	var that = this;	
	
	// fade last section
	$(last).fadeOut("slow", function() {
	$(last).css("visibility", "hidden");	
		
		// animate rectangle based on section
		switch(section) {
			case "#homepage":  $("#rect").animate({"width": "1060px"}, "slow", function() {
									$(section).css("visibility", "visible");
									$(section).fadeIn("slow", function() {
										islider.pause = false;
										islider.animate(islider);
									});		
							   });
						   	   break;
			case "#aboutpage": $("#rect").animate({"width": "350px"}, "slow");
						   	   break;
			default:		   break;
		}
		
	});
}

/***********************************************************************************************/

/**
 * ImageSlider class
 * Slides images across the homepage
 */
function ImageSlider() {
	
	this.pause = false;
	this.images;
	this.center;
	
	// variables used for image queuing
	this.current;
	this.next;
	this.pos;
	this.travel;
}

/**
 * set up animations
 */
ImageSlider.prototype.resetAnimation = function() {
	
	// store reference to this object
	var that = this;
	
	// image ID's
	that.images = new Array(1, 2, 3, 4, 5);
	
	// check if the center image has loaded
	$("#louis_frame").load(function() {
		
		// get starting position for default image
		that.center = Math.floor(window.innerWidth/2);
		//alert("center: " + that.center);
	
	
		// position default image
		$("#1").offset({"left" : that.center});	
	});	
}

/**
 * animate images across the homepage
 */
ImageSlider.prototype.animate = function(that) {
	
	// get the images to be animated
	that.current = that.images.shift();	
	that.next = that.images[0];

	// get center of screen in case window is resized
	that.center = Math.floor(window.innerWidth/2);
	//that.center = $("#" + that.current).offset().left;
	//alert("center: " + that.center);
	
	//  get position of the next image
	that.pos = $("#" + that.next).offset().left;
	//alert("pos: "+that.pos);
	
	// compute distance to travel
	that.travel = that.pos - that.center;
	//alert ("travel: " + that.travel);

	// slide the current image into and out of view
	$("#" + that.current).delay(2000)
				  .animate({"left" : "-=" + that.travel + "px"}, "slow", function() {
				  $("#" + that.current).offset({"left" : that.pos});
				  that.images.push(that.current); 
	});

	$("#" + that.next).delay(2000)
			   .animate({"left" : "-=" + that.travel + "px"}, "slow", function() {
			   if (that.pause)
				   clearTimeout(t);
			   else
				   var t = setTimeout((function() { that.animate(that);}), 0000);
	});
}

/***********************************************************************************************/

/**
 * SiteManager class
 * Global object that keeps track of all other objects throughout the site
 */
function SiteManager() {
	
	//this.imageslider = new ImageSlider();
	//this.resumemanager = new ResumeManager();
	//this.rectangle = new Rectangle();
	
}

/***********************************************************************************************/

/**
 * Site Opetations
 */
 
// create global site manager
var s = new SiteManager();

$(window).load(function() {
	
	/**
     * set up the current section of the site
     */
    s.rectangle.loadHTMLFor("homepage", s.imageslider);
    //s.imageslider.resetAnimation();
    
});

$(document).ready(function() {

	/**
	 * clicking the resume
	 */
    $("#resume").click(function(){
		s.resumemanager.openResume();
    });
    
    /**
     * exiting the resume
     */
    $("#resumediv").hover(function() { 
        s.resumemanager.mouseResume = true; 
    	}, function() { 
        s.resumemanager.mouseResume = false; 
    }); 
     
    $("body").mouseup(function() {
        if (s.resumemanager.resume == 1 && !s.resumemanager.mouseResume) {
    		s.resumemanager.closeResume();
		}
    });
	
	/**
	 * if the user clicks home
	 */
	$("#home").click(function() {
		if (s.rectangle.current != "#home") {
			s.rectangle.setSection("#homepage", s.rectangle.current + "page", s.imageslider);
			s.rectangle.current = "#home";
		}					
	});
	
	/**
	 * if the user selects about me
	 */
	$("#about").click(function() {
		if (s.rectangle.current != "#about") {
			s.imageslider.pause = true;
			s.rectangle.setSection("#aboutpage", s.rectangle.current + "page");
			s.rectangle.current = "#about";
		}
	});
});
