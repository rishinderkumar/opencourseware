<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="javax.mail.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Place inside the <head> of your HTML -->
<script src="script/ckeditor_4.4.3_standard/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
  function getEditedText(){
	   var text = ""
if ( !CKEDITOR.env.isCompatible )
    alert( "Your browser is not compatible with editor tool please update your browser to IE8 or chrome or firefox" );

	    var text = CKEDITOR.instances.editor1.getData();
		
		alert(text)
		
  }
   </script>
   

<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<link rel="stylesheet" type="text/css" href="CSS/popup.css" />
<title>Teacher Homepage</title>
</head>
<body>
  <div class="wrapper">
  <div class="header">
   <h1> 
        OpenCourseWare
		</h1>
   <div class="searchbar searchtop">
<input id="main-search" type="text" value="" placeholder="Find what you want to learn today" name="">
</div>
 <div class="menubar">
      <ul>
	   <% 
	   HttpSession s=request.getSession();
	   Connection con = null;
		Statement stmt = null;
		ResultSet rs=null,rs1=null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courseware","root","");
			stmt=con.createStatement();
		}catch(Exception e){
			e.printStackTrace();
		}
	    out.print("<li id='username'>"+s. getAttribute("uname")+"</li>");
		out.print("<li id='logout'> Logout </li>");
		%></ul>
 </div>
 
   </div>
    <div class="userheader_bg">
	   <div class="logo"></div>
	   <div class="tool_bg">
	   <div class="startcourse"></div>


	   <div class="editcourse"></div>
	   <div class="enrolledcourses"></div>
	  </div>
	   
	   
	   
	</div>
	
	  <div class="tool_action">
	  <div class="requestform">
	    <%
	   out.print("<form  name='startform' method='post' id='requestform' action='/courseWare/sendRequest.jsp?teacher='"+s.getAttribute("uname")+">");
	    %>
	   <table class="request_table" name="course_request">
	   <tbody>
	   <tr> 
	     <td colspan="2" id="form_header" > Send request to start a course</td>
		 </tr>
	       <tr>
		     <td class="tablefields">
			    Title:</td>
				<td class="tablefields"><input type="text" required="required" name="title" value=""  id="title"> </td>
				</tr>
			<tr>	
		   <td class="tablefields">
		     Stream:
			</td>
		   <td class="tablefields"><input list="stream"  required="required" name="stream">
        <datalist id="stream">
  <option value="Computer Science">
  <option value="Electronincs">
  <option value="Electrical">
  <option value="Information Technology">
  <option value="Mechanical">
  <option value="Civil">
</datalist></td>
    </tr>
	<tr>
        <td class="tablefields"> Number of Weeks:</td>
		<td class="tablefields"><input type="number" required="required" min="1" step="1" name="weeks" id="weeks" value=""></td>
		</tr>
		 <tr>
		 <td class="tablefields">Enter course details:</td>
		 <td class="tablefields"><textarea rows="3" cols="17" required="required"></textarea></td>
		 </tr>
		 <tr>
		 <td colspan="2" class="tablefields">
		 <input type="submit" value="Send Request" id="request_button">
         </td>		 
        </tbody>
		 </table>
		 </form>
		 </div>
	
	 </div>
		 
	<div class="coursecontainer">
	  <% 
	  try{
		 // rs1=stmt.executeQuery("select * from `courseware`.`user` where username='"+s.getAttribute("uname")+"'");	  
		  rs=stmt.executeQuery("select * from `courseware`.`course` where authorId='27' and is_published=0 ");
				    while(rs.next())
		    {
		    	out.println("<ul class='courselist' > <input type='radio' name='courseSelection' uncheched value='cid"+rs.getString("cid")+"'>"+rs.getString("course_title")+"</ul>");
		    }
		}
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
		%>

	</div>
	<div class="weekcontainer">
	  <%
	    rs.beforeFirst();
	    while(rs.next())
	    {
	    	 out.println("<ul class='weeklist' id='cid"+rs.getString("cid")+"'>");
	    	 int now=Integer.parseInt(rs.getString("no_of_weeks")),i=1;
	    	 while(i<=now)
	    	 {
	    		 out.println("<li>week"+i+"</li>");
	    		 i++;
	    	 }
	    	 out.println("</ul>");
	    	
	    }
	  %>
	  <form class="textfieldedit" name="textfieldedit">
            <textarea name="editor1" id="editor1" rows="10" cols="80">
                
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1' );
				
            </script>
             <ul>
          <li>
            <input type="button" id="save" value="save" name="save"/>
            <input type="button" id="publish" value="publish" onclick="getEditedText()" name="Publish"/>
        </form>
       
	  <!--- List of weeks need to be appended using jsp 
		---->
		</div>
		<div class="enrolledcontainer">
		<h2>Hey enrolled courses must be displayed.
		   when u click me corresponding weeks must be displayed
		     c1
			  c2..</h2>
		</div>
		<div class="enrolledweek">
		 week1 week2 week3 week4 ....
		</div>
 <script src="script/jquery-1.7.2.min.js"></script>
 <script src="script/teacherscript.js"></script>
 
 
		
	 

</body>
</html> 
   
   