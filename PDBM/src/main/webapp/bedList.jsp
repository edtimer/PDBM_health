<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.Model.Bed"%>
<%@page import="com.Model.Patient"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bed list</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
</head>
<body>
<body class="mx-autojustify-content-centeralign-items-center">
<c:set var="bed" value="${bed}" scope="session" />
<c:set var="patient" value="${patients}" scope="session" />

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
						href="staff_Information.jsp">Edit staff</a></li>
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
	<div class="container">
		<div class="alert alert-success alert-dismissable" role="alert">
			Welcome
			<button class="close" type="button" data-dismiss="alert">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="text-center">
			<h3 class="text-center">Bed records</h3>
			<p><img src="bed.png" class="round text-center" 
				style="width: 100px; height: 100px;"></p>
		</div>
			<table cellpadding="0" cellspacing="0" border="0"
				class="datatable table table-striped table-bordered ">
				<thead>
					<tr>
						<th>Bed No</th>
						<th>Floor</th>
						<th>Room</th>
						<th>Bed Status</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="bed" items="${bedlist}">
						<tr class="gradeX">
							<c:if test="${bedlist==null}">
								<td>No bed records found</td>
							</c:if>
							<td class="center"><c:out value="${bed.bedNo}" /></td>
							<td class="center"><c:out value="${bed.floor}" /></td>
							<td class="center"><c:out value="${bed.roomNo}" /></td>
							<td class="center">
							<form action="updateBS" method="post">
								<select name="bedStatus" id="bedStatus">
									<option selected><c:out value="${bed.bedStatus}" /></option>
									  <option value="Clean">Clean</option>
									  <option value="Not Clean">Not Clean</option>
									  <option value="Exchange Mattress">Exchange Mattress</option>
								</select>
								<input type="hidden" name="bedNo" value="${bed.bedNo}">
							</td>
							<td>							
									<button type="submit" class="btn btn-success" onclick="confirmFunction()">
										Change Bed Status</button>
								</form>
							</td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.js"></script>
	<script>
	function confirmFunction(){
		if(confirm("Do you want to change the bed status?") == true){
			alert("Bed status has been changed!");
		}
		else{
			alert("Bed status has not beed changed.");
		}
	}
	</script>
</body>
</html>