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
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="patient_Registration.jsp">Register patient</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Edit
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

	<div class="date">
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
	<!--the following script is not working yet it should make the success login message go away-->
	<script>
		function alerto() {
			var alertPlaceholder = document
					.getElementById('liveAlertPlaceholder')
			var alertTrigger = document.getElementById('liveAlertBtn')

			function alert(message, type) {
				var wrapper = document.createElement('div')
				wrapper.innerHTML = '<div class="alert alert-' + type + ' alert-dismissible" role="alert">'
						+ message
						+ '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

				alertPlaceholder.append(wrapper)
			}

			if (alertTrigger) {
				alertTrigger.addEventListener('click', function() {
					alert('Nice, you triggered this alert message!', 'success')
				})
			}
		}
	</script>
</body>
</html>