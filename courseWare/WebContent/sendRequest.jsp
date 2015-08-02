<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
  
   String title=request.getParameter("title");
   String stream=request.getParameter("stream");
   String courseDetails=request.getParameter("details");
   int NOW=Integer.parseInt(request.getParameter("weeks"));
   
   HttpSession s=request.getSession();
	
    Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
		stmt=con.createStatement();
		rs=stmt.executeQuery("select * from `courseware`.`user` where userName='"+s.getAttribute("uname")+"';");
		rs.next();
		stmt.executeUpdate("insert into `courseware`.`course` (`authorId`,`no_of_weeks`,`course_title`,`stream`,`course_description`) values ( '"+Integer.parseInt(rs.getString("id"))+"','"+NOW+"','"+title+"','"+stream+"','"+courseDetails+"');" );
		out.println("request sent!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	
	}
	catch(Exception e)
	{e.printStackTrace();}
	request.getRequestDispatcher("teacher.jsp?status=request_sucess").forward(request, response);
%>

