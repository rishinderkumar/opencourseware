

import java.io.IOException; 
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Signup
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname=request.getParameter("firstName");
		String lname=request.getParameter("lastName");
		String email=request.getParameter("email");
		String uname=request.getParameter("username");
		String password=request.getParameter("password");
		String is_staff=request.getParameter("signupas");
		response.setContentType("text/html");
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
			if(stmt.executeQuery("select * from `user` where userName='"+uname+"' or emailId='"+email+"'").next())
				{
				request.setAttribute("result","user name or email already taken");
				request.getRequestDispatcher("SignUp.jsp").forward(request, response);System.out.print("dsf");
				}
			else{
			
String query="INSERT INTO `courseware`.`user` (`firstName`, `lastName`, `userName`, `emailId`, `password`, `is_staff`, `is_active`, `is_admin`) VALUES ('"+fname+"','"+lname+"','"+uname+"','"+email+"','"+password+"','"+Integer.parseInt(is_staff)+"', '0', '0');";
			//"INSERT INTO user VALUES ("+fName+","+LName+","+date+","+username+","+email+","+password+");";
			if(stmt.executeUpdate(query)>0)
			{
			HttpSession s=request.getSession();
			s.setAttribute("uname", uname);
				
			query="INSERT INTO `courseware`.`temp_users` (`email`,`confirm_code`) VALUES ('"+email+"','"+email.hashCode()+"');";
			stmt.executeUpdate(query);
			request.setAttribute("email", email);
				//request.setAttribute("code", uname.hashCode()+"");
			RequestDispatcher view=request.getRequestDispatcher("mail.jsp");
			view.forward(request,response);
			}
			else
				//out.println("<h1 style='color:red'>registration failed UnSucessful </h1>");
			
			
			stmt.close();
			con.close();
		}
		}
		catch(Exception e){e.getMessage();
		e.printStackTrace();}
	}
	

}
