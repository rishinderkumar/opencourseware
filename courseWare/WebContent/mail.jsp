<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%
	String to = request.getParameter("email");
	String from = "courseware@gmail.com";
	String host = "localhost";
	Properties properties = System.getProperties();
	properties.setProperty("mail.smtp.host", host); // Get the default Session object. 
	Session mailSession = Session.getDefaultInstance(properties); 
	try{ 
			MimeMessage message = new MimeMessage(mailSession); 
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			message.setSubject("Email verification"); 
			message.setText("click the below link http://localhost:8080/courseWare/confirm.jsp?confirm_code="+to.hashCode());
			Transport.send(message);
			request.setAttribute("result","you have been registered,please confirm to continue");
			request.getRequestDispatcher("home.jsp").forward(request, response);
	} 
	catch (MessagingException mex ) { mex.printStackTrace(); }
%>
