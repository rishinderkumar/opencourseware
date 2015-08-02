<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
			String query="SELECT email FROM `courseware`.`temp_users` WHERE confirm_code="+request.getParameter("confirm_code");
			rs=stmt.executeQuery(query);
			if(rs.next())
			{
				stmt.executeUpdate("UPDATE  `courseware`.`user` SET  `is_active` =  '1' WHERE emailId='"+rs.getString(1)+"';");
				stmt.executeUpdate("DELETE FROM `courseware`.`temp_users` WHERE `temp_users`.`confirm_code` ="+request.getParameter("confirm_code"));
				request.setAttribute("result","registered successfully");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
		}
		catch(Exception e){e.printStackTrace();}
		%>
		
</body>
</html>