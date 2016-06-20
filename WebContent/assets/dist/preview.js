/*
 * Url preview script 
 * powered by jQuery (http://www.jquery.com)
 * 
 * written by Alen Grakalic (http://cssglobe.com)
 * 
 * for more info visit http://cssglobe.com/post/1695/easiest-tooltip-and-image-preview-using-jquery
 *
 */

this.screenshotPreview = function(){	
	/* CONFIG */
		
		xOffset = 5;
		yOffset = -165;
		
		// these 2 variable determine popup's distance from the cursor
		// you might want to adjust to get the right result
		
	/* END CONFIG */
	$(".screenshot").hover(function(e){
		e.preventDefault();
		this.t = this.title;
		this.title = "";	
		$("body").append("<img id='screenshot' class='preview' src='"+ this.rel +"' alt='url preview' />");			
		$("#screenshot")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px")
			.fadeIn("slow");						
    },
	function(){
		this.title = this.t;	
		$("#screenshot").remove();
    });	
	$(".screenshot").mousemove(function(e){
		$("#screenshot")
			.css("top",(e.pageY - xOffset) + "px")
			.css("left",(e.pageX + yOffset) + "px");
	});			
};

$(function(){
	
});
