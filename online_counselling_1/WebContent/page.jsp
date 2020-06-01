<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<%@page import="com.online_counselling_1.helper.ConnectionProvider"%>
<%@ page import="java.sql.*" %>

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
		String std_name=rs.getString("std_name");
		out.write("<script>alert(name_1);</script>");
}
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String type=(String)session.getAttribute("type");
%>
<h1>Hello user! you are a <%= type %></h1>


</body>
</html>