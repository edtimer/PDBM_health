<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="patient_Registration.jsp">Register</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Edit
							patient</a></li>
					<li class="nav-item"><a class="nav-link" href="management.jsp">Admin</a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<div class="date">
	<div class="content">
<div class="container text-left">
<div class="row justify-content-center">
<div class="col-lg-3">
<h2 class="mb-5 text-center">Appointment Date</h2>
<form action="#">
<div class="form-group">
<input type="text" class="form-control" id="pick-date" placeholder="Pick A Date">
</div>
</form>
</div>
</div>
</div>
</div>
	</div>
		<div class="table container">
		<div class="table">
			<table class="table table-dark">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Address</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">K42423</th>
						<td>Someone</td>
						<td>Something</td>
						<td>Kelantan</td>
					</tr>
					<tr>
						<th scope="row">K234234</th>
						<td>Another person</td>
						<td>Test</td>
						<td>Johor</td>
					</tr>
					<tr>
						<th scope="row">K35643</th>
						<td>josephina</td>
						<td>123 Cheesecake</td>
						<td>123 Tatarino line</td>
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