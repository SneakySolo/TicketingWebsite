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
<title>Contact Us</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1496147195884-6ab7f7c0a027?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.container {
		background-color: white;
		color: white;
		padding: 10px 20px 10px 20px;
		border-radius: 25px;
		margin-top: 25px;
	}
	.title {
		color: white;
		font-style: italic;
	}
</style>
</head>
<body>
	<% if(session.getAttribute("usn") == null || session == null){
        response.sendRedirect("LoginCRUD.jsp");
    } %>
	 <% String e = (String) session.getAttribute("usn");  %>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
         <% if (session == null || session.getAttribute("admin") == null) { %>
         <div class="dropdown">
  			<button type="button" class="btn btn-outline-warning dropdown-toggle" data-bs-toggle="dropdown">
   				 Welcome <%=e %>
  			</button>
  			<ul class="dropdown-menu">
   				<form action="profileView" method="post">
   				<button class="dropdown-item" href="ViewProfile.jsp">User Settings</button>
   				</form>   			
  			</ul>
		</div>
		<% } else { %>
			<div class="text-warning text-center"><strong>Welcome <br> Admin</strong></div>&nbsp;
			<% } %>
          <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
              <li class="nav-item">
                <a class="nav-link" href="homePage.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Contact_us_CRUD.jsp">Contact us</a>
              </li>
              <%
              		if (session == null || session.getAttribute("admin") == null) {
              %>
              <li class="nav-item">
                <a class="nav-link" href="myTickets.jsp">MyTickets</a>
              </li>
              <% } else { %>
              <li class="nav-item">
                <a class="nav-link" href="AdminTickets.jsp">MyTickets(admin)</a>
              </li>
              <% } %>
           </ul>
          </div>
        </div>
      </nav>
      <br>
      <div class="title">
        <center><h1 class="display-1 mx-auto d-block">Contact Page</h1></center>
    </div>
    <br>
	<div class="container mt-3">
  <table class="table table-hover">
    <thead class="table-primary">
      <tr>
      	<th>Si.no</th>
        <th>Name</th>
        <th>Contact</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>Technical Support Hotline</td>
        <td>+91 1800 123 8324</td>
      </tr>
      <tr>
        <td>2</td>
        <td>Customer Service Hotline</td>
        <td>+91 1800 555 7378</td>
      </tr>
      <tr>
        <td>3</td>
        <td>Emergency IT Assistance</td>
        <td>+91 1800 911 4357</td>
      </tr>
      <tr>
        <td>4</td>
        <td>Ticketing Error</td>
        <td>+91 1800 555 7253</td>
      </tr>
      <tr>
        <td>5</td>
        <td>Password Reset and Security Help</td>
        <td>+91 1800 555 5625</td>
      </tr>
      <tr>
        <td>6</td>
        <td>Network Downtime Hotline</td>
        <td>+91 1800 123 0638</td>
      </tr>
    </tbody>
  </table>
</div>
<br><br>
</body>
</html>