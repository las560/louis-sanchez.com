function createVisualKeyboard() {
	var i, j, k, l, elem;
	var keys = { 0: "q", 1: "w", 2: "e", 3: "r", 4: "t", 5: "y", 6: "u", 7: "i", 8: "o", 9: "p",
				 10: "a", 11: "s", 12: "d", 13: "f", 14: "g", 15: "h", 16: "j", 17: "k", 18: "l",
				 19: "z", 20: "x", 21: "c", 22: "v", 23: "b", 24: "n", 25: "m" };


	var letters = {"a": 5, "z": 0};
	
	for (i = 0; i < 3; i++) {
		
		switch(i) {
			case 0: k = 0
					l = 10;
					elem = $("#top");
					break;
			case 1: k = 10;
					l = 9;
					elem = $("#middle");
					break;
			case 2: k = 19;
					l = 7;
					elem = $("#bottom");
					break;
			default: alert("something is wrong in switch");
					break;
		}	
		
		for (j = k; j < k + l; j++) {
			elem.append("<div id='" + keys[j] + "' class='key'>" + keys[j] + "</div>");
		}
	}
}

$(document).ready(function() {

	// set textfield focus
	$("#textinput").focus();
	
	// create visual keyboard
	createVisualKeyboard();
	
	// special keys
	var specialkeys = {32 : "spacebar"};
	var e, key;
	
	$("#textinput").keypress(function(event) {
		
		e = event.which;
		
		switch(e) {
			case 32:	key = "spacebar";
						break;
			default: 	key = String.fromCharCode(e);
						break;
		}
		
		// flicker div
		$("#" + key).animate({ "backgroundColor": "#5882FA" }, 100, function() {
			$(this).css({"background-color": "#C8C8C8"});
		});
		
	});
	
	
});
