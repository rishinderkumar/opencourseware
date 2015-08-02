<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	

<%

Connection con = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, temp = null;

					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						HttpSession s=request.getSession();
						if(s==null)
							request.getRequestDispatcher("SignUp.jsp").forward(request, response);
						else
							{
							rs = stmt.executeQuery("select * from `courseware`.`user` where userName='"+s.getAttribute("uname")+"'");
							rs.next();
							int staff=Integer.parseInt(rs.getString("is_staff")),admin=Integer.parseInt(rs.getString("is_admin"));
							stmt.executeUpdate("INSERT INTO `courseware`.`user_enrollment` (`id`, `cid`) VALUES ('"+rs.getString("id")+"', '"+request.getParameter("cid")+"')");
							if(staff>0)
						    	request.getRequestDispatcher("teacher.jsp").forward(request,response);
						    else if(admin>0)
						          request.getRequestDispatcher("admin.jsp").forward(request, response);
						    else  request.getRequestDispatcher("userHome.jsp").forward(request, response);
						}
							
						}
					catch(Exception e)
					{
						e.printStackTrace();
					}
%>			