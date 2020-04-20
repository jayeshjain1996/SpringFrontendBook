<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags" %>
<%@page isELIgnored="false" %>
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
  <form action='<sp:url value="/user/conformotp"></sp:url>' method="post" class="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin">
    <div class="form-group">
     <label>Enter OTP</label>
     <input type="number" name="userotp" class="form-control" placeholder="Enter OTP">
    </div>
    <div class="form-group">
     <input type="hidden" value="${otp}" name="otp" class="form-control">
    </div>
    <div class="form-group">
     <input type="submit" value="Submit" class="btn btn-primary btn-block">
     <input type="reset" value="Reset" class="btn btn-danger btn-block">
    </div>
  </form>
 </div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>