<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.online_counselling_1.helper.ConnectionProvider"%>
<!DOCTYPE html>
<html>
<head>
	<title>This is the Student's registration page</title>
	<link rel="stylesheet" type="text/css" href="student_registration.css">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="reg-box">
	<center>
	<h1>You are a student!</h1>
	<h2>Please fill these up!</h2>
	<form action="" method="post">
	  <br><br><br>
	  <div class="Email"><i class="fa fa-at" aria-hidden="true"></i><input type="email" placeholder="Enter email address" name="e" class="txt2"> <i class="fa fa-unlock-alt" aria-hidden="true"></i><input type="password" name="pass" placeholder="Enter password" class="txt2"></div>
	  <br><div class="name"><input type="text" name="fn" placeholder="First name" class="txt2"> <input type="text" name="mn" placeholder="Middle name" class="txt2"> <input type="text" name="ln" placeholder="Last name" class="txt2"></div>
	  <br><div class="confidential"><i class="fa fa-phone" aria-hidden="true"></i><input type="text" name="pn" placeholder="Enter phone number" class="txt2"> <i class="fa fa-address-book" aria-hidden="true"></i><input type="text" name="addr" placeholder="Enter address" class="txt2"></div>
	  <br><div class="timing"><input type="text" name="age" placeholder="Enter your age" class="txt2"> <select class="dropdown_1" name="gender"><option>Male</option><option>Female</option><option>Others</option></select></div>
	  <br>

	  <input type="submit" class="button" name="b10" value="Next"></input>
	</form>


	<div id="footer">
  <div id="one-third">     
  </div>
  <div id="one-third"> Copyright SKB 2020 - All Rights Reserved   </div>
  <div id="one-third">    </div>
</div>

	</center>

</div>
<%
if(request.getParameter("b10")!=null){
String email=request.getParameter("e");
String pass=request.getParameter("pass");
String fname=request.getParameter("fn");
String mname=request.getParameter("mn");
String lname=request.getParameter("ln");
String phnno=request.getParameter("pn");
String address=request.getParameter("addr");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
String fullname=fname+" "+mname+" "+lname;
String type="Student";
if (email!="" && pass!="" && fullname!="" && phnno!="" && address!="" && age!="" && gender!=""){

	
	try{
	 Connection con=ConnectionProvider.getConnection();
	 PreparedStatement psmt1=con.prepareStatement("insert into login_table values(?,?,?)");
	 con.setAutoCommit(false);
	 psmt1.setString(1, email);
     psmt1.setString(2, pass);
     psmt1.setString(3, type);
     int i1=psmt1.executeUpdate();

     PreparedStatement psmt=con.prepareStatement("insert into student_info values(?,?,?,?,?,?)");
     psmt.setString(1, email);
     psmt.setString(2, fullname);
     psmt.setString(3, address);
     psmt.setString(4, gender);
     psmt.setString(5, phnno);
     psmt.setString(6, age);
     int i=psmt.executeUpdate();
   

     if(i>0 && i1>0)
     {      con.commit();

     		response.sendRedirect("login_page_1.jsp");
     	 	out.write("<script>alert('Data has succesfully recorded. kindly Login again!')</script>");
      		
     }
     else{
    	 
    	 out.print("<script>alert('please enter all the field except middle name!')</script>");
    	 con.rollback();
    	 response.sendRedirect("student_registration.jsp");
     }
	}catch(Exception e){
		out.print("<script>alert('Email already registered with us. Kindly login.')</script>");
	}
     
}else{
	out.print("<script>alert('please enter all the field except middle name!.')</script>");
}
}
%>


</body>
</html>