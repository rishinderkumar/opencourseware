<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
<title>Sign Up</title>
<script src="script/jquery-1.7.2.min.js"></script> <!--- Required for Login box --->
<script src="script.js"></script> <!----- jQuery Script for Loginbox ------>
<link href="CSS/style.css" rel="stylesheet" type="text/css">
<link href="styletemp.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function validate()
  {
	
	  var fname=/^[a-z A-Z .]{2,15}$/;
	  var pass=/^[\w\d]{6,10}$/;
	  var conpass=/^[\w\d]{6,20}$/;
	  var lname=/^[a-z A-Z .]{2,15}$/;
	  
	 
	 
	 if(sSignupform.fname.value==""||sSignupform.fname.value==null)
	     alert("First name cannot be empty");
     else if(!fname.test(sSignupform.fname.value))
         alert("First name must contain atleast 2 and a maximum of 15 characters");
     else if(sSignupform.lname.value==""||sSignupform.lname.value==null)
	     alert("Last name cannot be empty")
	 else if(!lname.test(sSignupform.lname.value))
    	     alert("Last name must contain atleast 2 and a maximum of 15 characters");
     		 
	 
	else if(sSignupform.password.value==""||sSignupform.password.value==null)
	     alert("Password cannot be empty")		 
	 else if(!pass.test(sSignupform.password.value))
			alert("not a valid passsword! password must contain 6 to 20 characters");
	 else if(!conpass.test(sSignupform.confirmpassword.value))
			alert("Re-enter your password for confirmation");
	 else if(sSignupform.password.value!=sSignupform.confirmpassword.value)
             alert("Passwords do not match! Re-Enter your password for confirmation");	 
	 else return true;
	 return false;
     } 
	 
	 

</script>
</head>
<body>
<div id="wrapper">

<div id="header">
<div class="container">
<div id="logoArea"></div>
<div class="headernavArea">
<ul id= "headernav">
<a href="home.html"><li align="right">Home</li>  </a> </div>
</div></div>



<div id="mainArea">
<div class="container signUppage">




<!----------------------- Trial ------------------------------------------------------------------------>
<div id="login" >Already a member? <br>
  Login </div>
<div id="content"></div>

<!--- Form Start -->

<div id="wb_Signup2" >
<form name="sSignupform" method="post"   action="/courseWare/Signup" id="signupform2">
  <input name="form_name" value="signupform" type="hidden">
  <table width="445" class="signupform_table" id="wb_Signup2" >
    <tbody>
      <tr>
        <td class="signupform_header" colspan="2" "><p style="font-style: normal; font-weight: bold;">Sign Up For A New Account</p></td>
      </tr>
      <tr>
        <td width="148" style="height:20px">First Name</td>
        <td width="285" style="text-align:left"><input name="firstName" type="text" required class="signupform_text" id="fname"></td>
      </tr>
      <tr>
        <td style="height:20px">Last Name</td>
        <td style="text-align:left"><input name="lastName"  type="text" required class="signupform_text" id="lname"></td>
      </tr>
      <tr>
        <td style="height:20px">User Name</td>
        <td style="text-align:left"><input name="username"  type="text" required class="signupform_text" id="username"></td>
      </tr>
      <tr>
        <td style="height:20px">E-mail</td>
        <td style="text-align:left"><input name="email"  type="email" required class="signupform_text" id="email"></td>
      </tr>
      <tr>
        <td style="height:20px;">Password</td>
        <td style="text-align:left"><input name="password"  type="password" required class="signupform_text" id="password"></td>
      </tr>
      <tr>
        <td style="height:20px">Confirm Password</td>
        <td style="text-align:left"><input name="confirmpassword"  type="password" required class="signupform_text" id="confirmpassword"></td>
      </tr>
      <tr>
        <td style="text-align:left" colspan="2"><input name="signupas"  type="radio" required class="signupform_text"  value="0">
          Sign up as Student </td>
      </tr>
      <tr>
        <td style="text-align:left" colspan="2" ><input name="signupas"  type="radio" required class="signupform_text"  value="1">
          Sign up as Teacher </td>
      </tr>
      <tr>
        <td colspan="2"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td style="text-align: left;" colspan="2"><input class="signupform_button" name="signup" value="Sign up" id="signup2"  type="submit" onclick="return validate()"></td>
      </tr>
    </tbody>
  </table>
</form>

<!--- Form End -->

<class id="logbox">
<div class="overlay"></div>
		<div class="popup">
<form class="form-3" name="loginform"  action="/courseWare/Login" method="get">
   <p class="clearfix" style="width: 16px; height: 16px; margin-top: 0px; margin-bottom: 0px; position: absolute; left: 264px;">
     <img id="popClose" src="icon.png" >
    </p>
	<p class="clearfix" style="width: 246px; margin-top: 12px; padding-left: 16px; top: 19px; padding-right: 18px; height: 23px; position: relative;">
        <label for="blogin" style="width: 31px; top: auto; text-transform: uppercase; text-shadow: 0px 1px 0px rgb(0, 0, 0); text-indent: 10px; font-weight: 100; color: rgb(255, 255, 255);">email</label>
        <input type="email" required="required" name="uname" id="blogin" placeholder="emailID"
		 style="border-left-width: 1px; width: 146px; height: 16px; margin-top: 0px; position: relative; top: 0px; left: 50px; bottom: 0px; border-color: rgb(51, 51, 51); border-radius: 6px;">
    </p>
    <p class="clearfix"  style="height: 23px; position: relative; top: 30px; padding-left: 16px; padding-right: 16px; border-left-width: 0px; bottom: -19px;" >
        <label for="bpassword" style="height: 15px; font-weight: 100; text-indent: 10px; text-transform: uppercase; text-shadow: 0px 1px 0px rgb(0, 0, 0); top: auto; color: rgb(255, 255, 255);">Password</label>
        <input type="password" required="required" name="upassword" id="bpassword" placeholder="password" style="position: relative; height: 16px; border-color: rgb(51, 51, 51); border-radius: 6px; left: 16px; width: 146px; border-left-width: 1px;">
    </p>
    <p class="clearfix"  style="height: 20px; position: relative; top: 36px; padding-left: 12px; padding-right: 12px;">
        <input type="checkbox" name="remember" id="remember">
        <label for="remember" style="width: 31px; top: auto;text-shadow: 0px 1px 0px rgb(0, 0, 0); text-indent: 10px; font-weight: 100; color: rgb(255, 255, 255);">Remember me</label>
    </p>
    <p class="clearfix" style="height: 25px; position: relative; top: 44px; left: 102px; margin-top: 0px; margin-bottom: 0px; width: 64px; bottom: 0px;">
        <input type="submit" name="submit" value="Log in" id="sub" style="height: 28px; width: 82px; border: 1px solid rgba(0, 0, 0, 0.4); box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.3) inset, 0px 10px 10px rgba(255, 255, 255, 0.1) inset; border-radius: 3px; background: none repeat scroll 0% 0% rgb(24, 108, 134); color: rgb(255, 255, 255); font-size: medium; text-transform: uppercase;">
    </p>
    	
</form>

</div>





<!----------------------- Trial ------------------------------------------------------------------------>




















</div>
</div>




<div id="footer">
<div class="container ">A website by <b>Karthik,Hareesh & Rishinder</b>
</div>
</div>
<div class="clearfooter"></div>
</div>
	<%
	try{
		String s=(String)request.getAttribute("result");
		if(s!=null)out.println("<script>alert(\" "+s+" \" );</script>");
	}catch(Exception e){e.printStackTrace();}
%>
</body>


</html>>>