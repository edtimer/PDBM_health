<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.Model.Users"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Staff list</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
</head>
<body>
<body class="mx-autojustify-content-centeralign-items-center">

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
						href="staff_Registration.jsp">Register staff</a></li>
					<li class="nav-item"><a class="nav-link"
						href="search_Staff.jsp">Edit staff</a></li>
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


	<div class="container">
		<div class="alert alert-success alert-dismissable" role="alert">
			Welcome
			<button class="close" type="button" data-dismiss="alert">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="text-center">
			<h3 class="text-center">staff records</h3>
			<img src="../patients.jpg" class="round text-center"
				style="width: 100px; height: 100px;">
		</div>
		<table cellpadding="0" cellspacing="0" border="0"
			class="datatable table table-striped table-bordered ">
			<thead>
				<tr>
					<th>Email</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>phone Number</th>
					<th>password</th>
					<th>access</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="staff" items="${Userslist}">

					<tr class="gradeX">
						<c:if test="${Userslist==null}">
							<td>No staff records found</td>
						</c:if>
						<td class="center"><c:out value="${staff.email}" /></td>
						<td class="center"><c:out value="${staff.firstName}" /></td>
						<td class="center"><c:out value="${staff.lastName}" /></td>
						<td class="center"><c:out value="${staff.phoneNumber}" /></td>
						<td class="center"><c:out value="${staff.password}" /></td>
						<td class="center"><c:out value="${staff.access}" /></td>
						<td align="center">
							<form method=post>
								<button type="submit" class="btn btn-primary"
									formaction="UserController/editingStaff?id=<c:out value='${staff.user_id}'/>">Edit</button>

								<button type="submit" class="btn btn-danger"
									formaction="UserController/deleteStaff?id=<c:out value='${staff.user_id}'/>">Delete</button>
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
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>