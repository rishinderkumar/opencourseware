<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//HttpSession s=request.getSession();
	
    Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	File f;
	String s="C:/Users/cvr/Desktop/courseWare/WebContent/videos";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
		stmt=con.createStatement();
		if(request.getParameter("status").equals("1"))
			{
			 stmt.executeUpdate("UPDATE  `courseware`.`course` SET  `is_approved` =  '1' WHERE  `course`.`cid` ="+Integer.parseInt(request.getParameter("cid"))+";");
			 
			 rs=stmt.executeQuery("select * from `courseware`.`course` where cid="+Integer.parseInt(request.getParameter("cid")));
			 rs.next();
			
			 int n=Integer.parseInt(rs.getString("no_of_weeks"));
			 s+="\\"+rs.getString("course_title");
			 new File(s).mkdir();
			 for (int i=1;i<=n;i++)
				new File(s+"//week"+i).mkdir();
			}
		else if(request.getParameter("status").equals("0"))
			stmt.executeUpdate("DELETE FROM `courseware`.`course` WHERE `course`.`cid` = "+request.getParameter("cid"));
	}
	catch(Exception e){e.printStackTrace();}
	request.getRequestDispatcher("admin.jsp").forward(request, response);
%>
