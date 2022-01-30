
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Model.Patient"%>
<%@ page import="com.Controllers.UserController"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS for bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<title>Main-Page</title>
</head>
<body class="mx-auto justify-content-center align-items-center">

	<%
	//the following line is to prevent the page being stored as a cache when logged out
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("pragma", "no-cache");
	response.setHeader("expires", "0");
	if (session.getAttribute("credentials") == null) {
		response.sendRedirect("Login_page.jsp");

	}
	%>

	<!-- thinkinghow to get the int and pass it to controller-->
	<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Medical system</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">

				<form class="d-flex" action="logout" method="post">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
					<button class="btn btn-outline-danger" type="submit">Logout</button>

				</form>
			</div>
		</div>
	</nav>
	<form action="UserController/searchstaff" method="post">
	<div class="container pt-7 my-4">
	<h2 style=text-align:center;>Search for Staff by staff id</h2>
	<br>
	</div>
	<div class="container">
<div class="input-group">
  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" name="id" />
  <input type="submit" class="btn btn-outline-success"/>
</div>
</div>
</form>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>


</body>
</html>