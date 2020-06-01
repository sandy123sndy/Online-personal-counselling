<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="com.online_counselling_1.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String email=(String)session.getAttribute("email");


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Booking an appointment</title>
    <style>
        img{
    	width: 100%;
    	height: 100%;
    }
    img:hover{
    	width: 100%;
    	height: 100%;
    }
    body{
        background-image: url("back_1.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
    .topnav {
  background-color: rgb(24, 24, 128);
  overflow: hidden;
  border-radius: 12px;
}
.topnav:hover{
    background-color: blue;
}

/* Style the links inside the navigation bar */
.topnav input{
	float: left;
	color: white;
	background-color: transparent;
	padding: 14px 16px;
    text-decoration: solid;
 	font-size: 14px;
}
.topnav input:hover{
	background-color: #ddd;
  	color: black;
}
.topnav a {
  float: right;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: solid;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add an active class to highlight the current page */
.topnav a.active {
  background-color: rgb(247, 35, 247);
  color: white;
}
.topnav #Name{
    float: left;
}

/* Hide the link that should open and close the topnav on small screens */
.topnav .icon {
  display: none;
}

h1{
    color: rgb(30, 238, 30);
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
}

.parent_1{
	width: 180px;
    height: 180px;
    margin: 30px;
    float: left;
	box-shadow: 25px 25px 25px black;
	background-size: cover;
    background-repeat: no-repeat;
    background-color: transparent;
	opacity: 1;
	transition: width 1s;
}

.parent_1:hover{
    width: 220px;
    height: 220px;
	transition: width 1s;
}
.parent_2{
	width: 180px;
    height: 180px;
    margin: 30px;
    margin-left: 570px;
    float: right;
    background-color: transparent;
	box-shadow: 25px 25px 25px black;
	background-size: cover;
	background-repeat: no-repeat;
	opacity: 1;
	transition: width 1s;
}

.parent_2:hover{
    width: 220px;
    height: 220px;
	transition: width 1s;
}
.parent_3{
	width: 180px;
    height: 180px;
    margin: 30px;
    margin-left: 650px;
    float: right;
    background-color: transparent;
	box-shadow: 25px 25px 25px black;
	background-size: cover;
	background-repeat: no-repeat;
	opacity: 1;
	transition: width 1s;
}

.parent_3:hover{
    width: 220px;
    height: 220px;
	transition: width 1s;
}
.parent_4{
	width: 180px;
    height: 180px;
    margin: 30px;
    margin-left: 380px;
    float: right;
    background-color: transparent;
	box-shadow: 25px 25px 25px black;
	background-size: cover;
	background-repeat: no-repeat;
	opacity: 1;
	transition: width 1s;
}

.parent_4:hover{
    width: 220px;
    height: 220px;
	transition: width 1s;
}
.grand{
    width: fit-content;
    height: fit-content;
}
.child{
    margin-top: 50px;
    width: fit-content;
    height: fit-content;
}

.info table{
	width: 550px;
	height: 200px;
	border-radius: 12px;
	font-family: sans-serif;
	margin-top: 150px;
	box-shadow: 25px 25px 25px black;
	background-color: purple;
	color: white;
	transition: 1.5s;
	
}

.info table:hover{
	width: 600px;
	height: 250px;
	transition: 1.5s;
}

.btn{
	color: white;
	background-color: red;
	border-radius: 12px;
	border-color: black;
	font-family: sans-serif;
	height: 40px;
	width: 100px;
	font-size: 15px;
	transition: 1s;
}

.btn:hover{
	height: 50px;
	width: 120px;
	transition: 1s;
	font-size: 18px;
}


    </style>
</head>
<body>

    <div class="topnav" id="myTopnav">
        <a href="student_logged_in.jsp" class="active">Home</a>
        <a href="std_password_change.jsp">Change Password</a>
        <a href="std_profile.jsp">My Profile</a>
        <form  method="get" action="Logout">
        <input type="submit" id="Name" value="Logout">
        </form>
        <a href="std_profile.jsp" id="Name"><%=email %></a>
      </div>

<form method="post" action="">
      <div class="info">
		<center>
		<table>
			<tr>
				<td>Email ID:</td>
				<td><%=email %></td>
			</tr>

			<tr>
				<td>Enter Doc email ID:</td>
				<td><input type="email" name="doc_email"></td>
			</tr>		
			
			<tr>
				<td>Enter date of appointment:</td>
				<td><input type="date" name="date"></td>
			</tr>
			
			<tr>
				<td>Enter time of appointment:</td>
				<td><input type="time" name="time"></td>
			</tr>
			
			<tr>
				<td>Problem in short:</td>
				<td><input type="text" name="problem"></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="btn" type="submit" name="b20" value="Book"></td>
				<td><input class="btn" type="reset" value="Reset"></td>
			</tr>
			
		</table>	      	
      	</center>
      </div>
      </form>
<% 
if(email==null){
	response.sendRedirect("login_page_1.jsp");
}
else{
	String doc_email=request.getParameter("doc_email");
	String date=request.getParameter("date");
	String time=request.getParameter("time");
	String problem=request.getParameter("problem");
	if(request.getParameter("b20")!=null){
		try{
			 Connection con=ConnectionProvider.getConnection();

		     PreparedStatement psmt=con.prepareStatement("insert into appointment_table(doc_email_id,date_of_appointment,time,problem_area,std_email_id) values(?,?,?,?,?)");
		     psmt.setString(1, doc_email);
		     psmt.setString(2, date);
		     psmt.setString(3, time);
		     psmt.setString(4, problem);
		     psmt.setString(5, email);
		     int i1=psmt.executeUpdate();
		   
		     if(i1>0)
		     {      
		    	 	con.commit();
		     	 	out.print("<script>alert('Appoitment has been booked.Kindly check!')</script>");
		     }
		     else{
		    	 
		    	 out.print("<script>alert('please enter all the field!')</script>");
		    	 con.rollback();
		    	 response.sendRedirect("book_appointment.jsp");
		     }
		}catch(Exception e){
			out.print("<script>alert('Appointment booked. Kindly check!')</script>");
		}
	}
}


%>


</body>
</html>