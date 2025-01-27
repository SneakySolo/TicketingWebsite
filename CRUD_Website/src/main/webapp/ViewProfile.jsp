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
<title>View Profile</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1493476366410-a5a15abfa1e8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.container {
		background-color: white;
		color: white;
		padding: 10px 20px 10px 20px;
		border-radius: 25px;
		margin-top: 15px;
		margin-bottom: 20px;
	}
	.title {
		color: white;
		font-style: italic;
	}
</style>
</head>
<body>
	<% 
	if(session.getAttribute("usn") == null || session == null){
        response.sendRedirect("LoginCRUD.jsp");
        return;
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
      	<center><h1 class="display-1">Displaying user info for <%=First_Name %></h1></center>
      </div>
	<div class="container">
	<br>
  <table class="table table-hover">
    <thead class="table-dark text-light">
    	<th>SI.NO</th>
    	<th>Parameter</th>
    	<th>Info</th>
    </thead>
    <tbody>
      <tr>
        <td>1.</td>
		<td>First Name</td>
        <td><%=First_Name %></td>
      </tr>
      <tr>
        <td>2.</td>
		<td>Last Name</td>
        <td><%=Last_Name %></td>
      </tr>
      <tr>
        <td>3.</td>
		<td>City</td>
        <td><%=City %></td>
      </tr>
      <tr>
        <td>4.</td>
		<td>Contact No</td>
        <td><%=phone %></td>
      </tr>
      <tr>
        <td>5.</td>
		<td>Email</td>
        <td><%=email %></td>
      </tr>
    </tbody>
  </table>
</div>
	<center>
	<a class="btn btn-primary" href="UpdateProfile.jsp">Update details</a>
	<a class="btn btn-warning" href="homePage.jsp">Back to Home</a>
	</center>
<br><br>
</body>
</html>