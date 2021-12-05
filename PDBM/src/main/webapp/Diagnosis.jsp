<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS for bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<title>Insert title here</title>
<style>
body{
background-color:#f0f0f0;
}
.row{
padding:1rem;

text-align:center;
}
.footer{
text-align:center;
}
</style>

</head>
<body>
</body>
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
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="patient_Registration.jsp">Register</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Edit
							patient</a></li>
					<li class="nav-item"><a class="nav-link" href="Management.jsp">Admin</a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class=container>
	<div class="row">
	<div class="col-sm-3"><div class="card" style="width: 18rem;">
  <img src="sample.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Patient info</h5>
    
    <p class="card-text">Name: Butt butt</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Age: 24</li>
    <li class="list-group-item">Sex: Female</li>
    <li class="list-group-item">something here</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">View profile</a>
    <a href="#" class="card-link">Generate report</a>
  </div>
</div>
</div>
<div class="col-5">
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
  <h3 class="accordion-header">Recent appointments</h3>
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        Appointment #1
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Appointment #2
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Appointment3 #3
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>
</div>
<div class="col-4">
<embed class="col-9" type="text/html" src="https://www.webmd.com/a-to-z-guides/common-topics"height="400"  >
</div>
	</div>
	<div class="text_area row">
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Enter patient diagnosis</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
</div>
	</div>
		<div class="text_area row">
<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Enter prescribed medications</label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
</div>
	</div>
	</div>
	<div class="footer">
	<input class="btn btn-primary" type="submit" value="Submit">
<input class="btn btn-danger" type="button" value="close">

<input class="btn btn-secondary" type="reset" value="clear">
	</div>
		<!-- JavaScript for bootstrap -->
		<script src="js/bootstrap.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/validate.js"></script>
</html>