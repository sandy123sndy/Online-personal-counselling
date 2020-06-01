<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page import="com.online_counselling_1.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Forgot password</title>
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
 a{
 	color: green;
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



    </style>
</head>
<body>

<form method="post" action="">
      <div class="info">
		<center>
		<table>
			<tr>
				<td>You are a: *</td>
				<td>
				<select class="dropdown_1" name="type" >
					<option>Student</option>
					<option>Doctor</option>
				</select>
				</td>
			</tr>

			<tr>
				<td>Enter your email ID: *</td>
				<td><input type="email" name="email"></td>
			</tr>		
			
			<tr>
				<td>Enter correct phone number: *</td>
				<td><input type="text" name="phnno"></td>
			</tr>
			
			<tr>
				<td>Give a new password: *</td>
				<td><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td><input class="btn" type="reset" value="Reset"></td>
				<td><input class="btn" type="submit" name="b20" value="Change"></td>
			</tr>
			
		</table>	      	
      	</center>
      </div>
      <center><h1><a href="login_page_1.jsp">Go to login page</a></h1></center>
      </form>
<%
String type=request.getParameter("type");
String email=request.getParameter("email");
String phnno=request.getParameter("phnno");
String new_pass=request.getParameter("pass");
String phn=null;
if(request.getParameter("b20")!=null){
	if(type.equals("Student")){
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from student_info where std_email_id=?");
		pst.setString(1, email);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			phn=rs.getString("std_phn");		
		}
		
		if(phnno.equals(phn)){
			Connection con1=ConnectionProvider.getConnection();
			PreparedStatement pst1=con1.prepareStatement("update login_table set password='"+new_pass+"' where email_id='"+email+"'");
			int v=pst1.executeUpdate();
	        if(v>0)
	        {
	        	out.print("<script>alert('Password updated');</script>");
	        }
		}
		else{
			out.print("<script>alert('Please enter correct phone number or email or type');</script>");
		}
	}
	else if(type.equals("Doctor")){
		Connection con=ConnectionProvider.getConnection();
		PreparedStatement pst=con.prepareStatement("select * from doctor_info where doc_email_id=?");
		pst.setString(1, email);
		ResultSet rs=pst.executeQuery();
		while(rs.next()){
			phn=rs.getString("doc_phn");		
		}
		
		if(phnno.equals(phn)){
			Connection con1=ConnectionProvider.getConnection();
			PreparedStatement pst1=con1.prepareStatement("update login_table set password='"+new_pass+"' where email_id='"+email+"'");
			int v=pst1.executeUpdate();
	        if(v>0)
	        {
	        	out.print("<script>alert('Password updated');</script>");
	        }
		}
		else{
			out.print("<script>alert('Please enter correct phone number or email or type');</script>");
		}
	}
	else{
		out.print("<script>alert('Please select a type!')</script>");
	}
	
	
}




%>

</body>
</html>