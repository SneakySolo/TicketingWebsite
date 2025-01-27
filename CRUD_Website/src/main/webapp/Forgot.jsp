<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Forgot Password</title>
</head>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1586982469023-9f3e18321fc7?q=80&w=2075&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.container {
		background-color: black;
		color: white;
		padding: 10px 20px 10px 20px;
		border-radius: 25px;
		margin-top: 25px;
	}
	.text {
		color: white;
	}
</style>
<body>
	<div class="text">
		<center><h1 class="display-1">Forgot your Password ?, don't worry we got you covered</h1></center>
	</div>
	<br>
	<div class="container">
	<form action="Forgot_pswd" method="post">
  <div class="mb-3 mt-3">
    <label for="email" class="form-label">Email:</label>
    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
  </div>
  <div class="mb-3">
    <label for="pwd" class="form-label">Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
  </div>
  <div class="mb-3">
    <label for="pwd" class="form-label">Confirm Password:</label>
    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="conf_pswd" required>
  </div>
  <br>
  <button type="submit" class="btn btn-primary">Change Password</button>
  <a href="LoginCRUD.jsp" class="btn btn-danger" role="button">Cancel</a>
	</form>
	</div>
	<br><br>
</body>
</html>