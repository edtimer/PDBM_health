
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
	<div class="alert alert-success" onload="alerto()" role="alert">Welcome</div>
	<%
	//the following line is to prevent the page being stored as a cache when logged out
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("pragma", "no-cache");
	response.setHeader("expires", "0");
	if (session.getAttribute("credentials") == null) {
		response.sendRedirect("Login_page.jsp");
	}
	%>
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
					<li class="nav-item"><a class="nav-link"
						href="patient_Registration.jsp">Register patient</a></li>
					<li class="nav-item"><a class="nav-link"
						href="patient_Information.jsp">Edit patient</a></li>
					<li class="nav-item"><a class="nav-link"
						href="Admin_Login.jsp">Admin</a></li>
				</ul>
				<form class="d-flex" action="logout" method="post">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" name="pid">
					<button class="btn btn-outline-success"
						formaction="search_Patient.jsp" type="submit">Search</button>
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

					<c:forEach var="patient" items="${patientlist}">
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

									<input type="submit" value="Edit" class="btn-primary"
										formaction="PatientController/edit?id=<c:out value='${patient.id}'/>">
									<input type="submit" value="Delete" class="btn-danger"
										formaction="PatientController/delete?id=<c:out value='${patient.id}'/>">
									<input type="submit" value="Assign bed" class="btn-success"
										formaction="PatientController/assign?id=<c:out value='${patient.id}'/>">
								</form>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link">Previous</a>
					</li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
	<!--the following script is not working yet it should make the success login message go away-->
	<script>
		function alerto(message, type) {
			var wrapper = document.createElement('div')
			wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">'
					+ message
					+ '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

			alertPlaceholder.append(wrapper)
			function setTimeOut() {
				var a = wrapper.innerHTML;
				document.getElementById(a);
				a.parentNode.removeChild(a);
			}
		}

		if (alertTrigger) {
			alertTrigger.addEventListener('click', function() {
				alert('Nice, you triggered this alert message!', 'success')
			})
		}}
	</script>
</body>
</html>