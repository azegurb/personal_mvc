$(document).ready(function() {
 
 var owl = $("#owl-demo");
 
  owl.owlCarousel({
      items : 5, //10 items above 1000px browser width
      itemsDesktop : [1200,4], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,2], // betweem 900px and 601px
      itemsTablet: [600,1], //1 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
  });
 
  // Custom Navigation Events
  $(".next").click(function(){
    owl.trigger('owl.next');
  })
  $(".prev").click(function(){
    owl.trigger('owl.prev');
  })
  $(".play").click(function(){
    owl.trigger('owl.play',2000); //owl.play event accept autoPlay speed as second parameter
  })
  $(".stop").click(function(){
    owl.trigger('owl.stop');
  })
 
	
/*
for(var i = 1; i <= 6; i++) {
	
	$("#bg_color" + i).mouseover(function(){
        //$(this).css("background-color", "#fff");
		$(".categoria_block"+i).css("display", "block");
		$(".categoria_in2").css("display", "none");
    });
	$(".categoria_block"+i).mouseover(function(){
       // $(this).css("background-color", "#fff");
		$(".categoria_block"+i).css("display", "block");
		$(".categoria_in2").css("display", "none");
    });
	
    $("#bg_color" + i).mouseout(function(){
        //$(this).css("background-color", "#FF9933");
		$(".categoria_block"+i).css("display", "none");
		$(".categoria_in2").css("display", "block");
    });
}

*/
  $('#inlineRadio1').click(function() {
        $('#exampleInputText4').attr("disabled", true);
		$('.form-group select').attr("disabled", true);
		$('#exampleInputText1').attr("disabled", false);  
		$('#exampleInputText2').attr("disabled", false); 
		$('#exampleInputText3').attr("disabled", false); 		
    });
	
	$('#inlineRadio2').click(function() {
        $('#exampleInputText1').attr("disabled", true);  
		$('#exampleInputText2').attr("disabled", true); 
		$('#exampleInputText3').attr("disabled", true);  
		$('#exampleInputText4').attr("disabled", false);
		$('.form-group select').attr("disabled", false);
    });

	
		
/*
	$(window).resize(function(){
		if($(window).width() < 1000) {
		 $(".left-frame_in").hide();
		 }
		
		 else {
		 $(".left-frame_in").show();
		 }
	});
	*/
});