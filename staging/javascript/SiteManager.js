/**
 * SiteManager class
 * Global object that keeps track of all other objects throughout the site
 */
function SiteManager() {

	// the XMLHTTPTRequest obj
	this.xhr;
	
	// init the SiteManager
	this.init();

	//this.imageslider = new ImageSlider();
	//this.resumemanager = new ResumeManager();
	//this.rectangle = new Rectangle();
}

/**
 * Operations to be performed on manager creation
 */
SiteManager.prototype.init = function() {

	// create the xhr obj
	if (window.XMLHttpRequest) {
		this.xhr = new XMLHttpRequest();

		if (typeof this.xhr.overrideMimeType != 'undefined') {
			this.xhr.overrideMimeType('text/xml');
		}
	}

	else if (window.ActiveXObject) {
		this.xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}

	else {
		alert('Perhaps your browser does not support xmlhttprequests?');
	}
}

/**
 * Load dynamic content into target HTML object
 */
SiteManager.prototype.load = function(url, target) {

	// grab instances
	var xhr = this.xhr;

	// make the asychronous request
	xhr.open('GET', url, true);
	xhr.send(null);

	// get the results
	xhr.onreadystatechange = function() {

		// if call is complete
		if (xhr.readyState == 4) {

			// success
			if (xhr.status == 200 || xhr.status == 0) {
				document.getElementById(target).innerHTML = xhr.responseText;
			}

			// error
			else {
				alert(xhr.status);
			}
		}

		// if call is incomplete
		else {}		
	};
}
