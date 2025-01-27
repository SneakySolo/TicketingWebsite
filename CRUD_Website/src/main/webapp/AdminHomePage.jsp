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
<title>Admin Home Page</title>
<style>
	.first {
		background-image : url("https://assets2.cbsnewsstatic.com/hub/i/2022/05/06/7fa9a971-6984-4b29-ad0b-ff27ac16efc9/gettyimages-1369567869.jpg?v=d2d77bee90bcafa285fd6d60bd8b3612");
		background-repeat : no-repeat;
		background-size : cover;
		height : 500px;
    	padding-top: 75px;
	}
	.first1 {
		padding: 25px 25px 25px 25px;
		margin: 0px 40px 10px 800px;
		color: white;
		background-color: BLACK;
	}
	.container {
		border-radius: 30px;  
		margin-top: -50px; 
    	background-color: #fff;        
    	padding: 20px;                
    	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}
</style>
</head>
<body>
	<%
    String adminEmail = (String) session.getAttribute("admin");
	String filter = request.getParameter("filter");
    String that_email = request.getParameter("here");
	
    if (adminEmail == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Manisha@2285");

        String sql = "SELECT * FROM tickets";
        if ("In process".equals(filter)) {
            sql += " WHERE status2 = 'In process'";
        } else if ("Pending".equals(filter)) {
            sql += " WHERE Status = 'Pending'";
        } else if ("Completed".equals(filter)) {
            sql += " WHERE status2 = 'Completed'";
        } else if ("Closed".equals(filter)) {
            sql += " WHERE status2 = 'Closed'";
        }
        
        if (that_email != null && ! that_email.trim().isEmpty()) {
        	sql += " WHERE Email_id LIKE ?";
        }
        
        sql += " ORDER BY Requested_at DESC";  
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        if (that_email != null && ! that_email.trim().isEmpty()) {
        	stmt.setString(1, that_email +"%");
        }
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
                <a class="nav-link" href="AdminHomePage.jsp">Home</a>
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

	<div class="first">
		<div class="first1">
			<h1>Welcome to the IT Ticketing Admin Portal</h1>
			<p>As an administrator, you have the authority to review, accept, or reject incoming tickets. Take control of the ticketing system and ensure your team operates smoothly and effectively.</p>
		</div>
	</div>

	<div class="container">
    <div class="container1">
        <h2>All Ticket Requests:</h2>
        
        <!-- Filter form -->
        <form method="get">
            <div class="mb-3">
                <label for="filter" class="form-label">Filter Tickets by Status:</label>
                <select name="filter" id="filter" class="form-select" onchange="this.form.submit()">
                    <option value="None">None</option>
                    <option value="Pending">Pending</option>
                    <option value="In process">In process</option>
                    <option value="Completed">Completed</option>
                    <option value="Closed">Closed</option>
                </select>
            </div>
            <div class="mb-3">
            	<label for="here" class="form-label">Filter Tickets by Email:</label> <br>
            	<input type="text" name ="here" placeholder="Enter email"> &nbsp;
            	<button type="submit" class="btn btn-primary">Go</button>
            </div>
        </form>
		
		<%
           if (!rs.isBeforeFirst()) {
         %> 
        <center>Empty, just like your brain</center>
        <% } else { %>
		
        <table class="table table-borderless">
            <thead class="table-border">
                <tr>
                    <th>Req.ID</th>
                    <th>Name</th>
                    <th>Seat</th>
                    <th>Email</th>
                    <th>Type</th>
                    <th>Reason</th>
                    <th>Date & Time</th>
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
                    <td style="
    					display: inline-block;
    					padding: 5px 15px;
    					margin-top: 10px;
    					border-radius: 50px;
    					font-weight: bold;
    					color: <% 
        					String type = rs.getString("Type");
        					if(type.equals("Hardware")) { %>#9623fa;<%  
        					} else if(type.equals("Software")) { %>#16f6fa;<%  
        					} else if(type.equals("Stationary")) { %>#86fc26;<% 
        					} else if(type.equals("Others")) { %>#f7a707;<% 
        					} %>;
    					background-color: <% 
        					if(type.equals("Hardware")) { %>#be7afa;<%  
        					} else if(type.equals("Software")) { %>#bbfbfc;<% 
        					} else if(type.equals("Stationary")) { %>#d5f7ba;<%
        					} else if(type.equals("Others")) { %>#f5f29f;<%  
        					} %>"><%= rs.getString("Type") %>
        			</td>
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
                        <!-- Chatroom and other actions -->
                        <%
                            if ("Completed".equals(rs.getString("status2"))) {
                        %>
                        <a href="ChatRoom.jsp?reqid=<%= rs.getString("id") %>" target="_blank" class="btn btn-info">Chatroom</a>
                        <%
                            } else if ("In process".equals(rs.getString("status2"))) {
                        %>
                        <form action="TicketsAdmin" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                            <button type="submit" name="action" value="complete" class="btn btn-warning">Mark as Completed</button>
                        </form>
                        <%
                            } else {
                        %>
                        <span class="text-muted">No actions available</span>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <%
                    	}
        			}
                %>
            </tbody>
        </table>
    </div>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
