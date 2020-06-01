<%@page import="java.sql.*,java.time.*,java.time.format.DateTimeFormatter"%>
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
    <title>Making a prescription</title>
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
	width: 500px;
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

.dropdown_1{
	background-color: rgba(10,200,0,0.7);
	font-family: monospace;
	font-size: 16px;
	border-radius: 12px;
	color: white;
}

.dropdown_1:hover{
	background-color: darkgreen;
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
        <a href="doctor_logged_in.jsp" class="active">Home</a>
        <a href="Doc_password_change.jsp">Change Password</a>
        <a href="doc_profile.jsp">My Profile</a>
        <form  method="get" action="Logout">
        <input type="submit" id="Name" value="Logout">
        </form>
        <a href="doc_profile.jsp" id="Name"><%=email %></a>
      </div>

<%
if(email==null){
	response.sendRedirect("login_page_1.jsp");
}
else{
%>

      <form method="post" action="">
      <div class="info">
		<center>
		<table>
					
			<tr>
				<td>Enter patient email ID: *</td>
				<td><input type="email" name="email" ></td>
			</tr>
			<tr>
				<td>My email:</td>
				<td><%= email %></td>
			</tr>
			<tr>
				<td>Enter today's date: *</td>
				<td><input type="date" name="date" ></td>
			</tr>
			<tr>
				<td>Suggest a solution: *</td>
				<td><input type="text" name="solution" ></td>
			</tr>
			<tr>
				<td>Some extra notes (if any):</td>
				<td>
				<input type="text" name="notes">
				</td>
			</tr>
			<tr>
				<td><input class="btn" type="reset" value="Reset"></td>
				<td><input class="btn" type="submit" name="b21" value="Create"></td>
			</tr>
		</table>      	
      	</center>
      </div>
      </form>
<%

String email1=request.getParameter("email");
String date=request.getParameter("date");
String solution=request.getParameter("solution");
String notes=request.getParameter("notes");
LocalDateTime uid=LocalDateTime.now();
String uid1=DateTimeFormatter.ofPattern("dd/MM/yyyy - hh:mm:ss").format(uid);
if(request.getParameter("b21")!=null){
	try{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("insert into prescription values(?,?,?,?,?,?)");
	pst.setString(1, uid1);
    pst.setString(2, email1);
    pst.setString(3, email);
    pst.setString(4, solution);
    pst.setString(5, date);
    pst.setString(6, notes);
    
	int v=pst.executeUpdate();
    if(v>0)
    {
    	out.print("<script>alert('Prescription created.');</script>");
    }
    else{
    	out.print("<script>alert('Make sure all the fields are correctly entered.');</script>");
    }
	}catch(Exception e){
		out.print("<script>alert('Make sure all the fields are correctly entered.');</script>");
	}


}
}

%>

</body>
</html>