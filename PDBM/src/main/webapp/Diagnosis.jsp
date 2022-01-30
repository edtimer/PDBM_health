<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Model.Patient"%>
<%@ page import="com.Model.Report"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS for bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<title>Consultation</title>
<style>
body {
	background-color: #f0f0f0;
}

.row {
	padding: 1rem;
	text-align: center;
}

.footer {
	text-align: center;
}

.pad {
	padding-right: 0;
	padding-left: 0;
}

.tabs {
	padding-left: 0;
}
</style>

</head>
<body>

</body>
<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Medical system</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
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
<div class=container>
	<div class="row">
		<div class="card mb-4-fluid" style="max-width: 2020px;">
			<div class="row g-0">
				<div class="col-md-4">
					<img src="../sample.jpg" class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<div class="card tabs">
							<ul class="list-group list-group-flush">
								<li class="list-group-item "><b>First Name :</b> <c:out
										value="${patient.firstName}" /></li>
								<li class="list-group-item "><b>Last Name :</b> <c:out
										value="${patient.lastName}" /></li>

								<li class="list-group-item"><b>DOB :</b> <c:out
										value="${patient.dob}" /></li>

								<li class="list-group-item"><b>Gender :</b> <c:out
										value="${patient.gender}" /></li>

								<li class="list-group-item "><b>Allergy:</b> None</li>
							</ul>
							<div class="card-body">
								<a href="/main_Page.jsp"><button type="button"
										class="btn btn-success">Profile</button></a> <a
									href="/main_Page.jsp"><button type="button"
										class="btn btn-success">Report</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-7">
				<h3 class="accordion-header">Recent appointments</h3>
				<c:forEach var="report" items="${reportlist}">

					<c:if test="${report.patientId==null}">
						<h3>No report records found</h3>
					</c:if>
					<div class="accordion" id="accordionExample">
						<div class="accordion-item">

							<h2 class="accordion-header" id="headingOne">
								<button class="accordion-button" type="button"
									data-bs-toggle="collapse" data-bs-target="#collapseOne"
									aria-expanded="false" aria-controls="collapseOne">
									Appointment #1</button>
							</h2>
							<div id="collapseOne" class="accordion-collapse collapse show"
								aria-labelledby="headingOne" data-bs-parent="#accordionExample">
								<div class="accordion-body">
									<strong>Diagnosis:</strong><br>
									<c:out value="${report.diagnosis}" />
								</div>
								<strong>Medication:</strong><br>
								<c:out value="${report.prescribedMeds}" />
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
			<div class="col-5">
				<embed class="col-9 pad" type="text/html"
					src="https://www.webmd.com/a-to-z-guides/common-topics"
					height="400">
			</div>
		</div>
		<h2>
			<c:out value="${report.diagnosis}" />
		</h2>
	</div>
	<form action=<c:url value="/submit"/> method="post">
		<div class="text_area row">
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">Enter
					patient diagnosis</label>
				<textarea name="diagnosis" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
		</div>
		<div class="text_area row">
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">Enter
					prescribed medications</label>
				<textarea name="medications" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
		</div>
		<div class="text_area row">
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label">Enter
					Allergy information</label>
				<textarea name="allergy" class="form-control"
					id="exampleFormControlTextarea1" rows="3"></textarea>
			</div>
			<c:set var="diagnosedPatient" value="${patient.id}" scope="session" />
			<c:out value="${patient.id}"/>
		</div>
		<div class="footer">
			<!-- add js pop up with confirmation -->
			<input class="btn btn-primary" type="submit" value="Submit"
				onclick="confirmed()"> <input class="btn btn-danger"
				type="button" value="close"> <input
				class="btn btn-secondary" type="reset" value="clear">
		</div>
	</form>
</div>

<!-- JavaScript for bootstrap -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	function confirmed() {
		confirm("report submitted");
	}
</script>
</html>