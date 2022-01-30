<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <body class=mx-auto justify-content-center align-items-center">
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
	<div class="text-center">
  <img src="doctors.jpg" class="rounded" alt="beds" style="width: 100px; height: 100px; ">
</div>
        <h2 style="text-align:center;">Doctor list</h2>
			<div class="table-responsive">
			<table cellpadding="0" cellspacing="0" border="0"
				class="datatable table table-striped table-bordered ">
				<thead>
					<tr>
						<th>Doctor ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>email</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="doctor" items="${doctorlist}">
						<tr class="gradeX">
							<c:if test="${doctor.id==null}">
								<td>No doctor records found</td>
							</c:if>
							<td class="center"><c:out value="${doctor.id}" /></td>
							<td class="center"><c:out value="${doctor.firstName}" /></td>
							<td class="center"><c:out value="${doctor.lastName}" /></td>
							<td class="center"><c:out value="${doctor.email}" /></td>
							<td>
								<form method=post>

									<input type="submit" value="Edit" class="btn-primary"
										formaction="PatientController/edit?id=<c:out value='${doctor.id}'/>">
									<input type="submit" value="Delete" class="btn-danger"
										formaction="PatientController/delete?id=<c:out value='${doctor.id}'/>">
								</form>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			</div>
      <script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
    </body>
</html>