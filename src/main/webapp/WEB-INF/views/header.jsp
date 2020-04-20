<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Books</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/home">Home<span class="sr-only">(current)</span></a>
      </li>
      <sec:authorize access="!isAuthenticated()">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/login">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/user/register">Register</a>
      </li>
      </sec:authorize>
      
      <sec:authorize access="isAuthenticated() and hasAuthority('admin')">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/book/add">Add</a>
      </li>      
      </sec:authorize>
      
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/book/display">Book Display</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/aboutus">About Us</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/contactus">Contact Us</a>
      </li>
      
      <sec:authorize access="isAuthenticated()">
      <li class="nav-item">
       <a class="nav-link" href="${pageContext.request.contextPath}/user/profile">Profile</a>
      </li>
      <li class="nav-item">
       <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
      </li>      
      </sec:authorize>
    </ul>
    
      <a href="${pageContext.request.contextPath}/book/hightolow" class="btn btn-primary text-white">High to Low</a>
      <a href="${pageContext.request.contextPath}/book/lowtohigh" class="btn btn-primary text-white">Low to High</a>
    
    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/book/search" method="post" >
      <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

</body>
</html>