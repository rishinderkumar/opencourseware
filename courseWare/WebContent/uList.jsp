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
	rs=stmt.executeQuery("SELECT * 	FROM  `user` WHERE is_staff=1");
	if(rs.next())
	{
%>		 <table class="course_library" name="course_library">
		   <tr class="table-title">
		    <td id="titleData">First Name</td>
		    <td id="titleData">Last Name</td>
			<td id="titleData">User Name</td>
			<td id="titleData">E-mail</td>
			<td id="titleData" colspan="3">Change privileges</td>
			</tr>
<%
    do{
    out.println("<tr class=\"table-rows\"><td>"+rs.getString("firstName")+"</td><td>"+rs.getString("lastName")+"</td>");
    out.println("<td>"+rs.getString("userName")+"</td><td>"+rs.getString("emailId")+"</td>");
    out.println("<td class=\"enrollButton\"><a href='permission.jsp?p=1&id="+rs.getString("id")+"'>Make Admin</a></td>");
    out.println("<td class=\"enrollButton\"><a href='permission.jsp?p=2&id="+rs.getString("id")+"'>Deny Teacher's privilege</a></td>");
    out.println("<td class=\"enrollButton\"><a href='permission.jsp?p=3&id="+rs.getString("id")+"'>Block access</a></td></tr>");
	
    }while(rs.next());
	out.println("</table>");
	}
	else out.println("<h1>No staff to display</h1>");
 }catch(Exception e){e.printStackTrace();} 
%>