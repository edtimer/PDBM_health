<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
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
<title>Bed Assignment</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/components/buttons/">




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
	margin-bottom: 0px;
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
						aria-current="page" href="main_Page.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="patient_Registration.jsp">Register patient</a></li>
					<li class="nav-item"><a class="nav-link"
						href="patient_Information.jsp">Edit patient</a></li>
					<li class="nav-item"><a class="nav-link" href="Management.jsp">Admin</a></li>
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
				<div class="dropdown">
					<a href="#"
						class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="sample.jpg" alt="" width="32" height="32"
						class="rounded-circle me-2"> <strong>Patient</strong>
					</a>
				</div>
			</div>
			<div class="col-sm-1"></div>
			<div class="container col-md-5">
				<div class="card">
					<div class="card-body">
						<c:if test="${patient != null}">
							<form action="update" method="post">
						</c:if>
						<c:if test="${patient == null}">
							<form action="insert" method="post">
						</c:if>

						<caption>
							<h2>
								<c:if test="${patient != null}">
            			Edit Patient
            		</c:if>
								<c:if test="${patient== null}">
            			Add New Patient
            		</c:if>
							</h2>
						</caption>

						<c:if test="${patient != null}">
							<input type="hidden" name="id"
								value="<c:out value='${patient.id}' />" />
						</c:if>

						<fieldset class="form-group">
							<label>User Name</label> <input type="text"
								value="<c:out value='${patient.name}' />" class="form-control"
								name="name" required="required">
						</fieldset>

						<fieldset class="form-group">
							<label>User Email</label> <input type="text"
								value="<c:out value='${user.email}' />" class="form-control"
								name="email">
						</fieldset>

						<fieldset class="form-group">
							<label>User Country</label> <input type="text"
								value="<c:out value='${patient.country}' />"
								class="form-control" name="country">
						</fieldset>

						<button type="submit" class="btn btn-success">Save</button>
						</form>

					</div>
				</div>
			</div>
			<div class="card-body">
				<a href="#"><button type="button" onclick="window.print()"
						class="btn btn-success">Print</button></a>
			</div>
		</div>
	</div>


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
</body>
</html>
