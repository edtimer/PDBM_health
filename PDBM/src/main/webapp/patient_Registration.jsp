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

<title>Registration</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
<script type="text/javascript"
	src="https://ff.kis.v2.scr.kaspersky-labs.com/FD126C42-EBFA-4E12-B309-BB3FDD723AC1/main.js?attr=gS0cCAe5xg4v3tgJzlqlQSuWOSeJJYN1WH94DCqGqBVcvldHPfgvav8cxz5x9EjDn9-mgWPDdGo7WjLStmnmHk_4NH8DyPbxHTXp30IZ2DY"
	charset="UTF-8"></script>
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
			<h4 class="mb-3">Registration</h4>
			<form class="needs-validation" novalidate>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="firstName">First name</label> <input type="text"
							class="form-control" id="firstName" placeholder="" value=""
							required>
						<div class="invalid-feedback">Valid first name is required.
						</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="lastName">Last name</label> <input type="text"
							class="form-control" id="lastName" placeholder="" value=""
							required>
						<div class="invalid-feedback">Valid last name is required.</div>
					</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="lastName">Date of birth</label> <input type="date"
						class="form-control" id="dob" placeholder="" value="" required>
					<div class="invalid-feedback">you cant be this old.</div>
				</div>
				

				<div class="mb-3">
					<label for="username">Username</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">@</span>
						</div>
						<input type="text" class="form-control" id="username"
							placeholder="Username" required>
						<div class="invalid-feedback" style="width: 100%;">Your
							username is required.</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="email">Email <span class="text-muted">(Optional)</span></label>
					<input type="email" class="form-control" id="email"
						placeholder="you@example.com">
					<div class="invalid-feedback">Please enter a valid email
						address.</div>
				</div>

				<div class="mb-3">
					<label for="address">Address</label> <input type="text"
						class="form-control" id="address" placeholder="kelantan" required>
					<div class="invalid-feedback">Please enter your home address
					</div>
				</div>

				<div class="mb-3">
					<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
					<input type="text" class="form-control" id="address2"
						placeholder="Apartment or house">
				</div>

				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="country">Country</label> <select
							class="custom-select d-block w-100" id="country" required>
							<option value="">Choose...</option>
							<option>Malaysia</option>
						</select>
						<div class="invalid-feedback">Please select a valid country.
						</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">State</label> <select
							class="custom-select d-block w-100" id="state" required>
							<option value="">Choose...</option>
							<option>Johor</option>
						</select>
						<div class="invalid-feedback">Please provide a valid state.
						</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Zip</label> <input type="text"
							class="form-control" id="zip" placeholder="" required>
						<div class="invalid-feedback">Zip code required.</div>
					</div>
				</div>
				<hr class="mb-4">

				<button class="btn btn-outline-success btn-lg btn-block"
					type="submit">Register</button>
			</form>
		</div>
	</div>

	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">&copy; 2021 netzilla</p>
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