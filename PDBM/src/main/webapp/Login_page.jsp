<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	errorPage="404.jsp" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS for bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">

<title>login Page</title>
</head>
<body class="text-center">
	<div
		class="d-flex min-vh-100 w-50 h-50 mx-auto justify-content-center align-items-center">
		<main class="form-signin">
			<form  onsubmit="return validate()" action="signin" method="post">
				<img class="mb-4" src="medical_logo.jpg" alt="" width="72"
					height="57">
				<h1 class="h3 mb-3 fw-normal">Sign in</h1>
				<div class="form-floating">
					<input type="email" class="form-control" id="floatingInput"
						name="email" placeholder="name@gmail.com"> <label
						for="floatingInput">Email</label>
				</div>
				<div class="form-floating">
					<input type="password" class="form-control" id="floatingPassword"
						name="pass" placeholder="Password"> <label
						for="floatingPassword">Password</label>
				</div>
				<div class="checkbox mb-3">
					<label> <input type="checkbox" value="remember-me">
						Remember me
					</label>
				</div>
				<button class="w-100 btn btn-lg btn-success" type="submit">Sign
					in</button>
				<p class="mt-5 mb-3 text-muted">2021</p>

			</form>
		</main>
		<!-- JavaScript for bootstrap -->
		<script src="js/bootstrap.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/validate.js"></script>
	</div>
</body>
</html>