<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	

<%
HttpSession s = request.getSession();
Connection con = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, temp = null;

					try {
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						
						rs = stmt.executeQuery("select * from `courseware`.`course` where cid="+request.getParameter("cid"));
						while (rs.next()) {
							out.println("<ul class='weeklist' id='cid"+ rs.getString("cid") + "'>");
							int now = Integer.parseInt(rs.getString("no_of_weeks")), i = 1;
							while (i <= now) {
							
								out.println("<li>week" + i + "</li>");
								out.println("<form action=\"FileUploadHandler?path=/"+rs.getString("course_title")+"/week"+i+"\" method=\"post\" enctype=\"multipart/form-data\">");
								out.println("<input type=\"file\" name=\"file\" /><input type=\"submit\" value=\"upload\" /></form>");
				            	    
				            i++;
							}
							out.println("<br/><br/><br/><a href='publish.jsp?cid="+rs.getString("cid")+"'><button>publish</button></a></ul>");
						
						}
					con.close();
					//out.close();
					stmt.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
%>					