/**
 *    This is a palindrome
 *		hannah	(even)
 *		racecar	(odd)
 *
 *	mystring[start + +0] -> mystring[end - +0]
 * 	mystring[start + +1] -> mystring[end - +1]
 *	mystring[start + 2] -> mystring[end - 2]
 *	mystring[start + 3] -> mystring[end - 3]
 */	 


 var mystring = "A nut for a jar of tuna";
 var start = 0;
 var end = mystring.length - 1; 
 var middle = mystring.length / 2;
 
alert(mystring.length + " " + middle);

  
 function isPalindrome(mystring) {

	var isPalindrome = true;
 	
	// looping thru the string
	for (var i = start; i <= middle; i++) {
		if (mystring[start + i] != mystring[end - i]) {
			isPalindrome = false;
			break;
		}		
	}

	return isPalindrome;
 }

document.write("is " + mystring + " a palindrome?</br>");
document.write(isPalindrome(mystring));
 
 
 
 
 
 
 
 
 
 
 
 
 
