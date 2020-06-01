<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<title>This is the common registration page</title>
	<link rel="stylesheet" type="text/css" href="common_registration_1.css">
</head>
<body>
<div class="reg-box">
<form action="" method="post">
	<center>
	<h1>Please do register yourself!</h1>
	<h2>Please select a category</h2>
	<form>
	  <br><br><br>
	  <select class="dropdown_1" name="choose">
	    <option>Doctor</option>
	    <option>Student</option>
	  </select>
	  <br><br><br>

	  <input type="submit" value="Next" class="button">
	</form>


	<div id="footer">
  <div id="one-third">     
  </div>
  <div id="one-third"> Copyright SKB 2020 - All Rights Reserved   </div>
  <div id="one-third">    </div>
</div>

	</center>
</form>
</div>

<%
String option=request.getParameter("choose");
if(option!=null){
	if(option.equals("Doctor")){
		response.sendRedirect("Doctor_registration.jsp");
	}
	else{
		response.sendRedirect("student_registration.jsp");
	}
}
else{
	;
}

%>

</body>
</html>