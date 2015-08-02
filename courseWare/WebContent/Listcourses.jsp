<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.Session"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
     HttpSession s=request.getSession();
	 out.print(s.getAttribute("uname"));
	 %>

		<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
			rs=stmt.executeQuery("select course_title from `course` where is_approved='1'");
			while(rs.next())
			{ 	out.print("<tr><td>");
				out.print(rs.getString(1)+"</td><td>");
				out.print("<a href=/courseWare/enroll?course_title="+rs.getString(1)+">register</a>");
				out.println("</td></tr>");
			}
		}
		catch(Exception e){out.print("no records found");e.printStackTrace();}
			%>
	</table>


</body>
</html>