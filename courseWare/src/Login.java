import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=request.getParameter("uname");
		String password=request.getParameter("upassword");
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		System.out.println(uname+password);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
			rs=stmt.executeQuery("select * from `user` where emailId='"+uname+"' and password='"+password+"';");
			if(rs.next())
			{
				
				if( Integer.parseInt(rs.getString("is_active"))==1)
				{
				HttpSession s=request.getSession();
			    s.setAttribute("uname", rs.getString("userName"));
			    if(Integer.parseInt(rs.getString("is_admin"))>0)
			    	request.getRequestDispatcher("admin.jsp").forward(request,response);
			    else if(Integer.parseInt(rs.getString("is_staff"))>0)
			          request.getRequestDispatcher("teacher.jsp").forward(request, response);
			    else  request.getRequestDispatcher("userHome.jsp").forward(request, response);
			
			//    (request.getRequestDispatcher("NewFile.jsp")).forward(request,response);
				}
				else
					{
					request.setAttribute("result", "your email is not verified please check your inbox and verify");
					request.getRequestDispatcher("SignUp.jsp").forward(request, response);//out.println("invalid input");
							
					}
				
			    }
			else {
				request.setAttribute("result", "Invalid Credentials");
				request.getRequestDispatcher("SignUp.jsp").forward(request, response);//out.println("invalid input");
			}
	}catch(Exception e){
		out.println("error in login:"+e.getMessage());
		e.printStackTrace();}
   }
}
