<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h2 style="text-align:center;">Staff list</h2>
			<div class="table-responsive">
			<table cellpadding="0" cellspacing="0" border="0"
				class="datatable table table-striped table-bordered ">
				<thead>
					<tr>
						<th>staff ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>email</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="staff" items="${stafftlist}">
						<tr class="gradeX">
							<c:if test="${staff.id==null}">
								<td>No staff records found</td>
							</c:if>
							<td class="center"><c:out value="${staff.id}" /></td>
							<td class="center"><c:out value="${staff.firstName}" /></td>
							<td class="center"><c:out value="${staff.lastName}" /></td>
							<td class="center"><c:out value="${staff.email}" /></td>
							<td>
								<form method=post>

									<input type="submit" value="Edit" class="btn-primary"
										formaction="PatientController/edit?id=<c:out value='${staff.id}'/>">
									<input type="submit" value="Delete" class="btn-danger"
										formaction="PatientController/delete?id=<c:out value='${staff.id}'/>">
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