<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<%
try {
HttpSession s = request.getSession();
Connection con = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, temp = null;
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						
						temp = stmt.executeQuery("select * from `courseware`.`course` where cid in (select cid from `courseware`.`user_enrollment` where id in (select id from `courseware`.`user` where username='"+ s.getAttribute("uname") + "'))");
						if(temp.next())
							{
							do{
							 out.println("<ul class='enrolledlist' > <input type='radio' name='EcourseSelection'  value='"+temp.getString("cid")+ "'>"+ temp.getString("course_title") + "</ul>");
							}while (temp.next());	
						}
						else out.println("<center><h1>you have not enrolled to any courses<br/>Go to course library</h1></center>");
						con.close();
						stmt.close();		
}
						catch(Exception e){e.printStackTrace();}
						%>
		    <script src="script/jquery-1.7.2.min.js"></script>
			<script src="script/teacherscript.js"></script>