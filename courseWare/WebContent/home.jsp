<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html>
<head>
<title>Welcome to OpenCourseware
</title>
<link href="styletemp.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="wrapper">
<%
	try{
		String s=(String)request.getAttribute("result");
		if(s!=null)out.println("<script>alert(\" "+s+" \" );</script>");
	}catch(Exception e){e.printStackTrace();}
%>
<script src="script/jquery-1.7.2.min.js"></script>
<div id="header">
<div class="container">
<div id="logoArea"></div>
<div class="headernavArea">
<ul id= "headernav">
<a href="SignUp.jsp"><li align="right">Get Started</li>  </a> </div>
</div></div>
<div id="menuArea">
<div class="container">
<div class="navArea">
<ul id= "nav">
<a href="#"><li align="left" class="home">Home</li></a>
<a href="#"><li align="left" class="course-library">Course Library</li></a>
<a href="#"><li align="left">About us</li>  </a> 
</ul>
</div>
</div>
</div>
<div id="mainArea">


<div class="container page">
<div class="homecontents"></div>
<div class="courselist"></div>
<script >
$(document).ready(function(){
    $('.course-library').click(function(){
    	$('.courselist').show();
    	$('.courselist').load('allCourses.jsp');
		$('.homecontents').hide();
    })
    $('.home').click(function(){
    	$('.homecontents').show();
    	$('.courselist').hide();
    })
})
</script>

















<!---------------   Enter your   content here --------------------------------------------------->

















</div>
</div>
<div id="footer">
<div class="container ">A website by Karthik Hareesh & Rishinder
</div>
</div>
<div class="clearfooter"></div>
</div>
</body>
</html>
