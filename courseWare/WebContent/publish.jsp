<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
		    stmt.executeUpdate("UPDATE  `courseware`.`course` SET  `is_published` =  '1' WHERE  `course`.`cid`="+request.getParameter("cid")+";");
		    request.getRequestDispatcher("teacher.jsp").forward(request, response);
		    con.close();
			stmt.close();
			}
		 catch(Exception e){e.printStackTrace();}
%>