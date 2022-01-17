<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
.divider:after, .divider:before {
	content: "";
	flex: 1;
	height: 1px;
	background: #eee;
}
</style>
<body>
	<section class="vh-100">
		<div class="container py-5 h-100">
			<div
				class="row d-flex align-items-center justify-content-center h-100">
				<div class="col-md-8 col-lg-7 col-xl-6">
					<img
						src="admin.jpg"
						class="img-fluid" alt="Phone image">
				</div>
				<div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
					<form>
						<!-- Email input -->
						<div class="form-outline mb-4">
							<input type="email" id="form1Example13"
								class="form-control form-control-lg" /> <label
								class="form-label" for="form1Example13">Email address</label>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4">
							<input type="password" id="form1Example23"
								class="form-control form-control-lg" /> <label
								class="form-label" for="form1Example23">Password</label>
						</div>





								<!-- Submit button -->
								<button type="submit" class="btn btn-success btn-lg btn-block">Sign
									in</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>