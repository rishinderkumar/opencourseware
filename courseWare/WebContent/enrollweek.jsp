<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<%
try {
HttpSession s = request.getSession();
Connection con = null;
Statement stmt = null;
ResultSet rs = null, rs1 = null, temp = null;
						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware", "root", "");
						stmt = con.createStatement();
						
						temp = stmt.executeQuery("select * from `courseware`.`course` where cid="+request.getParameter("cid"));
						
	while (temp.next()) {
							out.println("<ul id='ecid" + temp.getString("cid") + "'>");
							int now = Integer.parseInt(temp.getString("no_of_weeks")), i = 1;
							String path; 
							String files;
							while (i <= now) 
							{
								path="C:/Users/cvr/Desktop/courseWare/WebContent/videos"+"/"+temp.getString("course_title")+"/week"+i;
								File folder = new File(path);
								File[] listOfFiles = folder.listFiles(); 
							if(listOfFiles.length>0)
								out.println("<li>week" + i + "</li><br/>");
							
							for (int j = 0; j < listOfFiles.length; j++) 
							  {
							 
							  files = listOfFiles[j].getName();
							  out.println("<video width=\"320\" height=\"240\" controls> <source src='http://localhost:8080/courseWare/videos/"+temp.getString("course_title")+"/week"+i+"/"+files+"' type=\"video/mp4\">");
							  out.println("</video><br/><br/>");
							  }
							
								i++;
							}
							//out.println("</ul>");

						}
	con.close();
	//out.close();
	stmt.close();} catch (Exception e) {
						e.printStackTrace();
					}
			%>
			<script src="script/jquery-1.7.2.min.js"></script>
			<script src="script/teacherscript.js"></script>
					