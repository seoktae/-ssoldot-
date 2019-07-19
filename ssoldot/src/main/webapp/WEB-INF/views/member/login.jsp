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
		<section id="container" class="sub-container member">
			<article id="contents">
				<!-- login -->
				<input type="hidden" id="url" value="/">
				<div class="wrap-login-area">
					<h2 class="font-en">LOGIN</h2>

					<p class="desc">
						방문을 환영합니다. 
					</p>
					<c:if test="${ param.login_error != null }">
						<div style="color:red">
           				 아이디 또는 패스워드가  일치하지 않습니다. <br>
           				 Message : <c:out value="${  SPRING_SECURITY_LAST_EXCEPTION.message }"></c:out>
         				</div>
					</c:if>
					<div class="wrap-login">
						<div class="login">
							<div class="wrap-tab-cont">
								<section class="tab-cont active" id="tab01">
									<h3 class="hidden">회원 로그인</h3>
									<form action='<c:url value="/j_spring_security_check" />'
										method="post" name="login_frm"
										onsubmit="return CheckFormValue(this);" target="act">
										<input type="hidden" name="act2" value="">
										<div class="field">
											<input type="text" name="j_username" value="" validation="true"
												id="id" style="ime-mode: disabled;"
												onkeyup="crImeMode(this)" onkeypress="crImeMode(this)">
										</div>
										<div class="field">
											<input type="password" name="j_password" validation="true" id="pw">
										</div>
										<!-- 
										<p class="login-function save-id">
											<input type="checkbox" id="chk_saveID" name="chk_saveID" value="Y">
											<label for="chk_saveID">아이디 저장</label>
										</p>
										 -->
										<input type="submit" class="btn-login" value="로그인">
										<a href="${pageContext.request.contextPath}/member/join" class="btn-join">회원가입</a>
										<p class="login-function">
											<a href="/member/search_idpw.php?view_type=0">아이디 찾기</a>
											<a href="/member/search_idpw.php?view_type=1">비밀번호 찾기</a>
										</p>
									</form>
								</section>
							</div>
						</div>
					</div>
				</div>
				<!--// login -->
			</article>
		</section>

	</div>
	
	<!-- Footer -->
  <jsp:include page="../layout/footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>