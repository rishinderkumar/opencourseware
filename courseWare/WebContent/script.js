$(document).ready(function(){
$('#login').click(function () {
               $('#blogin').val("");
		        $('#bpassword').val("");
				$('.overlay').show();
				$('.popup').show();
				                                 
				})
	
			$('#popClose').click(function () {
             		$('.overlay').hide();
				$('.popup').hide();

				})		
				
			$('#sub').click(function () {
			   if($('#bpassword').val() == "")
             	alert("please enter password");

				})		
		})
		