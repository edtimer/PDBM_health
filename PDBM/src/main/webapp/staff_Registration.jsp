<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="medical_logo.jpg">

<title>Staff Registration</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">

</head>

<!--tried the following styles but it didn't work-->
<!--style="display:block;width:50%;margin:0 auto;"-->
<body class="bg-light text-center">

	<div class="container">
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="medical_logo.jpg" alt=""
				width="72" height="72">
			<h2>Registration form</h2>
			<p class="lead">Ensure all information is correct</p>
		</div>

		<div class="col-md-8 order-md-1 offset-2">
			<h4 class="mb-3">Staff Registration</h4>
			<form class="needs-validation" novalidate
				action="UserController/addStaff" method="post">
				<div class="row">
					<div class="col-md-6 mb-3">

						<label for="firstName">First name</label> <input type="text"
							class="form-control" id="firstName" name="firstName"
							placeholder="" value="" required>
						<div class="invalid-feedback">Valid first name is required.
						</div>
					</div>
					
					<div class="col-md-6 mb-3">
						<label for="lastName">Last name</label> <input type="text"
							class="form-control" id="lastName" name="lastName" placeholder=""
							value="" required>
						<div class="invalid-feedback">Valid last name is required.</div>
					</div>
				</div>
				
				<div class="row">
				<div class="col-md-6 mb-3">
				
					<label for="phoneNumber">Phone Number</label> <input type="text"
						class="form-control" id="phoneNumber" placeholder="" value=""
						name="phoneNumber" required>
					<div class="invalid-feedback">Check number format.</div>
				</div>

				<div class="mb-3">
				<div class="col-md-6 mb-3">
					<label for="username">Email</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">@</span>
						</div>
						<input type="email" class="form-control" name="email" id="email"
							placeholder="E-Mail here" required>
						<div class="invalid-feedback" style="width: 100%;">Your
							Email is required.</div>
					</div>
					</div>
				</div>
				</div>

				<div class="mb-3">
				<div class="col-md-6 mb-12">
					<label for="password">password </label> <input type="password"
						name="password" class="form-control" id="password"
						placeholder="**********">
					<div class="invalid-feedback">Please enter a valid password</div>
				</div>
				</div>

				<div class="mb-3">
					<label for="address">UserId</label> <input type="number"
						class="form-control" id="id" placeholder="staff ID" name="id"required>
					<div class="invalid-feedback">Please enter a valid format.</div>
				</div>

				<div class="mb-3">
					<select class="custom-select d-block w-100" name="access"
						id="access" required>
						<option value="admin">Admin</option>
						<option value="doctor">Doctor</option>
						<option value="staff">Staff</option>
					</select>
				</div>


				<hr class="mb-4">

				<button class="btn btn-outline-success btn-lg btn-block"
					type="submit">Register</button>
			</form>
		</div>
	</div>

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2022 netzilla</p>
	</footer>


	<!-- Bootstrap core JavaScript
    ================================================== -->

	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="js/vendor/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/vendor/holder.min.js"></script>

</body>
</html>