<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">
<!-- CSS for bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="icon" href="medical_logo.jpg">
<title>Bed Assignment</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/components/buttons/">




<!-- Favicons -->
<link rel="apple-touch-icon"
	href="/docs/5.1/assets/img/favicons/apple-touch-icon.png"
	sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png"
	sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png"
	sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">

<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">

<meta name="theme-color" content="#7952b3">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.marg {
	margin-bottom: 0px;
	padding-top: 10px;
}

#bed {
	border-radius: 8px;
	width: 50px;
	height: 50px;
	margin: 5px;
}

.card{
margin-bottom: 15px;
padding: 0px 0px 10px 10px;
}

.modal-header{
justify-content: center;
}
</style>


<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark marg">
<div class="container-fluid">
		<a class="navbar-brand" href="#">Netzilla</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav me-auto mb-2 mb-md-0">
				<li class="nav-item"><a class="nav-link "
					aria-current="page" href="#">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="patient_Registration.jsp">Register</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Edit
						patient</a></li>
				<li class="nav-item"><a class="nav-link active" href="Management.jsp">Admin</a></li>
			</ul>
			<form class="d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="container" style="width: 100%;">
			<h4><b>Bed Assignment</b></h4>
			</div>
					<div class="bed-assignment-box">
						 <div class="col-sm-6">
						    <div class="card">
						      <div class="card-body">
						        <h4 class="card-title">Floor 2 Room 1</h4>
						        <p class="card-text">The available beds are updating in real time</p>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R1B1" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R1B2" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R1B3" onClick="reply_click(this.id)">-</button>
						        <br/><br/>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R1B4" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R1B5" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R1B6" onClick="reply_click(this.id)">-</button>
						      </div>
						    </div>
						  </div>
						  <div class="col-sm-6">
						    <div class="card">
						      <div class="card-body">
						        <h4 class="card-title">Floor 2 Room 2</h4>
						        <p class="card-text">The available beds are updating in real time</p>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R2B1" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R2B2" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R2B3" onClick="reply_click(this.id)">-</button>
						        <br/><br/>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R2B4" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R2B5" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F2R2B6" onClick="reply_click(this.id)">-</button>
						      </div>
						    </div>
						  </div>
						  
						 <div class="col-sm-6">
						    <div class="card">
						      <div class="card-body">
						        <h4 class="card-title">Floor 1 Room 1</h4>
						        <p class="card-text">The available beds are updating in real time</p>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R1B1" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R1B2" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R1B3" onClick="reply_click(this.id)">-</button>
						        <br/><br/>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R1B4" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R1B5" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R1B6" onClick="reply_click(this.id)">-</button>
						      </div>
						    </div>
						  </div>
						  <div class="col-sm-6">
						    <div class="card">
						      <div class="card-body">
						        <h4 class="card-title">Floor 1 Room 2</h4>
						        <p class="card-text">The available beds are updating in real time</p>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R2B1" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R2B2" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R2B3" onClick="reply_click(this.id)">-</button>
						        <br/><br/>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R2B4" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R2B5" onClick="reply_click(this.id)">-</button>
						        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#bedModal" id="F1R2B6" onClick="reply_click(this.id)">-</button>
						      </div>
						    </div>
						  </div>
						  <p style="text-align: right;" class="available-desc">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="#0d6efd" class="bi bi-square-fill" viewBox="0 0 16 16">
 			 <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z" />
			</svg> Available
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="#6c757d" class="bi bi-square-fill" viewBox="0 0 16 16">
			  <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2z" />
			</svg> Not Available
								</p>
<!-- Modal -->
<div class="modal fade" id="bedModal" tabindex="-1" role="dialog" aria-labelledby="bedModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bedModalLabel">Bed Assignment</h5>
      </div>
      <div class="modal-body">
		<h4>Bed Information</h4>
		<table class="table">
		<tbody>
		<tr>
			<th scope="row" class="bed-no">Bed No</th>
			<td class="modal-body-table-row" id="bedIdModal"></td>
		<tr>
			<th scope="row" class="bed-location">Bed Location</th>
			<td>Floor Room </td>
		</tr>
		<tr>
			<th scope="row" class="bed-status">Bed Status</th>
			<td>Clean</td>
			</tr>
		</tbody>
		</table>
		<form>
		<div class="form-group">
		<label for="patient-name" class="col-form-label">Patient ID:</label>
		<input type="text" class="form-control" id="patient-name">
		</div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Assign</button>
      </div>
    </div>
  </div>
</div>
        <script type="text/javascript">
        function reply_click(clicked_id)
        {
        	document.getElementById("bedIdModal").innerHTML = clicked_id;
        	
        }
        </script>


			</div>
		</div>
	</div>



	<script src="./js/jquery-3.3.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/jquery.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
