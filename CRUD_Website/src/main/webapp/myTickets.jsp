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
<title>myTickets</title>
<style>
	body{
		background-image: url("https://cdn.prod.website-files.com/62879c5d83d830c65478cb8a/652804cd1c1e04e2376b7d10_64bf895f38f1f3db882bf494_10%20facts%20about%20data%20centers_1920x1080-p-1080.jpg");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.title {
		color: white;
		margin-bottom: 15px;
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
	<% if(session.getAttribute("usn") == null || session == null){
        response.sendRedirect("LoginCRUD.jsp");
    } 
    String em = (String) session.getAttribute("email");
    String usn = (String) session.getAttribute("usn");
    String usn2 = (String) session.getAttribute("usn2");
    %>
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
            <form class="d-flex">
              <input class="form-control me-2" type="text" placeholder="Search">
              <button class="btn btn-primary" type="button">Submit</button>&nbsp;&nbsp;
            </form>
             <% 
                if (session.getAttribute("usn") == null) { 
            %>
            <form action = "LoginCRUD.jsp">
       	    	 <button class="btn btn-outline-success" type="Submit">Log in</button>&nbsp;
          	</form>  
          	<% } else { %>
            <form action = "Logout" method = "Get">
       	    	 <button class="btn btn-outline-danger" type="Submit">Log out</button>
          	</form>
          	<% } %>
          </div>
        </div>
      </nav>
      <br>
      <div class="title">
        <center><h1 class="display-1 mx-auto d-block">Ticketing Page</h1></center>
    </div>
    <form action="Tickets" method="post">
    	<div class="container">
    		<label for="text" class="form-label">Name:</label>
    		<input type="text" class="form-control" id="Name" value="<%= usn + " " + usn2 %>" name="name" readonly>
    	<br>
    		<label for="text" class="form-label">Email:</label>
    		<input type="email" class="form-control" value="<%= em %>" readonly name="email">	
  		<br>
    		<label for="text" class="form-label">Seat no:</label>
    		<input type="number" class="form-control" id="Seat" placeholder="Enter your seat number" name="seat">
    	<br>
    		<label for="sel1" class="form-label">Select list:</label>
    		<select class="form-select" id="sel1" name="reqtype">
      			<option>Hardware</option>
      			<option>Software</option>
      			<option>Stationary</option>
      			<option>Others</option>
    		</select>
    	<br>
    		<label for="text" class="form-label">Requirements and reasons :</label>
			<textarea class="form-control" rows="5" id="comment" name="req_res"></textarea>
		<br>
			<button type="submit" class="btn btn-info">Submit request </button>&nbsp;
  			<a class="btn btn-warning btn-block" href="myTickets2.jsp">Check Ticket Status</a>		
  		</div>
    </form>
		<br> <br>
</body>
</html>