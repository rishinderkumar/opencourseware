<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		
<%
HttpSession s=request.getSession();
	
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
		{out.print("<h1><pre>Author name   Tilte   No_of_weeks    course_description</pre></h1>");
			do{
		    out.print("<h1>"+rs.getString("authorId")+"    "+rs.getString("course_title")+"   "+rs.getString("no_of_weeks")+"    "+rs.getString("course_description")+"</h1>"); 
		    out.print("<td><a href='/courseWare/requestUpdate.jsp?cid="+rs.getString("cid")+"&status=1'>accept</a></td>");
		    out.print("<td><a href='/courseWare/requestUpdate.jsp?cid="+rs.getString("cid")+"&status=0'>decline</a></td>");
		    
		 }while(rs.next());
		}
        
	}
	catch(Exception e){e.printStackTrace();}

%>
