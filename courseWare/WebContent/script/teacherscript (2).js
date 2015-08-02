  $(document).ready(function(){
   $('.startcourse').click(function () {
         $('.weekcontainer').hide();
		  $('.enrolledcontainer').hide();
         $('.coursecontainer').hide();
		 $('.enrolledweek').hide();
        $('.requestform').show();
		})
     $('.editcourse').click(function () {
	      $('.requestform').hide();
		   $('.enrolledcontainer').hide();
		  $('.textfieldedit').hide();
		  $('.enrolledweek').hide();
		  $('.coursecontainer').show();
		  })
		  $('.courselist').click(function () {
		       $('.requestform').hide();
			   $('.enrolledcontainer').hide();
			   $('.enrolledweek').hide();
			   $('.textfieldedit').hide();
			    $('.weekcontainer').show();
			  
			  
					   })
		$('.weeklist').click(function () {
		        $('.requestform').hide();
				 $('.enrolledcontainer').hide();
				 $('.enrolledweek').hide();
				$('.weekcontainer').show();
				$('.textfieldedit').show();
				})
				$('.enrolledcourses').click(function () {
		        $('.requestform').hide();
				 $('.coursecontainer').hide();
				$('.weekcontainer').hide();
				$('.textfieldedit').hide();
				$('.enrolledweek').hide();
				$('.enrolledcontainer').show();
				
				})
				$('.enrolledcontainer').click(function () {
		        $('.requestform').hide();
				 $('.coursecontainer').hide();
				$('.weekcontainer').hide();
				$('.textfieldedit').hide();
				
				$('.enrolledweek').show();
				
				})
				
				
		    
		})