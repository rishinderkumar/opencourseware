<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	

<%
HttpSession s = request.getSession();
Connection con = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, temp = null;

					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						rs = stmt.executeQuery("select * from `courseware`.`course` where is_published=0 and is_approved=1 and authorId in (select id from `courseware`.`user` where userName='"+ s.getAttribute("uname") + "')");
						if(rs.next())
							{
							out.println("<ul class='courselist'>");
							do {
							out.println("<li> <input type='radio' name='courseSelection' unchecked value='"+ rs.getString("cid")+ "'>"+ rs.getString("course_title") + "</li><br/>");
						    }while (rs.next());
							out.println("</ul>");
							}
						else out.println("<center><h1>No courses to edit </h1></center>");  
						con.close();
						//out.close();
						stmt.close();
						} catch (Exception e) {
						out.println("error:" + e.getMessage());
						e.printStackTrace();
					}
					%>
			

			<script src="script/jquery-1.7.2.min.js"></script>
			<script src="script/teacherscript.js"></script>