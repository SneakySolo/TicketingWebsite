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
<title>Admin Login</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1481414981591-5732874c7193?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
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
        <center><h1 class="display-1 mx-auto d-block">Admin Login</h1></center>
    </div>
<br>
	<!-- Login box -->
   <div class="container">
        <h1>Enter your Admin Credentials :</h1>
        <form action="Adminlog_in" method="post">
            <div class="mb-3 mt-3">
              <label for="email" class="form-label">Email:</label>
              <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
            </div>
            <div class="mb-3">
              <label for="pwd" class="form-label">Password:</label>
              <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
            </div>
            <button type="submit" class="btn btn-warning">Submit</button>
          </form> 
          <br>
          <a href="LoginCRUD.jsp">Login as user</a> 
    </div>    
	<br>
	<br>
	<br>
</body>
</html>