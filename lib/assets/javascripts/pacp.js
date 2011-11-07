$(function() {
	// set opacity to nill on page load
	$("#main_nav span").css("opacity","0");
	// on mouse over
	$("#main_nav span").hover(function () {
		// animate opacity to full
		$(this).stop().animate({
			opacity: 1
		}, 'slow');
	},
	// on mouse out
	function () {
		// animate opacity to nill
		$(this).stop().animate({
			opacity: 0
		}, 'slow');
	});
});

$(function() {
	// set opacity to nill on page load
	$("#socialmedia span").css("opacity","0");
	// on mouse over
	$("#socialmedia span").hover(function () {
		// animate opacity to full
		$(this).stop().animate({
			opacity: 1
		}, 'slow');
	},
	// on mouse out
	function () {
		// animate opacity to nill
		$(this).stop().animate({
			opacity: 0
		}, 'slow');
	});
});
