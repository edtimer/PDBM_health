<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<title>Admin Management</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.1/examples/dashboard/">




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
.marg{
margin-bottom:0px;
padding-top:10px;
}

.card-img-top{
margin-left: auto;
margin-right: auto;
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
					<li class="nav-item"><a class="nav-link" href="patient_Information.jsp">Edit
							patient</a></li>
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
				style="width: 280px; height:55em; ">
				<a href="/"
					class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">

					<span class="fs-4">Netzilla</span>
				</a>
				<hr>
				<ul class="nav nav-pills flex-column mb-auto">
					<li class="nav-item"><a href="#" class="nav-link "
						aria-current="page"> Home </a></li>
					<li><a href="#" class="nav-link text-white active">

							Dashboard </a></li>
					<li><a href="#" class="nav-link text-white"> Patient management </a></li>
					<li><a href="#" class="nav-link text-white"> User Management </a></li>
					<li><a href="#" class="nav-link text-white"> Reports </a></li>
				</ul>
				<hr>
				<div class="dropdown">
					<a href="#"
						class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
						id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="sample.jpg" alt="" width="32" height="32"
						class="rounded-circle me-2"> <strong>User</strong>
					</a>
				</div>
			</div>
			<div class="col-md-2"></div>
			
			<div  class="card-deck col-md-5 text-center">
			<h1 style="text-align:center;">System stats</h1>
				<div class="card">
					<img style="width: 100px; height: 100px; " class="card-img-top"
						src="bed.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Beds</h5>
						<p class="card-text">14</p>
					</div>

				</div>
				<div class="card">
					<img style="width: 100px; height: 100px;" class="card-img-top" src="doctors.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Physicians</h5>
						<p class="card-text">7</p>
					</div>

				</div>
				<div class="card">
					<img style="width: 100px; height: 100px;" class="card-img-top" src="patients.jpg" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Staff</h5>
						<p class="card-text">20</p>
					</div>

				</div>
				<div class="tab">
							<h2 style="text-align:center;">System logs</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Session</th>
							<th scope="col">Logged in</th>
							<th scope="col">date</th>
							<th scope="col">time</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1,001</td>
							<td>random</td>
							<td>data</td>
							<td>placeholder</td>
							<td>text</td>
						</tr>
						<tr>
							<td>1,002</td>
							<td>placeholder</td>
							<td>irrelevant</td>
							<td>visual</td>
							<td>layout</td>
						</tr>
						<tr>
							<td>1,003</td>
							<td>data</td>
							<td>rich</td>
							<td>dashboard</td>
							<td>tabular</td>
						</tr>
						<tr>
							<td>1,003</td>
							<td>information</td>
							<td>placeholder</td>
							<td>illustrative</td>
							<td>data</td>
						</tr>
						<tr>
							<td>1,004</td>
							<td>text</td>
							<td>random</td>
							<td>layout</td>
							<td>dashboard</td>
						</tr>
						<tr>
							<td>1,005</td>
							<td>dashboard</td>
							<td>irrelevant</td>
							<td>text</td>
							<td>placeholder</td>
						</tr>
						<tr>
							<td>1,006</td>
							<td>dashboard</td>
							<td>illustrative</td>
							<td>rich</td>
							<td>data</td>
						</tr>


					</tbody>
				</table>
			</div>
			</div>
			</div>

		</div>
	</div>


	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
</body>
</html>
