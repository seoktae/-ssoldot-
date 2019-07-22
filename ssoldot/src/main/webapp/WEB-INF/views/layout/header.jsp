<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<head>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css"
	rel="stylesheet">
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

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<div class="navbar-brand" href="#">
			<img
				src="${pageContext.request.contextPath}/resources/vendor/bootstrap/images/mainimg.png" />
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item">
				
				<s:authorize ifNotGranted="ROLE_USER">
				<a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a>
	       		</s:authorize>
	       		
				<s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
    	     	<s:authentication property="name" var="loginUser"/>
    	     	<a class="nav-link" href="${pageContext.request.contextPath}/logout">로그아웃</a>
        		</s:authorize>
        		</li>
        		
				<li class="nav-item">
				
				<s:authorize ifNotGranted="ROLE_USER">
				<a class="nav-link" href="${pageContext.request.contextPath}/member/join">회원가입</a>
				</s:authorize>
				
				<s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
    	     	<s:authentication property="name" var="loginUser"/>
    	     	<a class="nav-link" href="${pageContext.request.contextPath}/member/mypage/info">마이 페이지</a>
        		</s:authorize>
				
				</li>
				
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/listAll">게시판</a></li>
			</ul>
		</div>
	</div>
	</nav>
	
	<header class="empty my-4">
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item carousel-item-next carousel-item-left">

			</div>
	</header>
	