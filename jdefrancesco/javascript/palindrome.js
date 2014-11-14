/** 
 * This is a Palindrome
*/
 
 
 
 $(document).ready(function() {
 	
 	$("#enter").click(function() {
 	
 	var mystring = $("#palindrome").attr("value");
 	var start = 0;
 	var end = mystring.length - 1;
 	var middle = mystring.length / 2;
 
 	
 		alert("is " + mystring + " a palindrome?\n" + isPalindrome(mystring, start, end, middle));
 	});
 
 	
}); 
 
 
 function isPalindrome(mystring, start, end, middle) {
 
 var isPalindrome = true;
 	
	//looping through the string
	for (var i = start; i <= middle; i++) {
		if (mystring[start + i] != mystring[end - i]) {
			isPalindrome = false;
			break; 
		}
	}
	return isPalindrome;
 	
}
