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
<title>Admin Tickets</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1562065540-efa93744ed71?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
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
    String adminEmail = (String) session.getAttribute("admin");
	String req_id = (String) request.getParameter("reqid");
    if (adminEmail == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Manisha@2285");

        String sql = "SELECT * FROM tickets ORDER BY Status = 'Pending' DESC, Requested_at DESC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
    
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
          </div>
        </div>
      </nav>
      <br>
    <div class="title">
        <center><h1 class="display-1 mx-auto d-block">Ticketing Requests</h1></center>
    </div>
	<div class="container mt-5">
        <h2>All Ticket Requests</h2>
        <table class="table table-hover">
            <thead class="table-primary">
                <tr>
                    <th>Req.ID</th>
                    <th>Name</th>
                    <th>Seat</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Reason</th>
                    <th>Requested at</th>
                    <th>Status</th>
                    <th>Action</th>
                    <th>More</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("id") %></td>
                    <td><%= rs.getString("Name") %></td>
                    <td><%= rs.getString("Seat_no") %></td>
                    <td><%= rs.getString("Email_id") %></td>
                    <td><%= rs.getString("Type") %></td>
                    <td><%= rs.getString("Reason") %></td>
                    <td><%= rs.getString("Requested_at") %></td>
                    <td><%= rs.getString("Status") %></td>
                    <td>
                        <% if ("Pending".equals(rs.getString("Status"))) { %>
                        <form action="TicketsAdmin" method="post">
                            <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                            <button type="submit" name="action" value="approve" class="btn btn-success">Approve</button>
                            <button type="submit" name="action" value="reject" class="btn btn-danger">Reject</button>
                        </form>
                        <% } else { %>
                        	<span class="text-muted"><strong><%= rs.getString("status2")%></strong></span>
                        <% } %>
                    </td>
                    <td>
    					<!-- Check if status2 is Completed -->
    					<% if ("Completed".equals(rs.getString("status2"))) { %>
        					<!-- Show Chatroom button only if status2 is Completed -->
        					<a href="ChatRoom.jsp?reqid=<%= rs.getString("id") %>" target="_blank" class="btn btn-info">Chatroom</a>
    					<% } else if ("In process".equals(rs.getString("status2"))) { %>
        					<!-- Show Mark as Completed button if status2 is In process -->
        					<form action="TicketsAdmin" method="post" style="display:inline;">
            					<input type="hidden" name="id" value="<%= rs.getString("id") %>">
            					<button type="submit" name="action" value="complete" class="btn btn-warning">Mark as Completed</button>
        					</form>
    					<% } else { %>
        					<!-- If neither In process nor Completed, show appropriate message or do nothing -->
        					<span class="text-muted">No actions available</span>
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
    		catch (Exception e) {
            	e.printStackTrace();
        }
    %>
</body>
</html>