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

<title>New Patient Registration</title>

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
					<li class="nav-item"><a class="nav-link"
						href="patient_Information.jsp">Edit patient</a></li>
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
		<div class="py-5 text-center">
			<img class="d-block mx-auto mb-4" src="medical_logo.jpg" alt=""
				width="72" height="72">
			<h2>Registration form</h2>
			<p class="lead">Ensure all information is correct</p>
		</div>

		<div class="col-md-8 order-md-1 offset-2">
			<h4 class="mb-3">Registration</h4>
			<form class="needs-validation" novalidate
				action="PatientController/add" method="post">
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
						<label for="dob">Date of birth</label> <input type="date" format="dd/mm/yyyy"
							class="form-control" id="dob" name="dob" placeholder="" value=""
							required>
						<div class="invalid-feedback">you cant be this old.</div>
					</div>
					<div class="col-md-6 mb-3">
						<label for="firstName">ID</label> <input type="number"
							class="form-control" id="id" name="id" placeholder="" value="" min="1" max="3"
							required>
						<div class="invalid-feedback">Valid ID (int) is required.</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="phoneNumber">Phone Number</label>
						<div class="input-group">
							<div class="input-group-prepend"></div>
							<input type="text" class="form-control" id="phoneNumber"
								name="phoneNumber" placeholder="ignore +60 in number" required>
							<div class="invalid-feedback" style="width: 100%;">Your A
								number is required.</div>
						</div>
					</div>



					<div class="col-md-6 mb-3">
						<label for="gender">Gender</label> <select
							class="custom-select d-block w-100" id="gender" name="gender"
							required>
							<option value="">Choose...</option>
							<option>Male</option>
							<option value="Afghanistan">Female</option>
						</select>
					</div>
				</div>



				<div class="mb-3">
					<label for="address">Address</label> <input type="text"
						class="form-control" id="address" name="address"
						placeholder="kelantan" required>
					<div class="invalid-feedback">Please enter your home address</div>
				</div>

				<div class="mb-3">
					<label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
					<input type="text" class="form-control" id="address2"
						name="address2" placeholder="Apartment or house" required>
				</div>

				<div class="row">
					<div class="col-md-5 mb-3">
						<label for="country">Country</label> <select
							class="custom-select d-block w-100" id="country" name="country"
							required>
							<option value="">Choose...</option>
							<option>Malaysia</option>
							<option value="Afghanistan">Afghanistan</option>
							<option value="Åland Islands">Åland Islands</option>
							<option value="Albania">Albania</option>
							<option value="Algeria">Algeria</option>
							<option value="American Samoa">American Samoa</option>
							<option value="Andorra">Andorra</option>
							<option value="Angola">Angola</option>
							<option value="Anguilla">Anguilla</option>
							<option value="Antarctica">Antarctica</option>
							<option value="Antigua and Barbuda">Antigua and Barbuda</option>
							<option value="Argentina">Argentina</option>
							<option value="Armenia">Armenia</option>
							<option value="Aruba">Aruba</option>
							<option value="Australia">Australia</option>
							<option value="Austria">Austria</option>
							<option value="Azerbaijan">Azerbaijan</option>
							<option value="Bahamas">Bahamas</option>
							<option value="Bahrain">Bahrain</option>
							<option value="Bangladesh">Bangladesh</option>
							<option value="Barbados">Barbados</option>
							<option value="Belarus">Belarus</option>
							<option value="Belgium">Belgium</option>
							<option value="Belize">Belize</option>
							<option value="Benin">Benin</option>
							<option value="Bermuda">Bermuda</option>
							<option value="Bhutan">Bhutan</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Bosnia and Herzegovina">Bosnia and
								Herzegovina</option>
							<option value="Botswana">Botswana</option>
							<option value="Bouvet Island">Bouvet Island</option>
							<option value="Brazil">Brazil</option>
							<option value="British Indian Ocean Territory">British
								Indian Ocean Territory</option>
							<option value="Brunei Darussalam">Brunei Darussalam</option>
							<option value="Bulgaria">Bulgaria</option>
							<option value="Burkina Faso">Burkina Faso</option>
							<option value="Burundi">Burundi</option>
							<option value="Cambodia">Cambodia</option>
							<option value="Cameroon">Cameroon</option>
							<option value="Canada">Canada</option>
							<option value="Cape Verde">Cape Verde</option>
							<option value="Cayman Islands">Cayman Islands</option>
							<option value="Central African Republic">Central African
								Republic</option>
							<option value="Chad">Chad</option>
							<option value="Chile">Chile</option>
							<option value="China">China</option>
							<option value="Christmas Island">Christmas Island</option>
							<option value="Cocos (Keeling) Islands">Cocos (Keeling)
								Islands</option>
							<option value="Colombia">Colombia</option>
							<option value="Comoros">Comoros</option>
							<option value="Congo">Congo</option>
							<option value="Congo, The Democratic Republic of The">Congo,
								The Democratic Republic of The</option>
							<option value="Cook Islands">Cook Islands</option>
							<option value="Costa Rica">Costa Rica</option>
							<option value="Cote D'ivoire">Cote D'ivoire</option>
							<option value="Croatia">Croatia</option>
							<option value="Cuba">Cuba</option>
							<option value="Cyprus">Cyprus</option>
							<option value="Czech Republic">Czech Republic</option>
							<option value="Denmark">Denmark</option>
							<option value="Djibouti">Djibouti</option>
							<option value="Dominica">Dominica</option>
							<option value="Dominican Republic">Dominican Republic</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Egypt">Egypt</option>
							<option value="El Salvador">El Salvador</option>
							<option value="Equatorial Guinea">Equatorial Guinea</option>
							<option value="Eritrea">Eritrea</option>
							<option value="Estonia">Estonia</option>
							<option value="Ethiopia">Ethiopia</option>
							<option value="Falkland Islands (Malvinas)">Falkland
								Islands (Malvinas)</option>
							<option value="Faroe Islands">Faroe Islands</option>
							<option value="Fiji">Fiji</option>
							<option value="Finland">Finland</option>
							<option value="France">France</option>
							<option value="French Guiana">French Guiana</option>
							<option value="French Polynesia">French Polynesia</option>
							<option value="French Southern Territories">French
								Southern Territories</option>
							<option value="Gabon">Gabon</option>
							<option value="Gambia">Gambia</option>
							<option value="Georgia">Georgia</option>
							<option value="Germany">Germany</option>
							<option value="Ghana">Ghana</option>
							<option value="Gibraltar">Gibraltar</option>
							<option value="Greece">Greece</option>
							<option value="Greenland">Greenland</option>
							<option value="Grenada">Grenada</option>
							<option value="Guadeloupe">Guadeloupe</option>
							<option value="Guam">Guam</option>
							<option value="Guatemala">Guatemala</option>
							<option value="Guernsey">Guernsey</option>
							<option value="Guinea">Guinea</option>
							<option value="Guinea-bissau">Guinea-bissau</option>
							<option value="Guyana">Guyana</option>
							<option value="Haiti">Haiti</option>
							<option value="Heard Island and Mcdonald Islands">Heard
								Island and Mcdonald Islands</option>
							<option value="Holy See (Vatican City State)">Holy See
								(Vatican City State)</option>
							<option value="Honduras">Honduras</option>
							<option value="Hong Kong">Hong Kong</option>
							<option value="Hungary">Hungary</option>
							<option value="Iceland">Iceland</option>
							<option value="India">India</option>
							<option value="Indonesia">Indonesia</option>
							<option value="Iran, Islamic Republic of">Iran, Islamic
								Republic of</option>
							<option value="Iraq">Iraq</option>
							<option value="Ireland">Ireland</option>
							<option value="Isle of Man">Isle of Man</option>
							<option value="Israel">Israel</option>
							<option value="Italy">Italy</option>
							<option value="Jamaica">Jamaica</option>
							<option value="Japan">Japan</option>
							<option value="Jersey">Jersey</option>
							<option value="Jordan">Jordan</option>
							<option value="Kazakhstan">Kazakhstan</option>
							<option value="Kenya">Kenya</option>
							<option value="Kiribati">Kiribati</option>
							<option value="Korea, Democratic People's Republic of">Korea,
								Democratic People's Republic of</option>
							<option value="Korea, Republic of">Korea, Republic of</option>
							<option value="Kuwait">Kuwait</option>
							<option value="Kyrgyzstan">Kyrgyzstan</option>
							<option value="Lao People's Democratic Republic">Lao
								People's Democratic Republic</option>
							<option value="Latvia">Latvia</option>
							<option value="Lebanon">Lebanon</option>
							<option value="Lesotho">Lesotho</option>
							<option value="Liberia">Liberia</option>
							<option value="Libyan Arab Jamahiriya">Libyan Arab
								Jamahiriya</option>
							<option value="Liechtenstein">Liechtenstein</option>
							<option value="Lithuania">Lithuania</option>
							<option value="Luxembourg">Luxembourg</option>
							<option value="Macao">Macao</option>
							<option value="Macedonia, The Former Yugoslav Republic of">Macedonia,
								The Former Yugoslav Republic of</option>
							<option value="Madagascar">Madagascar</option>
						</select>
						<div class="invalid-feedback">Please select a valid country.</div>
					</div>
					<div class="col-md-4 mb-3">
						<label for="state">State</label> <select
							class="custom-select d-block w-100" id="state" name="state"
							required>
							<option value="">Choose...</option>
							<option>Johor</option>
							<option>Kelantan</option>
							<option>Selangor</option>
						</select>
						<div class="invalid-feedback">Please provide a valid state.</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Zip</label> <input type="text"
							class="form-control" id="zip" placeholder="" name="zip" required>
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