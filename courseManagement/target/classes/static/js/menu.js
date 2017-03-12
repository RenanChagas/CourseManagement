function openNav() {
	document.getElementById("mySidenav").style.display = "block";
}

function closeNav() {
	document.getElementById("mySidenav").style.display = "none";
}


$(document).ready(function(){
	
	//Window refresh
    if ($(window).width() <= 600) {
      $("#nav-mobile li").show();
    }
    if ($(window).width() <= 730){
      $("#nav-mobile li").hide();
      $("#nav-mobile li a.active").closest("li").show();
    }
    if ($(window).width() > 730) {
      $("#nav-mobile li").show();
    }
	
	//Window Resize
    $(window).resize(function() {
      if ($(window).width() <= 600) {

      }
      else if ($(window).width() <= 730) {
        $("#nav-mobile li").hide();
        $("#nav-mobile li a.active").closest("li").show();
        $("#nav-mobile").css({ "min-width": "inherit" });
      }
      else if ($(window).width() > 730) {
        $("#nav-mobile li").show();
      }
    });
	
		//Scroll fixed
		$(window).scroll(function(){
      if ($(this).scrollTop() > 148) {
        $('#menu_nav').addClass('mdc-fixed');
      } else {
        $('#menu_nav').removeClass('mdc-fixed');
      }

    });

});