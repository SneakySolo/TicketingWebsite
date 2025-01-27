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
<title>Update Profile</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1491895200222-0fc4a4c35e18?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	table {
		background-color: black;
		color: white;
		padding: 10px 10px 10px 20px;
		border-radius: 25px;
		margin-top: 15px;
		margin-bottom: 20px;
		
		width: 400px;
	}
	.title {
		color: black;
		font-style: italic;
	}
</style>
</head>
<body>
	<% 
	if(session.getAttribute("usn") == null || session == null){
        response.sendRedirect("LoginCRUD.jsp");
        
    }
	String First_Name = (String) session.getAttribute("firstname");
    String Last_Name = (String) session.getAttribute("lastname");
    String City = (String) session.getAttribute("city");
    String phone = (String) session.getAttribute("phone");
    String email = (String) session.getAttribute("email");
    %>
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
      <br>
      <div class="title">
		<center><h1 class="display-1">Rewrite the parameters to update </h1></center>
	  </div>
	<br>
	
	<div class="container">
        <form action="profileUpdate" method="post">
            <center>
            <table cellpadding="10" cellspacing="0" >
            <tr>
                <td>First Name:</td>
                <td><input type="text" name="firstName" value="<%= First_Name %>"></td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastname" value="<%= Last_Name %>"></td>
            </tr>
            <tr>
                <td>City:</td>
                <td><input type="text" name="city" value="<%= City %>"></td>
            </tr>
            <tr>
                <td>Contact Number:</td>
                <td><input type="text" name="contactNumber" value="<%= phone %>"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" value="<%= email %>"></td>
            </tr>
        </table>
        		<br>
                <button type="submit" class="btn btn-info">Update Details </button> 
        </center>   
        </form>
	</div>
</body>
</html>