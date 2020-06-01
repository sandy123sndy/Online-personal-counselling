<%@page import="java.sql.*"%>
<%@page import="com.online_counselling_1.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
  <title>this is the login page</title>
  <link rel="stylesheet" type="text/css" href="login_page_1.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
  <div class="slider">
      <div class="txt3">
        <center>
        <h1>Online Personal Counselling</h1>
        </center>
      </div>    
      <div class="login-box">
        <center>
        <form action="" method="post">
        <img src="avatar.png">
        <h2>Login</h2>
        <br>
        <h3>Username</h3>
        <i class="fa fa-user" aria-hidden="true"></i>
        <input type="textbox" name="name" placeholder="Enter Username" class="txt2">
        <br>
        <h3>Password</h3>
        <i class="fa fa-key" aria-hidden="true"></i>
        <input type="Password" name="password" placeholder="Enter Password" class="txt2">
        <br>
        <button type="submit" name="but_1" class="btn">login here</button>
        <br>
        <a href="common_registration_1.jsp" id="a1">Sign Up</a>
        <a href="forgot_password.jsp" id="a2">Forgot Password</a>
        </center>
      </div>  
  </div>
   </form>
<%
String email=request.getParameter("name");
String pass=request.getParameter("password");
if(email!=null && pass!=null){
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select * from login_table where email_id=? and password=?");
	pst.setString(1, email);
	pst.setString(2, pass);
	ResultSet rs=pst.executeQuery();
	
	if(rs.next())
	{
		String type=rs.getString("type");
		session.setAttribute("type", type);
		if(type.equals("Student")){
			HttpSession s=request.getSession();
			s.setAttribute("email", email);
			response.sendRedirect("student_logged_in.jsp");
		}
		else{
			HttpSession s=request.getSession();
			s.setAttribute("email", email);
			response.sendRedirect("doctor_logged_in.jsp");
		}
	}
	else
	{
    	response.sendRedirect("errorpage.jsp");
	}
}
else{
	;
}
%>

</body>
</html>