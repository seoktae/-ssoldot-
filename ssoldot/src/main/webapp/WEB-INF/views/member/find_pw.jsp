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
					<h2 class="font-en">비밀번호 찾기</h2>
					
					
					<div class="wrap-idpw-search">
						<div class="login">
							<div class="wrap-tab-cont">
					<nav class="navi-tab jq-tab-type2"></nav>
								<section class="tab-cont active" id="tab01">
									<p class="search-desc">계정을 잊으셨나요?<br>
						등록된 이메일을 입력하시면 임시 비밀번호를 보내드립니다. </p>
									<!-- <form 
										method="post" name="find_pw"
										onsubmit="return CheckFormValue(this);" target="act"> -->
										<div class="idpw-search">
										<input type="hidden" name="act2" value="">
										<div class="field">
											<label for="name">이메일</label>
											<input type="text" name="member_id" id="member_id" value="" validation="true"
												id="id" style="width:360px;"
												onkeyup="crImeMode(this)" onkeypress="crImeMode(this)" >
										</div>
										
										</div>
										<div class="btn-area">
										<input type="submit" id="findBtn" value="비밀번호 찾기">
										</div>
									<!-- </form> -->
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
	
  <script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "../member/find_pw",
				type : "POST",
				data : {
					member_id : $("#member_id").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
  </script>
  <%-- 
 <script>
  	$("#btnFind").click(function(){
  		var f = document.find_pw;
		if(find_pw.member_id.value==""){
			alert("이메일을 입력해 주세요.");
		}
		f.action="action='${pageContext.request.contextPath}/member/find_pw";
		f.submit()
		
	});
  	<%
  	String param = request.getParameter("message");
  	%>
  	var msg = <%=param %>;
  	if (msg != null) {
		alert("성공");
	}
	</script>	
   --%>
</body>

</html>