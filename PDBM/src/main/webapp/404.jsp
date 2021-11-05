<%@ page language="java" isErrorPage="true" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS for bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" href="medical_logo.jpg">
<title>Something went wrong</title>
</head>
<body>
<div style="text-align=center;" class="container vertical-center text-center ">
<h1  style="font-weight=900;">OOPS!</h1>
<br>
<h3>Error 404: Page not found</h3>
<br>
<button style="color:white;" name="back_error" class="w-20 btn btn-lg btn-success"  type="submit">Go back</button>
</div>
<br>
to display the following error we need to have a <% %> inside the jsp that would cause an issue
Error:
<!--<%=exception.getMessage() %>-->
<!-- JavaScript for bootstrap -->
<script src="js/bootstrap.js"></script>
<script src="js/jquery.js"></script>
</body>
</html>