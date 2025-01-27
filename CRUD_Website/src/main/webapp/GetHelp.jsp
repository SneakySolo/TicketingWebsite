<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.first {
		display: flex;
		gap: 0px;
	}
	.first-one {
		background-color: #4d64ff;
		width: 40%;
		color:white;
		padding: 60px 40px 50px 40px;
	}
	.first-two {
		margin: 0Px 20px 0px 90px;
	}
	.container {

		color: black;
		width: 600px;
		height: 450px;
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
                <a class="nav-link" href="Contact_us_CRUD.jsp">Contact us</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="myTickets.jsp">MyTickets</a>
              </li>
           </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="text" placeholder="Search">
              <button class="btn btn-primary" type="button">Submit</button>&nbsp;&nbsp;
            </form>
          </div>
        </div>
      </nav>
	<div class="first">
		<div class="first-one">
			<h1 class="display-1">We'd love to hear from you</h1>
			<br> 
			<p><big>You may also try our contact page to reach us out</big></p>
		</div>
		<div class="first-two">
		<br>
			<h1 class="display-4">Please fill this form-</h1>
			<br>
			<div class="container">
            <div class="row">
                <p>Enter your name:</p>
              <div class="col">
                <input type="text" class="form-control" placeholder="First Name" name="First Name">
              </div>
              <div class="col">
                <input type="text" class="form-control" placeholder="Last Name" name="Last Name">
              </div>
            </div>
            <br>
            <div class="row">
                <p>Enter your details:</p>
              <div class="col">
                <input type="text" class="form-control" placeholder="Email Id" name="Contact No">
              </div>
              <div class="col">
                <input type="text" class="form-control" placeholder="Contact No" name="City">
              </div>
            </div>
            <br>
            	<div class="mb-3 mt-3">
      				<label for="comment">Your queries here:</label>
      				<textarea class="form-control" rows="4" id="comment" name="text"></textarea>
    			</div>
    			<form action="homePage.jsp">
                <button type="submit" class="btn btn-info">Submit</button>
                </form>
    		</div>
		</div>
	</div>
</body>
</html>