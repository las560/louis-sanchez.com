/**
 * predeclarations
 */
var images;
var center;

// variables used for image queuing
var current;
var next;
var pos;
var travel;

// prepare animations
resetAnimation();

// animate the images
animate();

/**
 * set up animations
 */
function resetAnimation() {
	
	// image ID's
	images = new Array(1, 2, 3, 4, 5);
	
	// get starting position for default image
	center = $("#louis_frame").offset().left + 50;
	
	// position default image
	$("#1").offset({"left" : center});		
}

/**
 * animate images across the homepage
 */
function animate() {
		
	// get the images to be animated
	current = images.shift();
	next = images[0];

	// get center of screen in case window is resized
	center = $("#"+current).offset().left;

	//  get position of the image
	pos = $("#"+next).offset().left;
	
	// compute distance to travel
	travel = pos - center;

	// slide the current image into and out of view
	$("#"+current).delay(2000)
				  .animate({"left" : "-=" + travel + "px"}, "slow", function() {
				  $("#"+current).offset({"left" : pos});
				  images.push(current); 
	});

	$("#"+next).delay(2000)
			   .animate({"left" : "-=" + travel + "px"}, "slow", function() {
			   setTimeout(animate, 0000);
	});
}
console.log(s);
$("#home").click(function () {
	
});