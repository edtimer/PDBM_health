<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.Model.Users"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<title>Admin page</title>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- CSS for bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="dashboard.css" rel="stylesheet">
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">
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

.card-img-top {
	margin-left: auto;
	margin-right: auto;
}
</style>


<body id="myPage">

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

	<!-- Image Header -->
	<div class="w3-display-container w3-animate-opacity">

		<img src="new.jpg" class="img-fluid"alt="boat" style="width: 100%; min-height: 350px; max-height: 600px;">

	</div>

	<hr>

	<!-- stats Container -->
	<div class="w3-container w3-padding-64 w3-center" id="team">
		<h2>System stats</h2>

		<div class="w3-row">
			<br>

			<div class="w3-third">
				<a href="bedList.jsp"> <img src="bed.png" alt="bed image"
					style="width: 45%" class="w3-circle w3-hover-opacity"></a>
				<h3>Beds</h3>
				<p>14</p>
			</div>

			<div class="w3-third">
				<a href="patientList.jsp"> <img src="patients.jpg"
					alt="patient image" style="width: 45%"
					class="w3-circle w3-hover-opacity"></a>
				<h3>Patients</h3>
				<p><b>${fn:length(patientlist)}</b></p>
			</div>

			<div class="w3-third">
				<a href="staffList.jsp"> <img src="doctors.jpg"
					alt="doctor image" style="width: 45%"
					class="w3-circle w3-hover-opacity"></a>
				<h3>Staff</h3>
				<p><b>${fn:length(Userslist)}</b></p>
			</div>


		</div>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>



</body>
</html>