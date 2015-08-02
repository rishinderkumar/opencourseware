<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<%
	HttpSession s = request.getSession();
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null, rs1 = null, temp = null;
	try{
		if(request.getAttribute("status")!=null && request.getAttribute("status").equals("1"))
				out.println("<script>alert(\"request sent successfully\")</script>");
		 }catch(Exception e){e.getMessage();e.printStackTrace();}
%>
<link rel="stylesheet" type="text/css" href="CSS_teacher/style.css" />

<link rel="stylesheet" type="text/css" href="styletemp.css" /><!--- style temp content has been changed -->
<link rel="stylesheet" type="text/css" href="./dropdown.css" /><!--- added--->
<title>Teacher Homepage</title>
</head>
<body>
<div id="wrapper"><!--- new div wrapper --->
	<div id="header">
		<div class="container">
			<div id="logoArea"></div>
		<!---	<div class="titleArea">
				<ul id="title">                                                                 
					<li align="left"><font color="gray">E-Learning Through</br>OpenCourseWare                    title  area removed 
    					</font></li>
			</div> --->
<div class="headernavArea">
<ul id= "headernav">
<a href="logout.jsp"><li align="right"><%  out.println(s.getAttribute("uname"));%>
<ul id="headernav"><li > logout</li></ul></li>  </a> </div>

</div></div>
	<div id="menuArea">
		<div class="container">
			<div class="navArea">
				<ul id="nav">

					<a href="#"><li align="right">&nbsp&nbspHome&nbsp&nbsp</li></a>
					<a href="#"><li align="right" class="courselibrary">Course
							Library&nbsp</li></a>

					<a href="#"><li align="right" class="startcourse" id="tostart">Start
							Course &nbsp</li> </a>
					<a href="#"><li align="right" class="editcourse">Edit
							Course &nbsp</li> </a>
					<a href="#"><li align="right" class="enrolledcourses">Enrolled
							Courses &nbsp</li></a>
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
				<div class="requestform" >
				 <%
	   out.print("<form  name='startform' method='post' id='requestform' action='/courseWare/sendRequest.jsp?teacher='"+s.getAttribute("uname")+"'>");
	    		  %>	<table class="request_table" name="course_request">
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
											required="required" name='details'></textarea></td>
								</tr>
								<tr>
									<td colspan="2" class="tablefields"><input type="submit"
										value="Send Request" id="request_button"></td>
							</tbody>
						</table>
					</form>
					
				</div>

			</div>
			<div class="course-lib-container"></div>

			<div class="coursecontainer">
			<%--
					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						rs = stmt.executeQuery("select * from `courseware`.`course` where is_published=0 and is_approved=1 and authorId in (select id from `courseware`.`user` where userName='"+ s.getAttribute("uname") + "')");
						out.println("<ul class='courselist'>");
						while (rs.next()) {
							out.println("<li> <input type='radio' name='courseSelection' unchecked value='cid"+ rs.getString("cid")+ "'>"+ rs.getString("course_title") + "</li><br/>");
						}
						out.println("</ul>");
					} catch (Exception e) {
						out.println("error:" + e.getMessage());
						e.printStackTrace();
					}
					--%>
				
			</div>
		 <div class="weekcontainer">
				<%--
					try {
						rs.beforeFirst();
						while (rs.next()) {
							out.println("<ul class='weeklist' id='cid"+ rs.getString("cid") + "'>");
							int now = Integer.parseInt(rs.getString("no_of_weeks")), i = 1;
							while (i <= now) {
							
								out.println("<li>week" + i + "</li>");
								out.println("<form action=\"FileUploadHandler?path=/"+rs.getString("course_title")+"/week"+i+"\" method=\"post\" enctype=\"multipart/form-data\">");
								out.println("<input type=\"file\" name=\"file\" /><input type=\"submit\" value=\"upload\" /></form>");
				            	    
				            i++;
							}
							out.println("</ul>");

						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				--%>
			
		


			<!--- List of weeks need to be appended using jsp 
		---->
			</div>
			
			<div class="enrolledcontainer">

				 <%--
					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						
						temp = stmt.executeQuery("select * from `courseware`.`course` where cid in (select cid from `courseware`.`user_enrollment` where id in (select id from `courseware`.`user` where username='"+ s.getAttribute("uname") + "'))");
						while (temp.next()) {
							out.println("<ul class='enrolledlist' > <input type='radio' name='courseSelection'  value='ecid"+ temp.getString("cid")+ "'>"+ temp.getString("course_title") + "</ul>");
						}
				--%>
			</div>
			<div class="enrolledweek">
				<%--
					temp.beforeFirst();
						while (temp.next()) {
							out.println("<ul id='ecid" + temp.getString("cid") + "'>");
							int now = Integer.parseInt(temp.getString("no_of_weeks")), i = 1;
							String path; 
							String files;
							while (i <= now) 
							{
								out.println("<li>week" + i + "</li><br/>");
								path="H:/DOCS/java-programs/courseWare/WebContent/videos"+"/"+temp.getString("course_title")+"/week"+i;
								File folder = new File(path);
								File[] listOfFiles = folder.listFiles(); 
							
							for (int j = 0; j < listOfFiles.length; j++) 
							  {
							 
							  files = listOfFiles[j].getName();
							  out.println("<video width=\"320\" height=\"240\" controls> <source src=\"file:///"+path+"/"+files+"\" type=\"video/mp4\">");
							  out.println("</object></video>");
							  }
							
								i++;
							}
							out.println("</ul>");

						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				--%>
			</div>
			
			<script src="script/jquery-1.7.2.min.js"></script>
			<script src="script/teacherscript.js"></script>


		</div>
		</div>
	<!--  <div id="footer">

<div class="container ">A website by Karthik Hareesh & Rishinder
</div>
</div>
  <div class="clearfooter"></div> --->
  </div>
		<!--  ----------------------- Footer End ------------------------------------ -->
</body>
</html>