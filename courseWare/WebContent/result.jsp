<%@page import="javax.mail.Session"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<html>
<head>
<title>SELECT Operation</title>
</head>
<body>
	<table border=1>
	<tr>
	<th>first name</th>
	<th>last name</th>
	</tr>
	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
			rs=stmt.executeQuery("select * from `user`");
			HttpSession s=request.getSession();
			out.println(s.getAttribute("uname"));
			while(rs.next())
			{ 	out.print("<tr><td>");
				out.print(rs.getString(1)+"</td><td>"+rs.getString(2));
				out.println("</td></tr>");
			}
		}
		catch(Exception e){out.print("no records found");e.printStackTrace();}
			%>
	</table>
</body>
</html>