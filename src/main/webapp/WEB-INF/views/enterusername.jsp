<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.margin
{
 margin:0 auto;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
   <form action='<sp:url value="/user/forgot"></sp:url>' class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" method="post">
    <div class="form-group">
    <label>Enter Username</label>
    <input type="text" name="username" class="form-control" placeholder="Enter Username">
    </div>
    <div class="form-group">
      <input type="submit" class="btn btn-primary btn-block" value="Submit">
      <input type="submit" class="btn btn-danger btn-block" value="Reset">
    </div>
   </form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>