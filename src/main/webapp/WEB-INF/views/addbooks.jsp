<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <c:if test="${b==null}">
  <h1 style="text-align: center;color: red;">Add Book</h1>
  <sp:form cssClass="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" modelAttribute="book" action="${pageContext.request.contextPath}/book/add" method="post" enctype="multipart/form-data">
  <div class="form-group">
  <label>Enter Bookname</label>
  <sp:input path="bookname" cssClass="form-control" placeholder="Enter Bookname"/>
  </div>
  <div class="form-group">
  <label>Enter Description</label>
  <sp:textarea path="description" cssClass="form-control" placeholder="Enter Description"/>
  </div>
  <div class="form-group">
  <label>Select Images</label>
  <input type="file" accept="image/*" name="image" >
  </div>
  <div class="form-group">
  <label>Enter Booklink</label>
  <sp:input path="booklink" cssClass="form-control" placeholder="Enter Booklink"/>
  </div>
  <div class="form-group">
  <label>Enter Price</label>
  <sp:input path="price" cssClass="form-control" placeholder="Enter Price"/>
  </div>
  <div class="form-group">
  <input type="submit" value="Add" class="btn btn-primary btn-block">
  <input type="reset" value="Reset" class="btn btn-secondary btn-block">
  </div>
  </sp:form>
  </c:if>
  <c:if test="${b!=null}">
  <sp:form cssClass="col-lg-6 col-md-6 col-sm-12 col-xm-12 margin" modelAttribute="b" action="${pageContext.request.contextPath}/book/update" method="post">
  <h1 style="text-align: center;color: red;">Add Book</h1>
  <div class="form-group">
  <label>Enter Bookid</label>
  <sp:input path="bookid" cssClass="form-control" placeholder="Enter Bookid"/>
  </div>
  <div class="form-group">
  <label>Enter Bookname</label>
  <sp:input path="bookname" cssClass="form-control" placeholder="Enter Bookname"/>
  </div>
  <div class="form-group">
  <label>Enter Description</label>
  <sp:textarea path="description" cssClass="form-control" placeholder="Enter Description"/>
  </div>
  <div class="form-group">
  <label>Select Images</label>
  <input type="file" name="image" accept="image/*" multiple="multiple" height="250">
  </div>
  <div class="form-group">
  <label>Enter Booklink</label>
  <sp:input path="booklink" cssClass="form-control" placeholder="Enter Booklink"/>
  </div>
  <div class="form-group">
  <label>Enter Price</label>
  <sp:input path="price" cssClass="form-control" placeholder="Enter Price"/>
  </div>
  <div class="form-group">
  <input type="submit" value="Update Book" class="btn btn-danger btn-block">
  <input type="reset" value="Reset" class="btn btn-secondary btn-block">
  </div>
  </sp:form>
  </c:if>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>