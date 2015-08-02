			$(document).ready(function(){
				 $('.requestlist-container').load('cRequest.jsp');
				 $('.courselibrary').click(function () {  
                      $('.userlist-container').hide();	
                      $('.requestlist-container').hide();								   
                     $('.course-lib-container').load('cList.jsp');
					   $('.course-lib-container').show();
				    })
                 $('.userlist').click(function () {   
					              $('.course-lib-container').hide();
								  $('.requestlist-container').hide();
								  $('.userlist-container').show();
								  $('.userlist-container').load('uList.jsp');
								 
					})
				 $('.requestlist').click(function () {   
					              $('.course-lib-container').hide();
                                  $('.userlist-container').hide();
                                  $('.requestlist-container').show();
								  $('.requestlist-container').load('cRequest.jsp');
								   
                    })
				    			
	       			})
                    							
				