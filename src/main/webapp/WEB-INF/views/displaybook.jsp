<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
<link rel="stylesheet" href='<sp:url value="/css/book.css"></sp:url>'>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img style="height:400px"   src='<sp:url value="/images/${book.bookname}/${book.bookimage}"></sp:url>' /></div>
						</div>
						   
					</div>
					<div class="details col-md-6">
						<h3 class="product-title">${book.bookname}</h3>
				        <p class="product-description">${book.description}</p>
				        <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h4 class="price">current price: <span>Rs. ${book.price}</span></h4>
						<div class="action">
							<a class="add-to-cart btn btn-primary" href="${pageContext.request.contextPath}/cart/add/${book.bookid}">Add to cart</a>
							<c:if test="${book.price>0}">
							<a class="btn btn-warning" href="${pageContext.request.contextPath}/order/${book.bookid}">Buy</a>
							</c:if>
							<sec:authorize access="isAuthenticated() and hasAuthority('admin')">
							<a class="btn btn-danger" href="${pageContext.request.contextPath}/book/delete/${book.bookid}">Delete</a>
							<a class="btn btn-secondary" href="${pageContext.request.contextPath}/book/edit/${book.bookid}">Edit</a>
							</sec:authorize>
							<c:if test="${book.price<=0}">
							<a class="btn btn-info" href="${book.booklink}" target="_blank">Read</a>
							</c:if>						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
