<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Model.Patient"%>
<!doctype html>
<c:set var="patient" value="${patient}" scope="session"/>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- CSS for bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<title>Edit patient</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/components/buttons/">


<%
//the following line is to prevent the page being stored as a cache when logged out
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
response.setHeader("pragma", "no-cache");
response.setHeader("expires", "0");
if (session.getAttribute("credentials") == null) {
	response.sendRedirect("Login_page.jsp");

}
%>

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">

<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">

<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.marg {
	margin-bottom: 0px !important;
	padding-top: 10px;
}

#profile_edit {
	padding: 15px;
	width: 150px;
	height: 150px;
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>
<body>

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
						aria-current="page" href=<c:url value="/PatientController"/>>Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="patient_Registration.jsp">Register patient</a></li>
					<li class="nav-item"><a class="nav-link"
						href="search_Patient.jsp">Edit patient</a></li>
					<li class="nav-item"><a class="nav-link"
						href="Admin_Login.jsp">Admin</a></li>
				</ul>
				<form class="d-flex" action=<c:url value="/logout"/> method="post">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" name="sid">
					<button class="btn btn-outline-success"
						formaction="search_Patient.jsp" type="submit">Search</button>
					<button class="btn btn-outline-danger" type="submit">Logout</button>

				</form>
			</div>
		</div>
	</nav>
	<div></div>
	<form action=<c:url value="/update"/> method="post">
		<div class="container-fluid">
			<div class="row">
				<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark"
					style="width: 280px; height: 55em;">
					<a href="/"
						class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">

						<span class="fs-4">Netzilla</span>
					</a>
					<hr>
					<ul class="nav nav-pills flex-column mb-auto">
						<li class="nav-item"><a href="#" class="nav-link "
							aria-current="page"> Home </a></li>
						<li><a href="#" class="nav-link text-white"> Dashboard </a></li>
						<li><a href="#" class="nav-link text-white active">
								Patient management </a></li>
						<li><a href="#" class="nav-link text-white"> User
								Management </a></li>
						<li><a href="#" class="nav-link text-white"> Reports </a></li>
					</ul>
					<hr>

				</div>

				<div class="col-sm-2"></div>
				<div
					class="container h-100 d-flex justify-content-center align-items-center col-md-8">
					<img src="../sample.jpg" id="profile_edit"
						class="img-fluid rounded-start" alt="...">
					<div class="card-body input-group mb-12">
						<div class="card tabs">
							<ul class="list-group list-group-flush ">

								<li class="list-group-item "><b>Patient ID :</b> <c:out
										value="${patient.id}" /></li>

								<li class="list-group-item"><b>First Name :</b> <input name="firstName" type="text"
									value="<c:out value='${patient.firstName}'/>"></li>

								<li class="list-group-item"><b>last Name :</b> <input type="text" name="lastName"
									value="<c:out value='${patient.lastName}'/>"></li>

								<li class="list-group-item"><b>DOB :</b> <input name="dob" type="text"
									value="<c:out value='${patient.dob}'/>"></li>



								<li class="list-group-item"><b>phone # :</b> <input name="phoneNumber"
									type="text" value="<c:out value='${patient.phoneNumber}'/>"></li>

								<li class="list-group-item"><b>address:</b> <input name="address"
									type="text" value="<c:out value='${patient.address}'/>"></li>

								<li class="list-group-item"><b>address2 :</b> <input name="address2"
									type="text" value="<c:out value='${patient.address2}'/>"></li>

								<li class="list-group-item"><b>country:</b> <input name="country"
									type="text" value="<c:out value='${patient.country}'/>"></li>

								<li class="list-group-item"><b>state :</b> <input name="state"
									type="text" value="<c:out value='${patient.state}'/>"></li>

								<li class="list-group-item"><b>zip :</b> <input type="text"name="zip"
									value="<c:out value='${patient.zip}'/>"></li>



							</ul>
							<br>
							<h5 style="text-align: center">Gender selection</h5>
							<br> <select name="gender" class="form-select"
								aria-label="Default select example" required name="gender">
								<option selected>Select gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>

							</select>

							<div class="card-body">
								<button type="submit" class="btn btn-primary">submit</button>
								<a href="#"><button type="button" onclick="goBack()"
										class="btn btn-danger">cancel</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>



	<script>
		function printPage() {
			window.print();
		}
	</script>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
	<script>
		var dt = new Date();
		document.getElementById('date-time').innerHTML = dt;
	</script>
	<script>
		('#exampleModal').on('shown.bs.modal', function() {
			('#patient-name').trigger('focus');
		})
	</script>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
