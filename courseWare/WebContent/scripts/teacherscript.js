  $(document).ready(function(){
   $('.startcourse').click(function () {
         $('.weekcontainer').hide();
         $('.coursecontainer').hide();
        $('.requestform').show();
		})
     $('.editcourse').click(function () {
	      $('.requestform').hide();
		  $('.textfieldedit').hide();
		  $('.coursecontainer').show();
		  $('.weekcontainer').show();
		  $("[id^='cid']").hide();
		  })
		  $('.courselist').click(function () {
		       $('.requestform').hide();
			   $('.textfieldedit').hide();
			   $("[id^='cid']").hide();
			   $('#'+$("input[name='courseSelection']").val()).hide(); 
			   //$('#editor1').hide();
			  
					   })
		$('.weeklist').click(function () {
		        $('.requestform').hide();
				$('.weekcontainer').show();
				$('.textfieldedit').show();
				})
				
		     
		})