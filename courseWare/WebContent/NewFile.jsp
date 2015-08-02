<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Place inside the <head> of your HTML -->
<script src="script/ckeditor_4.4.3_standard/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function getEditedText() {
		var text = ""
		if (!CKEDITOR.env.isCompatible)
			alert("Your browser is not compatible with editor tool please update your browser to IE8 or chrome or firefox");

		var text = CKEDITOR.instances.editor1.getData();

		alert(text)
	}
</script>
<%
	HttpSession s = request.getSession();
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null, rs1 = null, temp = null;
%>
<link rel="stylesheet" type="text/css" href="CSS_teacher/style.css" />
<link rel="stylesheet" type="text/css" href="CSS_teacher/popup.css" />
<link rel="stylesheet" type="text/css" href="styletemp.css" />
<title>Teacher Homepage</title>
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="logoArea"></div>
			<div class="titleArea">
				<ul id="title">
					<li align="left"><font color="gray">E-Learning Through</br>OpenCourseWare
					</font></li>
			</div>
			<div class="headernavArea">
				<ul id="headernav">
					<a href="header.html"><li align="right">Go back!</li> </a>
			</div>
		</div>
	</div>
	<div id="menuArea">
		<div class="container">
			<div class="navArea">
				<ul id="nav">

					<a href="#"><li align="right">&nbsp&nbspHome&nbsp&nbsp</li></a>
					<a href="#"><li align="right">Course Library&nbsp</li></a>
					<a href="#"><li align="right" class="enrolledcourses">Enrolled
							Courses&nbsp</li></a>
					<a href="#"><li align="right" class="startcourse">Start
							Course&nbsp</li> </a>
					<a href="#"><li align="right" class="editcourse">Edit
							Course&nbsp</li> </a>
					<li class="nav-search">
						<form action="#">
							<input type="text" placeholder="Search..."> <input
								type="submit" value="">
						</form>
					</li>

				</ul>
			</div>
		</div>
	</div>

	<div id="mainArea">
		<div class="container page">
			<!--  -------------------------------------------------------------------------------->

			<div class="userheader_bg">
				<div class="logo"></div>
				<div class="tool_bg"></div>

			</div>

			<div class="tool_action">
				<div class="requestform">
					<form name="startform" method="post" id="requestform" action="">
						<table class="request_table" name="course_request">
							<tbody>
								<tr>
									<td colspan="2" id="form_header">Send request to start a
										course</td>
								</tr>
								<tr>
									<td class="tablefields">Title:</td>
									<td class="tablefields"><input type="text"
										required="required" name="title" value="" id="title"></td>
								</tr>
								<tr>
									<td class="tablefields">Stream:</td>
									<td class="tablefields"><input list="stream"
										required="required" name="stream"> <datalist
												id="stream">
											<option value="Computer Science">
												<option value="Electronincs">
													<option value="Electrical">
														<option value="Information Technology">
															<option value="Mechanical">
																<option value="Civil">
											</datalist></td>
								</tr>
								<tr>
									<td class="tablefields">Number of Weeks:</td>
									<td class="tablefields"><input type="number"
										required="required" min="1" step="1" name="weeks" id="weeks"
										value=""></td>
								</tr>
								<tr>
									<td class="tablefields">Enter course details:</td>
									<td class="tablefields"><textarea rows="3" cols="17"
											required="required"></textarea></td>
								</tr>
								<tr>
									<td colspan="2" class="tablefields"><input type="submit"
										value="Send Request" id="request_button"></td>
							</tbody>
						</table>
					</form>
				</div>

			</div>

			<div class="coursecontainer">
				<!--- List of courses need to be appended using jsp 
		---->
				<%try{
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
					stmt=con.createStatement();
					rs = stmt.executeQuery("select * from `courseware`.`course` where is_published=0 and is_approved=1 and authorId in (select id from `courseware`.`user` where userName='"+ s.getAttribute("uname") + "')");
						while (rs.next()) {
							out.println("<ul class='courselist' > <input type='radio' name='courseSelection' uncheched value='cid"+ rs.getString("cid")+ "'>"+ rs.getString("course_title") + "</ul>");
						}
					} catch (Exception e) {
						out.println("error:" + e.getMessage());
						e.printStackTrace();
					}
				%>
			</div>
			<div class="weekcontainer">
				 <%
	  try{
	    rs.beforeFirst();
	    while(rs.next())
	    {
	    	 out.println("<ul class='weeklist' id='cid"+rs.getString("cid")+"'>");
	    	 int now=Integer.parseInt(rs.getString("no_of_weeks")),i=1;
	    	 while(i<=now)
	    	 {
	    		 out.println("<li>week"+i+"</li>");
	    	/*	 File[] list=test.readFolder("../videos/"+rs.getString("course_title")+"/week"+i);
	    		 for (int j = 0; j < list.length; j++) 
	    		  {
	    		 out.println("<div id='wb_MediaPlayer1' style='position:absolute;left:196px;top:107px;width:566px;height:371px;z-index:0;'>");
	    		 out.println("<video src='"+list[i]+"' id='MediaPlayer1' controls='controls' preload='auto' width='566' height='371'></video>");
	    		 
	    		 }*/
	 		 i++;
	    	 }
	    	    out.println("</ul>");
	    	
	    }
	  }
	  catch(Exception e)
	  {e.printStackTrace();}
	  %>	
	  		<ul>
					<input type="file" value="Attach"> attach file
				</ul>
				<ul>
					<li><input type="button" id="save" value="save" name="save" />
						<input type="button" id="publish" value="publish"
						onclick="getEditedText()" name="Publish" />
						</form>
				</ul>
				<!--- List of weeks need to be appended using jsp 
		---->
			</div>
			<div class="enrolledcontainer">
				<h2>Enrolled courses must be displayed. Click here for viewing
					the week wise course content</h2>
					<%
		  try{
			  
			  temp=stmt.executeQuery("select * from `courseware`.`course` where cid in (select cid from `courseware`.`user_enrollment` where id in (select id from `courseware`.`user` where username='"+s.getAttribute("uname")+"'))");
		   while(temp.next())
		    {
		    	out.println("<ul class='enrolledlist' > <input type='radio' name='courseSelection'  value='ecid"+temp.getString("cid")+"'>"+temp.getString("course_title")+"</ul>");
		    }

		%>
			</div>
			<div class="enrolledweek"> 
	   <%
	    temp.beforeFirst();
	    while(temp.next())
	    {
	    	 out.println("<ul id='ecid"+temp.getString("cid")+"'>");
	    	 int now=Integer.parseInt(temp.getString("no_of_weeks")),i=1;
	    	 while(i<=now)
	    	 {
	    		 out.println("<li>week"+i+"</li>");
	    		 i++;
	    	 }
	    	 out.println("</ul>");
	    	
	    }
		  }
		catch(Exception e){
			e.printStackTrace();
		}
	  %>
			</div>
			<div class="weekcontent">
				<h3>week content to be displayed</h3>
			</div>
			
			<script src="script/teacherscript.js"></script>


		</div>
		<div id="footer">

			<div class="container ">A website by Karthik Hareesh &
				Rishinder</div>
		</div>
		<!--  ----------------------- Footer End ------------------------------------ -->
</body>

</html>