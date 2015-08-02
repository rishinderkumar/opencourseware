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
			HttpSession s=request.getSession(false);
			if(s==null)
				rs=stmt.executeQuery("select * from `course` where is_approved=1");
			else 
				rs=stmt.executeQuery("select * from `course` where is_approved=1 and cid not in (select cid from `user_enrollment` where id in (select id from `user` where userName='"+s.getAttribute("uname")+"'))");
		    if(rs.next()==false)
		    	out.println("<h1>no new courses</h1>");
		    else
		    {
		%>

<link rel="stylesheet" type="text/css" href="cstyle.css" />
   <table class="course_library" name="course_library">
   <tr class="table-title">
    <td id="titleData">Course Title</td>
	<td id="titleData">Author</td>
	<td id="TitleData">No of Weeks</td>
	<td id="TitleData">Stream</td>
	</tr>
	
<%
   
    do
    {
    out.println("<tr class='table-rows'>");
    out.println("<td>"+rs.getString("course_title")+"</td>");
    out.println("<td>"+rs.getString("authorId")+"</td>");
    out.println("<td>"+rs.getString("no_of_weeks")+"</td>");
    out.println("<td>"+rs.getString("stream")+"</td>");
    out.println("<td class='enrollButton'><a href=enroll.jsp?cid="+rs.getString("cid")+">Enroll</a></td></tr>");
    }while(rs.next());
    }//else
    }//try
catch(Exception e)
    {e.printStackTrace();}
%>
	 
	</tr>
	 
   
  
