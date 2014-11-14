function application() {	
	
	/**
	 * SiteManager
	 * Global object that manages all other objects throughout the site
	 */
	function SiteManager() {
		
		// create a base view
		this.mainview = new View("body");
		
		
	}
	
	/**
	 * View
	 * A view is a visual container for content  
	 */  
	function View(name, parent) {
		if (typeof parent != "undefined") {
			this.parentname = parent.name;
		}
		else
			this.parentname = "undefined";
	
		this.name = name;
		this.load(name);
		this.views = {};
	}
	
	View.prototype.addChildView = function(name) {
		this.views[name] = new View(name, this);
	}
	
	/**
	 *
	
	/**
	 * Load a view
	 */ 
	View.prototype.load = function(view) {
		if (view != "body") {
			$("#"+this.parentname).load(config.baseurl+"/views/"+view+".php", function(response, status, xhr) {
				if (status == "error") {
					var msg = "Sorry but there was an error: ";
					$("#error").html(msg + xhr.status + " " + xhr.statusText);
				}
			});
		}
	}
}