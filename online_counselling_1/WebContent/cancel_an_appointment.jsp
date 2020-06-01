<%@page import="java.sql.*"%>
<%@page import="com.online_counselling_1.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String email=(String)session.getAttribute("email");
if(email==null){
	response.sendRedirect("login_page_1.jsp");
}
else{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select * from student_info where std_email_id=?");
	pst.setString(1, email);
	ResultSet rs=pst.executeQuery();
	if(rs.next()){
		String name_1=rs.getString("std_name");
}
}


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Cancel an appointment</title>
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

.info .t1{
	width: 850px;
	height: auto;
	border-radius: 12px;
	font-family: sans-serif;
	margin-top: 80px;
	box-shadow: 25px 25px 25px black;
	background-color: purple;
	color: white;
	transition: 1.5s;
	
}

.info .t2{
	width: 700px;
	height: auto;
	border-radius: 12px;
	font-family: sans-serif;
	margin-top: 30px;
	box-shadow: 25px 25px 25px black;
	background-color: purple;
	color: white;
	transition: 1.5s;
	
}

.info .t2:hover{
	width: 800px;
	height: auto;
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
   <div><center><h1 style="color: rgb(30, 238, 30)">Find the appointment ID and enter to cancel an appointment</h1></center></div>
<%
if(email==null){
	response.sendRedirect("login_page_1.jsp");
}
else{
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst=con.prepareStatement("select * from appointment_table where std_email_id=?");
	pst.setString(1, email);
	ResultSet rs=pst.executeQuery();

%>
   	<div class="info">
		<center>
		<table class="t1">
			<thead>
          		<tr>
	             <th>Appointment ID</th>
	             <th>DOC Email ID</th>
	             <th>Date</th>
	             <th>Time</th>
	             <th>Problem</th>
         		 </tr>
      		</thead>
      	</table>	
      	<table class="t2">	
      		<tbody>
        <%while(rs.next())
        {
            %>
            <tr>
            	<td><%=rs.getString("appointment_id") %></td>
                <td><%=rs.getString("doc_email_id") %></td>
                <td><%=rs.getString("date_of_appointment") %></td>
                <td><%=rs.getString("time") %></td>
                <td><%=rs.getString("problem_area") %></td>
            </tr>
            <%}}%>
           </tbody>
        </table><br> 
        <form method="post" action="" >
        <div class="i1">
        	<input type="number" name="app" placeholder="Enter appointment ID">
        	<input class="btn" type="submit" name="b20" value="Delete" >
        	<input class="btn" type="reset" value="Reset">
        </div>
        </form>
<%
String app_no=request.getParameter("app");
if(request.getParameter("b20")!=null){
	Connection con=ConnectionProvider.getConnection();
	PreparedStatement pst1=con.prepareStatement("delete from appointment_table where appointment_id='"+app_no+"' and std_email_id='"+email+"'");
	int v=pst1.executeUpdate();
	if (v>0){
		out.print("<script>alert('Appointment deleted.');</script>");
		response.sendRedirect("cancel_an_appointment.jsp");
	}
	else{
		out.print("<script>alert('Please enter correct appointment ID');</script>");
	}
	
}
%>

      	</center>
      </div>



</body>
</html>