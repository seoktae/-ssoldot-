<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Heroic Features - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap2.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/heroic-features.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/operate.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="{ % block extrastyle % }{ % endblock % }">
</head>

<style>
.carousel-inner img {
	width: 100%;
	height: auto;
	min-width: 1180px;
	margin: 0 auto;
}
</style>

<body>

	<!-- Navigation -->
	<jsp:include page="layout/header.jsp" />

	<!-- Page Content -->
	<jsp:include page = "layout/container.jsp"/>
	

	<!-- paging -->
	<jsp:include page="layout/paging.jsp" />

	<!-- Footer -->
	<jsp:include page="layout/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
