$(document).ready(function() {
	$('.course-lib-container').load('allCourses.jsp');
	
	$('.courselibrary').click(function() {

		$('.course-lib-container').load('allCourses.jsp');
		$('.requestform').hide();
		$('.coursecontainer').hide();
		$('.weekcontainer').hide();
		$('.textfieldedit').hide();
		$('.enrolledweek').hide();
		$('.enrolledcontainer').hide();
		$('.course-lib-container').show();
		$('.weekcontent').hide();

	})
					$('.startcourse').click(function() {
						$('.weekcontainer').hide();
						$('.enrolledcontainer').hide();
						$('.coursecontainer').hide();
						$('.enrolledweek').hide();
						$('.course-lib-container').hide();
						$('.requestform').show();
						$('.weekcontent').hide();
					})
					$('.editcourse').click(function() {
						$('.requestform').hide();
						$('.enrolledcontainer').hide();
						$('.textfieldedit').hide();
						$('.enrolledweek').hide();
						$('.course-lib-container').hide();
						$('.coursecontainer').show();
						$('.coursecontainer').load("editcourse.jsp");
						$('.weekcontainer').show();
						$("[id^='cid']").hide();
						$('.weekcontent').hide();
					})
					$('.courselist').click(function() {
										$('.requestform').hide();
										$('.enrolledcontainer').hide();
										$('.enrolledweek').hide();
										$('.textfieldedit').hide();
										$('.course-lib-container').hide();
										$('.weekcontainer').load("week.jsp?cid="+ $("input[name='courseSelection']:checked").val());
										//$("[id^='cid']").hide();
										// $('#'+$("input[name='courseSelection']:checked").val()).show();
										$('.weekcontent').hide();

									})
					$('.weeklist').click(function() {
						$('.requestform').hide();
						$('.enrolledcontainer').hide();
						$('.enrolledweek').hide();
						$('.course-lib-container').hide();
						$('.weekcontainer').show();
						$('.textfieldedit').show();
						$('.weekcontent').hide();
					})
					$('.enrolledcourses').click(function() {
						$('.requestform').hide();
						$('.coursecontainer').hide();
						$('.weekcontainer').hide();
						$('.textfieldedit').hide();
						$('.enrolledweek').hide();
						$('.course-lib-container').hide();
						$('.enrolledcontainer').show();
						$('.enrolledcontainer').load("enrolledcourses.jsp");
						$('.weekcontent').hide();

					})
					$('.enrolledlist').click(function(){
						$('.enrolledweek').show();
						$('.enrolledweek').load("enrollweek.jsp?cid="+$("input[name='EcourseSelection']:checked").val());
						$('.requestform').hide();
						$('.coursecontainer').hide();
						$('.weekcontainer').hide();
						$('.textfieldedit').hide();
						$('.course-lib-container').hide();
						$('.enrolledweek').show();
						$('.weekcontent').show();

									})
				
					/*
					 * $('.enrolledweek').click(function () {
					 * 
					 * $('.requestform').hide(); $('.coursecontainer').hide();
					 * $('.weekcontainer').hide(); $('.textfieldedit').hide();
					 * $('.course-lib-container').hide();
					 * $('.enrolledweek').show();
					 * 
					 * $('.weekcontent').show();
					 * 
					 *  })
					 */

				})