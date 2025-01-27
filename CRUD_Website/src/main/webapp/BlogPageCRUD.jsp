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
<title>Blog Page</title>
<style>
	body {
		background-image: url("https://images.unsplash.com/photo-1566393581747-acac1256d3c9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
		background-repeat: no-repeat;
		background-size: cover;
	}
	.text {
		color: white;
		font-style: italic;
	}
</style>
</head>
<body>
	<% if(session.getAttribute("usn") == null || session == null){
        response.sendRedirect("LoginCRUD.jsp");
    } %>
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
                <a class="nav-link" href="BlogPageCRUD.jsp">MyTickets</a>
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
	<div class="text">
        <center><h1 class="display-1 mx-auto d-block">Welcome to our Blog Page</h1></center>
    </div>
    <br>
    <div class="box">
    <div class="container p-5 bg-success text-light">
    <h1>Meaning of Lorem Ipsum</h1>
    <h3>Lorem ipsum was purposefully designed to have no meaning, but appear like real text, making it the perfect placeholder.</h3>
    </div>
    <div class="container p-3 bg-warning text-dark">
    <h5>Interpreting Nonsense</h5>
    <p>Don't bother typing “lorem ipsum” into Google translate. If you already tried, you may have gotten anything from "NATO" to "China", depending on how you capitalized the letters. The bizarre translation was fodder for conspiracy theories, but Google has since updated its “lorem ipsum” translation to, boringly enough, “lorem ipsum”.
	One brave soul did take a stab at translating the almost-not-quite-Latin. According to The Guardian, Jaspreet Singh Boparai undertook the challenge with the goal of making the text “precisely as incoherent in English as it is in Latin - and to make it incoherent in the same way”. As a result, “the Greek ‘eu’ in Latin became the French ‘bien’ [...] and the ‘-ing’ ending in ‘lorem ipsum’ seemed best rendered by an ‘-iendum’ in English.”
    </div>
    </div>
    <br>
</body>
</html>