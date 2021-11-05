<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="404.jsp"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String db_url = "jdbc:postgresql://localhost:5432/medical";
	String sql = "select * from staff";
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection(db_url, "postgres", "0"); //creating connection to database
	Statement statement = con.createStatement();//needed to create a statement that will be sent

	ResultSet result = statement.executeQuery(sql); //executing our statement to view all staff
	result.next();
	%>
	
	We can print the information here:
	<br>
	<%= result.getString(1)%>
	class.forName todo: in postgress we will use the following
	Driver:org.postgresql.Driver URL:
	jdbc:postgresql://localhost:5432/medical username:postgres password:0
</body>
</html>