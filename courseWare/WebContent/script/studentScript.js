$(document).ready(function(){
			$('.enrolledcourses').click(function () {
		    	$('.enrolledweek').hide();
			    $('.course-lib-container').hide();
				$('.enrolledcontainer').show();
				 $('.weekcontent').hide();
				
				})
				$('.enrolledcontainer').click(function () {
		        
				 
			
				
				  $('.course-lib-container').hide();
				$('.enrolledweek').show();
				  $('.weekcontent').hide();
				
				})
				   $('.courselibrary').click(function () {   
                                  $('.course-lib-container').load('./clibrary.html');
								   

								   
								  
								   $('.enrolledweek').hide();
								   $('.enrolledcontainer').hide(); 
								   $('.course-lib-container').show();
								   $('.weekcontent').hide();
								   
                            })
					 $('.enrolledweek').click(function () {   
                                  
								  
								  
								   
								  
								    $('.course-lib-container').hide();
								   $('.enrolledweek').show();
								   $('.enrolledcontainer').show();
                                    $('.weekcontent').show();								   
								  
								   
                            })
								})
                    							
				