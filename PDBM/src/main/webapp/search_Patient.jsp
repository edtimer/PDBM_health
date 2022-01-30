
<%@page import="java.util.ArrayList"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.Model.Patient"%>
<%@ page import="com.Controllers.PatientController"%>
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
	<%int id = ((int)request.getAttribute("pid")); %> 
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
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="main_Page.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						class="disabled">Diagnose patient</a></li>
				</ul>
				<form class="d-flex" action="logout" method="post">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
					<button class="btn btn-outline-danger" type="submit">Logout</button>

				</form>
			</div>
		</div>
	</nav>

	<!--   <div class="date">
		<div class="content">
			<div class="container text-left">
				<div class="row justify-content-center">
					<div class="row">
						<div class="input-append date" id="dp3" data-date="12-02-2012"
							data-date-format="dd-mm-yyyy">
							<input class="span2" size="16" type="text" value="12-02-2012">
							<span class="add-on"><i class="icon-th"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>-->

	<div id="wrap">
		<div class="container">
			<h3>Patient records</h3>
			<table cellpadding="0" cellspacing="0" border="0"
				class="datatable table table-striped table-bordered ">
				<thead>
					<tr>
						<th>Patient ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Age</th>
						<th>Phone number</th>
					</tr>
				</thead>
				<tbody>

					<tr class="gradeX">
						<c:if test="${patient.id==null}">
							<td>No patient records found</td>
						</c:if>
						<td class="center"><c:out value="${patient.id}" /></td>
						<td class="center"><c:out value="${patient.firstName}" /></td>
						<td class="center"><c:out value="${patient.lastName}" /></td>
						<td class="center"><c:out value="${patient.dob}" /></td>
						<td class="center"><c:out value="${patient.phoneNumber}" /></td>
						<td>
							<form method=post>
								<input type="submit" value="select" class="btn-primary"
									formaction="PatientController/getInfo?id=<c:out value='${patient.id}'/>">
							</form>
					</tr>

				</tbody>

			</table>
		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>


</body>
</html>