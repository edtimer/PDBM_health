<%@page import="com.Dao.patientDao"%>
<%@page import="com.Model.Patient"%>
<%@page import="java.util.*"%>
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
<title>Patient list</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">




<!-- Bootstrap core CSS -->

<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">


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
</style>


<!-- Custom styles for this template -->
<link href="navbar-top.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Netzilla</a>
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
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link disabled">Disabled</a>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<main class="container">
		<div id="wrap">
			<div class="container">
				<h3>Patient records</h3>
				<%List<Patient> list=patientDao.getRecords(pageid,total); %>
				<table cellpadding="0" cellspacing="0" border="0"
					class="datatable table table-striped table-bordered">
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
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
						<tr class="gradeX">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
						<tr class="gradeX">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
						<tr class="gradeA">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
						<tr class="gradeA">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
						<tr class="gradeA">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
<tr class="gradeA">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
<tr class="gradeA">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
<tr class="gradeA">
							<td>ABC123</td>
							<td>First Name</td>
							<td>Last Name</td>
							<td class="center">24</td>
							<td class="center">016254558x</td>
						</tr>
					</tbody>

				</table>
                              <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
			</div>
		</div>
            
             
	</main>




</body>
</html>
