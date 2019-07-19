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

  <title>비밀번호 변경</title>
  
   
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jQueryUI/jquery-ui.css">
  <script src="${pageContext.request.contextPath}/resources/jQueryUI/jquery-ui.js"></script>
  
  
  
  
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
							<a href="/member/account/info" aria-current="page" class="active"><img
								src="//img1.daumcdn.net/thumb/C100x100/?scode=mtistory2&amp;fname=https%3A%2F%2Ft1.daumcdn.net%2Ftistory_admin%2Fblog%2Fadmin%2Fprofile_default_06.png"
								width="100" height="100" class="thumb_img" alt=""></a>
						</div>
						<div class="wrap_cont">
							<strong class="tit_profile">닉네임</strong>
							<span class="txt_ellip">${vo.nickname}</span>
						</div>
					</div>
					
					<jsp:include page="layout/mypage_tab.jsp" />
					</div>
				<div id="mArticle">
					<div class="inner_article">
						<h2 id="kakaoBody" class="screen_out">계정관리 본문</h2>
						<div class="member_basic">
							<h3 class="tit_cont">비밀번호 변경</h3>
							<form class="wrap_set" name="join_frm" action="${pageContext.request.contextPath}/member/modify" method="post">
								<fieldset class="fld_name">
									<legend class="screen_out">비밀번호 설정</legend>
									<label class="lab_tf">
									<strong class="tit_set">비밀번호</strong>
									<span id="pwconcheck_text" style="color: rgb(255, 90, 0);">영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요.</span>
									<input type="password" class="tf_member" name="password" id="password"value=""></label>
								
									
									
									<label class="lab_tf">
									<strong class="tit_set">비밀번호 확인</strong>
									<span id="pwconcheck_textRe" style="color: rgb(255, 90, 0);"></span>
									<input type="password" class="tf_member" name="password2" id="password2" value="">
									</label>
								</fieldset>
								
								<fieldset>
									<legend class="screen_out">저장 버튼</legend>
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

<script>
			$("#password").keyup(function(){
				pwCheck();
			});
			$('#password2').keyup(function(){
				pwconCheck();
			});
			
			//비밀번호 체크
			function pwCheck(obj){
				var frm=document.join_frm;
				//var PT_pwtype = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,18}/;
				//var PT_pwtype = /^(?=([a-zA-Z0-9]+[!,@,#,$,%,^,&,*,?,_,~]*)|([!,@,#,$,%,^,&,*,?,_,~]+[a-zA-Z0-9])$).{6,18}/;
				var PT_pwtype = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{6,18}$/;
				if(!PT_pwtype.test(frm.password.value)) {
					$("#pwconcheck_text").css("color","#FF5A00").html('영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요.');
					//6~18 자리의 영문과 숫자 조합이어야만 합니다
					$("#pw_flag").val("");
					return false
				} else {
					if(frm.password.value.length < 6 || frm.password.value.length > 18 ){
						$("#pwconcheck_text").css("color","#FF5A00").html('영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요.');
						//6~18 자리의 영문과 숫자 조합이어야만 합니다
						$("#pw_flag").val("");
						return false
					}
					$("#pwconcheck_text").css("color","#00B050").html('이 비밀번호는 사용가능 합니다.');
					//이 비밀번호는 사용할 수 있습니다
					$("#pw_flag").val("Y");
				}
				pwconCheck(obj);
			}
			function pwconCheck(obj){
				var frm=document.join_frm;
				if(frm.password.value.length>0 && frm.password2.value.length>0) {
					if(frm.password.value != frm.password2.value){
						$("#pwconcheck_textRe").css("color","#FF5A00").html('비밀번호가 일치하지 않습니다.');
						//비밀번호가 일치하지 않습니다
						$("#pw_con_flag").val("");
						return false;
					}
					$("#pwconcheck_textRe").css("color","#00B050").html('비밀번호가 일치합니다.');
					//'비밀번호가 일치합니다.'
					$("#pw_con_flag").val("Y");
				} else {
					$("#pwconcheck_textRe").html('');
					$("#pw_con_flag").val("");
					return false;
				}
			}
			</script>
			

</html>