
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="script/jquery-1.7.2.min.js"></script>
 <script src="script/teacherscript.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Place inside the <head> of your HTML -->

<link rel="stylesheet" type="text/css" href="CSS_student/studentStyle.css" />
<link rel="stylesheet" type="text/css" href="dropdown.css" />
<link rel="stylesheet" type="text/css" href="styletemp.css" />
<title>Student Homepage</title>
</head>
<body>
<div id="wrapper">
<div id="header">
<div class="container">
<div id="logoArea"></div>

<div class="headernavArea">
<ul id= "headernav">
<a href="logout.jsp"><li align="right"><% HttpSession s = request.getSession(); out.println(s.getAttribute("uname"));%>
<ul id="headernav"><li > logout</li></ul></li>  </a> </div>
</div></div>
<div id="menuArea">
<div class="container">
<div class="navArea">
<ul id= "nav">

<a href="#"><li align="right"> &nbsp &nbsp Home &nbsp &nbsp</li></a>
<a href="#"><li align="right" class="courselibrary">Course Library&nbsp </li></a>
<a href="#"><li align="right" class="enrolledcourses">Enrolled Courses&nbsp</li></a>

</ul>
</div>
</div>
</div>
<div id="mainArea">
<div class="course-lib-container">
</div>
	<div class="enrolledcontainer">
	</div>	
		<div class="enrolledweek">
			 
		
		 <div class="weekcontent">
		 </div>
		

 
<!--  -------------------------------------------------------------------------------->
   

 </div>
  </div>
  <div id="footer">

<div class="container ">A website by Karthik Hareesh & Rishinder
</div>
</div>
  <div class="clearfooter"></div>

 

<!--  ----------------------- Footer End ------------------------------------ -->
</body>
</html>