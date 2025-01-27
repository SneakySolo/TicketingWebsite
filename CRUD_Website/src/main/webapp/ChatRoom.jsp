<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Chat Room</title>
<style>
    .chat-container {
        width: 100%;
        max-width: 800px;
        margin: auto;
    }
    .chat-box {
        max-height: 500px;
        overflow-y: auto;
        border: 1px solid #ddd;
        padding: 10px;
        margin-bottom: 20px;
        background-color: #f9f9f9;
    }
    .message {
        padding: 10px;
        border-radius: 20px;
        display: inline-block;
        max-width: 70%;
        margin-bottom: 10px;
    }
    .admin-message {
        background-color: #f1f1f1;
        color: black;
        text-align: left;
    }
    .user-message {
        background-color: #007bff;
        color: white;
        text-align: right;
    }
    .message-row {
        margin-bottom: 10px;
    }
    .message-time {
        font-size: 0.8em;
        color: #999;
        display: block;
        margin-top: 5px;
    }
</style>
</head>
<body>
    <%
        String email = (String) session.getAttribute("email");
        String id = (String) request.getParameter("reqid");
        String admin_id = "alfred@gmail.com"; // Admin's email
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "Manisha@2285");
            String sql = "SELECT * FROM Chat WHERE Req_id = ? ORDER BY Time ASC";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();
    %>
    <!-- Navigation bar -->
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
    <div>
        <center><h1 class="display-1 mx-auto d-block">Welcome to the Chat Room</h1></center>
    </div>
    <br>
    
    <div class="chat-container">
        <div class="chat-box">
            <%
                while (rs != null && rs.next()) {
                    String senderEmail = rs.getString("Name");
                    String message = rs.getString("Message");
                    String time = rs.getString("Time");
                    
                    // If admin is sending the message, display on left; user message on right
                    if (admin_id.equals(senderEmail)) {
            %>
            <!-- Admin's message on the left -->
            <div class="row message-row">
                <div class="col-6">
                    <div class="message admin-message">
                        <%= message %>
                        <span class="message-time"><%= time %></span>
                    </div>
                </div>
                <div class="col-6"></div>
            </div>
            <%
                    } else {
            %>
            <!-- User's message on the right -->
            <div class="row message-row">
                <div class="col-6"></div>
                <div class="col-6 text-end">
                    <div class="message user-message">
                        <%= message %>
                        <span class="message-time"><%= time %></span>
                    </div>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
        <div class="mt-3">
            <form action="MyChatRoom" method="post">
                <input type="hidden" name="reqid" value="<%= id %>">
                <textarea name="message" rows="4" cols="50" class="form-control" required></textarea><br>
                <input type="submit" value="Send" class="btn btn-primary">
            </form>
        </div>
    </div>

    <%
        } catch(Exception e) {
            e.printStackTrace();
        }
    %>
</body>
</html>
