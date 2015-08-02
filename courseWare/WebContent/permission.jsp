<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 	
Connection con = null;
Statement stmt = null;
ResultSet rs=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
	stmt=con.createStatement();
	int a=Integer.parseInt(request.getParameter("p"));
	switch(a)
	{
	  case 1:stmt.executeUpdate("UPDATE  `courseware`.`user` SET  `is_admin` =  '1' ,`is_staff` =  '0' WHERE  `user`.`id` ="+request.getParameter("id")+";");break;
	  case 2:stmt.executeUpdate("UPDATE  `courseware`.`user` SET  `is_admin` =  '0' , `is_staff` =  '0' WHERE  `user`.`id` ="+request.getParameter("id")+";");break;
	  case 3:stmt.executeUpdate("UPDATE  `courseware`.`user` SET  `is_admin` =  '0' , `is_staff` =  '0' , `is_active` = '0' WHERE  `user`.`id` ="+request.getParameter("id")+";");
	}
	
}
catch(Exception e){e.printStackTrace();}
request.getRequestDispatcher("admin.jsp").forward(request, response);
%>