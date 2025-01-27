<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>login page</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1627317891852-f41bbe6f6972?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.title {
		color: white;
		margin-bottom: 15px;
		font-family: Arial, Helvetica, sans-serif;
	}
	.container {
		background-color: black;
		color: white;
		width: 1000px;
		padding: 15px 25px 15px 25px;
		border-radius: 25px;
	}
</style>
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="javascript:void(0)">OSCULUS</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link" href="homePage.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">Contact us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="javascript:void(0)">MyTickets</a>
              </li>
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="text" placeholder="Search">
              <button class="btn btn-primary" type="button">Submit</button>
            </form>
          </div>
        </div>
      </nav>
<br>
	<div class="title">
        <center><h1 class="display-1 mx-auto d-block">Login</h1></center>
    </div>
    <br>
   <!-- Login box -->
   <div class="container">
   		<h1>Enter your Credentials :</h1>
        <form action="log_in" method="post">
            <div class="mb-3 mt-3">
              <label for="email" class="form-label">Email:</label>
              <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
            </div>
            <div class="mb-3">
              <label for="pwd" class="form-label">Password:</label>
              <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
            </div>
            <div class="form-check mb-3">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox" name="remember"> Remember me
              </label>
            </div>
            <button type="submit" class="btn btn-warning">Submit</button>
          </form> 
          <a href="Forgot.jsp">Forgot Password</a> 
          <br>
          <a href="AdminLogin.jsp">Log in as Admin</a> 
        <center><p>Not a user, Sign-up <a href="SignupCRUD.jsp">here</a></p></center>
    </div>    
	<br>
	<br>
	<br>
</body>
</html>