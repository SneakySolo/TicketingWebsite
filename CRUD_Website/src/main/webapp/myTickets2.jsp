<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.ServletException"%>
<%@ page import="jakarta.servlet.annotation.WebServlet"%>
<%@ page import="jakarta.servlet.http.HttpServlet"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="jakarta.servlet.http.HttpServletResponse"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>My Tickets</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1557128928-66e3009291b5?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.container {
		background-color: white;
		padding: 25px 25px 25px 25px;
		border-radius: 25px;
	}
	.title {
		color: white;
	}
	.text {
	margin-left: 90px;
	
	}
</style>
</head>
<body>
	 <%
        String email = (String) session.getAttribute("email");
		int i=0;
		
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Manisha@2285");
            String sql = "SELECT * FROM tickets WHERE Email_id = ? ORDER BY Requested_at DESC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p>No tickets submitted yet.</p>");
            } else {
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
        <center><h1 class="display-1 mx-auto d-block">Ticket Status</h1></center>
    </div>
    <br>
    <div class="text">
    	<h2>Below are your ticketing requests</h2>
  		<p>The requirements will be fulfilled once approved :</p>
    </div>
    <div class="container">            
  <table class="table table-hover">
    <thead class="table table-primary">
      <tr>
        <th>Si.No</th>
        <th>Req.ID</th>
        <th>Name</th>
        <th>Seat</th>
        <th>Type</th>
        <th>Requirements</th>
        <th>Requested at</th>
        <th>Status</th>
        <th>Action</th>
        <th>More</th>
      </tr>
    </thead>
    <tbody>
    	<%
             while (rs.next()) {
            	 ++i;
        %>
      <tr>
        <td><%= i %></td>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("Name") %></td>
        <td><%= rs.getString("Seat_no") %></td>
        <td><%= rs.getString("Type") %></td>
        <td><%= rs.getString("Reason") %></td>
        <td><%= rs.getString("Requested_at") %></td>
        <td><%= rs.getString("Status") %></td>
        <td>
        	<% if ("Pending".equals(rs.getString("Status"))) { %>
        		<form action="DeleteTicket" method="post">
        		<input type="hidden" name="id" value="<%= rs.getInt("id") %>"></input>
        		<button type="submit" name="action" value="delete" class="btn btn-danger">DELETE</button>
        		</form>
        	<% } else { %>
        		<span class="text-muted"><strong><%= rs.getString("status2")%></strong></span>
            <% } %>
        </td>
        <td>
        	<% if ("Completed".equals(rs.getString("status2"))) { %>
        	<form action="CloseTicket" method="post">
        	<input type="hidden" name="id" value="<%= rs.getInt("id") %>"></input>
        	<button type="submit" name="action" value="Closed" class="btn btn-secondary">Mark as Closed</button>
        	</form>
        	<form action="ChatRoom.jsp" target="blank" method="post">
        	<input type="hidden" name="reqid" value="<%= rs.getInt("id") %>"></input>
        	<button type="submit" name="action" value="Chatroom" class="btn btn-info">Chatroom</button>
        	</form>
        	<% } %>
        </td>
      </tr>
      <%
            }
      %>
    </tbody>
  </table>
</div>
	<%
        }
        } 
        	catch (Exception e) 
        	{
            	e.printStackTrace();
        	}
    %>
</body>
</html>