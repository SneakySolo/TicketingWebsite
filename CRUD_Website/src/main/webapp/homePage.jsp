<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"><!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<title>Welcome Page</title>
<style>
	.first {
		background-image : url("https://media.graphassets.com/s4mdOiJSSpm60Kd29Kwc");
		background-repeat : no-repeat;
		background-size : cover;
		height : 500px;
    	padding-top: 75px;
	}
	.first1 {
		padding: 25px 25px 25px 25px;
		margin: 0px 800px 10px 40px;
		color: white;
		BACKGROUND-COLOR: BLACK;
	}
	.second {
		 display: flex;
		 justify-content: space-around;
		 padding: 25px 70px 25px 70px;
		 border-radius: 45px;
		 background-color: white;
		 margin-top: -50px;
	}
	.second1 {
		background-color: white;
  		border-radius: 25px;
		padding: 15px 30px 15px 30px;
		height: 450px;
		width: 450px;
		margin: 10px 10px 10px 30px;
	}
	.second2 {
		background-color: #e4e3e6;
		border-radius: 25px;
		padding: 15px 30px 15px 30px;
		height: 450px;
		width: 450px;
		margin: 10px 30px 10px 10px;
	}
	.card-container {
    	display: flex;
    	flex-wrap: wrap;
    	justify-content: space-between;
    	gap: 20px;
    	width: 50%;
    	max-width: 1200px;
    	margin-left: 320px;
    	margin-top: 30px;
	}
	
	.card {
    	flex: 1 1 calc(50% - 20px); /* Take 50% width minus spacing */
    	background-color: white;
    	border-radius: 15px;
    	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    	padding: 20px;
    	display: flex;
    	justify-content: space-between;
    	height: 220px;
    	transition: transform 0.3s ease;
	}

	.dark-card {
    	background-color: #4d64ff;
    	color: white;
	}
	.dark-card a {
		background-color: #e4e3e6;
  		color: black;
  		padding: 10px 10px;
  		text-align: center;
  		display: inline-block;
	}
	.card-content h3 {
    	font-size: 20px;
    	margin: 0;
    	color: black;
    	margin-bottom: 10px;
	}

	.card-content p {
    	font-size: 14px;
    	color: #6f6f6f;
	}

	.dark-card .card-content p {
    	color: white;
	}
	.card:hover {
    	transform: translateY(-5px);
	}
	.fourth {
		background-image: url("https://cc-techgroup.com/wp-content/uploads/2023/01/server-room-temperature-monitoring.jpg");
		filter: grayscale(100%);
		border-radius: 25px;
		margin: 60px 40px 20px 40px;
		height: 270px;
	}
	.fourth1 {
		padding: 40px 800px 30px 30px;
		color: white;
	}
	.fourth1 h1 {
		font-size: 50px;
	}
	.fourth1 p {
		font-size: 30px;
	}
	.fourth a {
		background-color: #e4e3e6;
  		color: black;
  		padding: 15px 25px;
  		text-align: center;
		font-size: 15px;
		border-radius: 25px;
  		display: inline-block;
	}
	.last {
		background-color: black;
		height: 200px;
	}
	.last1 {
		font-size: 40px;
		color: white;
		padding-top: 25px;
		padding-left: 45px;
		padding-bottom: 30px;
	}
	.last2 {
		display: flex;
		gap: 40px;
		padding-left: 45px;
		color: white;
	}
	a {
  		background-color: black;
  		color: white;
  		padding: 10px 10px;
  		text-align: center;
  		text-decoration: none;
  		display: inline-block;
	}
</style>
</head>
<body>
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
	<div class="first">
		<div class="first1">
			<h1>Streamline Your IT Support Experience</h1>
			<p>Get the help you need, when you need it. Our intuitive platform ensures your IT concerns are addressed promptly, keeping your systems running smoothly</p>
		</div>
	</div>
	<div class="second">
		<div class="second1">
			<h2>Raise a Support Ticket</h2>
    		<p>Facing an issue or need assistance? Raise a support ticket by providing the details below. Our team will respond promptly to help resolve your concern.</p>
    		<p>
        		<strong>Steps to Submit a Ticket:</strong><br>
        		1. Enter your name, contact information, and a brief issue description.<br>
        		2. Provide any relevant details, including error messages or screenshots.<br>
        		3. Select the issue priority (Low, Medium, High) and department.
    		</p>
			<br>
			<a href="myTickets.jsp">Raise Tickets</a>
		</div>
		<div class="second2">
			<h2>View Ticket Status</h2>
    		<p>You can easily check the progress of your support ticket by entering your unique ticket number and the email address you used when submitting the request.</p>
    		<p>The ticket number was provided in the confirmation email you received after submitting your support request.</p>
    		<p>If there are any changes or updates, you’ll receive a notification by email. Feel free to reach out to our support team at any time.</p>
			<br>
			<a href="myTickets2.jsp">View Tickets</a>
		</div>
	</div>
	<section class="card-container">
        <!-- First Row -->
        <div class="card">
            <div class="card-content">
                <h3>Viewing Profile</h3>
                <p>Access your personal details and account settings. Stay informed about your latest updates.</p>
            	<br>
			<a href="ViewProfile.jsp">View Tickets</a>
            </div>
        </div>

        <div class="card dark-card">
            <div class="card-content">
                <h3>Updating Profile</h3>
                <p>Keep your information up to date. Easily change your account settings. You can change details anytime.</p>
            	<br>
			<a href="UpdateProfile.jsp">Update Tickets</a>
            </div>
        </div>

        <!-- Second Row -->
        <div class="card dark-card">
            <div class="card-content">
                <h3>Blog Page</h3>
                <p>Stay updated with the latest articles and insights. Read, comment, and engage with posts on our blog.</p>
            	<br>
			<a href="BlogPageCRUD.jsp">Blog Page</a>
            </div>
        </div>

        <div class="card">
            <div class="card-content">
                <h3>Contact Us</h3>
                <p>Have questions or need help? Reach out to our support team via phone, email, or through our contact form.</p>
            	<br>
			<a href="Contact_us_CRUD.jsp">Contact us</a>
            </div>
        </div>
    </section>
    <div class="fourth">
    	<div class="fourth1">
    		<h1>Facing issues ?</h1>
    		<p>Let us know</p>
    		<br>
			<a href="GetHelp.jsp">Get Help</a>
    	</div>
    </div>   
    <div class="last">
    	<div class="last1">
    		<h1>Ticketing Website Co</h1>
    	</div>
    	<div class="last2">
    		<a href="https://theuselessweb.com/" target="blank">Terms & Conditions</a>
    		<a href="https://theuselessweb.com/" target="blank">Privacy Policy</a>
    		<a href="https://theuselessweb.com/" target="blank">Discover more</a>
    	</div>
    </div>
</body>
</html>