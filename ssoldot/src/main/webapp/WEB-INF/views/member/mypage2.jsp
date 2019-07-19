<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Heroic Features - Start Bootstrap Template</title>
  
  <!-- member CSS  -->
  <link href="${pageContext.request.contextPath}/resources/member/member.css" rel="stylesheet">
  


  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap2.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/heroic-features.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/operate.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="{ % block extrastyle % }{ % endblock % }">
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
  <jsp:include page="../layout/header.jsp" />

  <!-- Page Content -->
  <div class="container">
  	<section class="xm">
	<!-- mypage_tab  -->
	<jsp:include page="layout/mypage_tab.jsp" />
	
	<h1>회원 정보</h1>
		<dl class="dl-horizontal">
		<dt><em>*</em> 이메일 주소</dt>
		<dd>bent22@naver.com</dd>
		<dt><em>*</em> 닉네임</dt>
		<dd>도라에몽정</dd>					
		<dt> 프로필 사진</dt>
		<dd><img src="https://eomisae.co.kr/files/member_extra_info/profile_image/745/999/017/17999745.png?20190708141721"></dd>
		<dt>가입일</dt>
		<dd>2019-07-08</dd>
		<dt>최근 로그인</dt>
		<dd>2019-07-09</dd>
	</dl>
<div class="btnArea btn-group">
	<a href="https://eomisae.co.kr/index.php?act=dispMemberModifyInfo&amp;mid=HO" class="btn">회원정보 변경</a>
	
	<a href="https://eomisae.co.kr/index.php?act=dispMemberLeave&amp;mid=HO" class="btn">회원정보 삭제</a>
</div></section>
  </div>
  <!-- Footer -->
  <jsp:include page="../layout/footer.jsp"/>
  
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>