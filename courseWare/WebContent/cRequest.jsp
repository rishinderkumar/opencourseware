<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="cstyle.css" />
  </head>
  <body>
 <!-- 	<tr class="table-rows">
	 <td>C</td>
	 <td>EDP</td>
	 <td>5</td>
	 <td>IT</td>
	 <td><div class="scroll">
	 Course Description</br>
	 
	 </div></td>
	 out.println<td class="enrollButton">Approve</td>
	 <td class="enrollButton">Reject</td>
	 </tr>
	
	<tr class="table-rows">
	 <td>Java</td>
	 <td>XYZ</td>
	 <td>5</td>
	 <td>IT</td>
	 <td></td>
	 <td class="enrollButton">Approve</td>
	 <td class="enrollButton">Reject</td>
	</tr>
-->	
<% 	


Connection con = null;
Statement stmt = null;
ResultSet rs=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
	stmt=con.createStatement();
	rs=stmt.executeQuery("select * from `courseware`.`course` where is_approved=0");
	if(rs.next())
	{
%>
   <table class="course_library" name="course_library">
   
   <tr class="table-title">
    <td id="titleData">Course </td>
	<td id="titleData">Author</td>
	<td id="titleData">Weeks</td>
	<td id="titleData">Stream</td>
	<td id="titleData">Description</td>
	<td id="titleData" colspan="2">Action</td>
	</tr>

<%	do{
		out.println("<tr class=\"table-rows\">");
	    out.println("<td>"+rs.getString("course_title")+"</td><td>"+rs.getString("authorId")+"</td><td>"+rs.getString("no_of_weeks")+"</td><td>"+rs.getString("stream")+"</td>");
	    out.println("<td>"+rs.getString("course_description")+"</td><td class=\"enrollButton\"><a href='/courseWare/requestUpdate.jsp?cid="+rs.getString("cid")+"&status=1'>Approve</a></td>");
	    out.println("<td class=\"enrollButton\"><a href='/courseWare/requestUpdate.jsp?cid="+rs.getString("cid")+"&status=0'>Reject</a></td></tr>"); 
	   
	    
	 }while(rs.next());
	}
	else{
		out.println("<h1>No requests to display</h1>");
	}
    
}
catch(Exception e){e.printStackTrace();} 
     
%>	 
   
  
  </body>