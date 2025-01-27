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
<title>Sign-up page</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1663789669038-ba180c8c155a?q=80&w=1856&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.title {
		color: white;
		margin-bottom: 25px;
		font-style: italic;
	}
	.container {
		background-color: black;
		color: white;
		width: 1000px;
		padding: 25px 25px 25px 25px;
		border-radius: 25px;
	}
</style>
</head>
<body>
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
        <center><h1 class="display-1 mx-auto d-block">Sign-up to get futher access</h1></center>
    </div>
    <div class="container">
        <form action="signup" method="post">
            <div class="row">
                <p><b>Enter your name:</b></p>
              <div class="col">
                <input type="text" class="form-control" placeholder="First Name" name="First Name">
              </div>
              <div class="col">
                <input type="text" class="form-control" placeholder="Last Name" name="Last Name">
              </div>
            </div>
            <br>
            <div class="row">
                <p><b>Enter your details:</b></p>
              <div class="col">
                <input type="text" class="form-control" placeholder="Contact No" name="Contact No">
              </div>
              <div class="col">
                <input type="text" class="form-control" placeholder="City" name="City">
              </div>
            </div>
            <br>
            <form action="Sign_up" method="post">
                <div class="mb-3 mt-3">
                  <label for="email" class="form-label"><b>Email:</b></label>
                  <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required >
                </div>
                <div class="mb-3">
                  <label for="pwd" class="form-label"><b>Password:</b></label>
                  <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required >
                </div>
                <br>
                <button type="submit" class="btn btn-info">Create Account </button>
              </form>
          </form>
           <center><p>Already a user, Login <a href="LoginCRUD.jsp">here</a></p></center>
    </div>
</body>
</html>