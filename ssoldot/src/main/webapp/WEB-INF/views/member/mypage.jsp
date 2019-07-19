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

  <title>마이 페이지</title>
  
  <!-- member CSS  -->
  <link href="${pageContext.request.contextPath}/resources/member/mypage.css" rel="stylesheet">
  


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
			<!-- mypage_tab  -->
			<div id="cMain" class="">
				<div id="mFeature">
					<div class="aside_profile">
						<h3 class="screen_out">프로필</h3>
						<div class="wrap_thumb">
							<a href="${pageContext.request.contextPath}/member/mypage" >
							<img src="${pageContext.request.contextPath}/resources/member/profile_pic/${vo.st_picname}" width="100" height="100" class="thumb_img" alt="">
							</a>
						</div>
						<div class="wrap_cont">
							<a><br></a>
							<strong class="tit_profile">${vo.member_id}</strong>
							<span class="txt_ellip">${vo.nickname}</span>
						</div>
					</div>
					
					<jsp:include page="layout/mypage_tab.jsp" />
					</div>
				<div id="mArticle">
					<div class="inner_article">
						<h2 id="kakaoBody" class="screen_out">계정관리 본문</h2>
						<div class="member_basic">
							<h3 class="tit_cont">기본 정보</h3>
							<form class="wrap_set" action="${pageContext.request.contextPath}/member/mypage" method="post">
								<fieldset class="fld_image">
									<legend class="screen_out">프로필 이미지 설정</legend>
									<div class="wrap_thumb photo_profile">
										<img
											src="${pageContext.request.contextPath}/resources/member/profile_pic/${vo.st_picname}"
											class="thumb_img" width="180" height="180" alt=""><label
											class="lab_btn lab_photo"><span class="ico_member">블로그
												이미지 찾아보기</span><input type="file" accept="image/*" class="btn_g"></label>
									</div>
								</fieldset>
								<fieldset class="fld_name">
									<legend class="screen_out">닉네임 설정</legend>
									<label class="lab_tf"><strong class="tit_set">닉네임</strong><input
										type="text" class="tf_member" name="nickname" value="${vo.nickname}"></label>
									<p class="txt_required"></p>
								</fieldset>
								
								<fieldset>
									<legend class="screen_out">저장 버튼</legend>
									<!-- <button type="submit" class="btn_save btn_off" disabled="">변경사항
										저장</button> -->
									<input type="submit" value="변경사항 저장" class="btn_save btn_off">
								</fieldset>
							</form>
							
						</div>
					</div>
				</div>
			</div>
			</div>
  <!-- Footer -->
  <jsp:include page="../layout/footer.jsp"/>
  
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>