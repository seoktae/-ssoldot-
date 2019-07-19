<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원 가입</title>
  
  <!-- member CSS  -->
  <link href="${pageContext.request.contextPath}/resources/member/member.css" rel="stylesheet">
  
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/member.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jQueryUI/jquery-ui.css">
  <script src="${pageContext.request.contextPath}/resources/jQueryUI/jquery-ui.js"></script>
  


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
			<h1 style="border-bottom: 1px solid #ccc">회원가입</h1>
			
			<form name="join_frm" action="${pageContext.request.contextPath}/member/join"
			onsubmit="return join_confirm(this);" enctype="multipart/form-data" method="post">
				<div class="agreement">
			
					<div class="text">
						<h1>이용약관 안내</h1>

						<p>
							<strong>제 1 장 총 칙</strong>
						</p>

						<p>&nbsp;</p>

						<p>제 1조 ( 목적 )</p>

						<p>본 약관은 제공하는 동호회 서비스의 이용과 관련하여 현행 법령에 위반하지 않는 범위 내에서 회원과
							당사와의 중요 사항을 정하는 것을 목적으로 한다.</p>

						<p>&nbsp;</p>

						<p>제 2조 ( 약관의 효력과 변경)</p>

						<p>(1) 약관의 효력</p>

						<p>이 약관은 사이트 게시판을 통하여 이용자에게 공시함으로써 효력을 발생합니다.</p>

						<p>&nbsp;</p>

						<p>&nbsp;</p>

						<p>제 3조 (용어의 정의)</p>

						<p>(1) 회 원: 서비스 이용계약을 체결한 자</p>

						<p>(2) ID : 회원식별과 서비스 이용을 위하여 회원이 선정한 문자와 숫자의 조합</p>

						<p>(3) 비밀번호: 회원의 정보보호와 회원만의 이용을 위한 문자와 숫자로 이루어진 조합</p>

						<p>(4) 관리자: 서비스의 전반적인 관리와 운영을 담당하는자</p>

						<p>&nbsp;</p>

						<p>
							<strong>제 2 장 서비스 이용계약</strong>
						</p>

						<p>&nbsp;</p>

						<p>제 4조 (이용계약의 성립)</p>

						<p>회원은 제시하는 양식에 자기 정보를 입력하고 이용신청을 하고&nbsp; 이에 대하여 승낙함으로써
							당사의 서비스를 제공 받으실 수 있습니다.</p>

						<p>제 5조 (이용신청시 기재사항)</p>

						<p>회원은 가입시 다음에 규정하는 사항을 필수적으로 입력하셔야 승낙을 받으실 수 있습니다.</p>

						<p>(1) 이 름</p>

						<p>(2) E-mail 주소</p>

						<p>(3) 비밀번호</p>

						<p>(4) 닉네임</p>
						<div class="confirm">
							<label for="accept_agree"> <input type="checkbox"
								name="accept_agreement" value="Y" id="accept_agree"> 약관을
								모두 읽었으며 동의합니다.
							</label>
						</div>
					</div>
				</div>
					<div class="control-group">
						<label for="email_address" class="control-label"><em
							style="color: red">*</em> 이메일 주소</label>
						<div class="controls">
							<input type="email" name="member_id" id="member_id"
								value="test@test.com" required="">
						</div>
						<div class="check_font" id="id_check"></div>
					</div>
					<div class="control-group">
						<label for="password" class="control-label"><em
							style="color: red">*</em> 비밀번호</label>
						<div class="controls">
							<input type="password" name="password" id="password" validation="true" value=""
								required="">
							<span id="pwconcheck_text" style="color: rgb(255, 90, 0);">영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요.</span>
						</div>
					</div>
					<div class="control-group">
						<label for="password2" class="control-label"><em
							style="color: red">*</em> 비밀번호 확인</label>
						<div class="controls">
							<input type="password" name="password2" id="password2" value=""
								required="">
						<span id="pwconcheck_textRe" style="color: rgb(255, 90, 0);"></span>
						</div>
					</div>
					<div class="control-group">
						<label for="nick_name" class="control-label"><em
							style="color: red">*</em> 닉네임</label>
						<div class="controls">
							<input type="text" name="nickname" id="nickname" value="test">
						</div>
					</div>
					<div class="control-group">
						<label for="find_account_question" class="control-label"><em
							style="color: red">*</em> 비밀번호 찾기 질문/답변</label>
						<div class="controls">
							<select name="pwd_que" id="pwd_que"
								style="display: block; margin: 0 0 8px 0"><option
									value="1">다른 이메일 주소는?</option>
								<option value="2">나의 보물 1호는?</option>
								<option value="3">나의 출신 초등학교는?</option>
								<option value="4">나의 출신 고향은?</option>
								<option value="5">나의 이상형은?</option>
								<option value="6">어머니 성함은?</option>
								<option value="7">아버지 성함은?</option>
								<option value="8">가장 좋아하는 색깔은?</option>
								<option value="9">가장 좋아하는 음식은?</option></select>
								<input type="text"
								name="pwd_ans" id="pwd_ans"
								title="비밀번호 찾기 답변" value="">
						</div>
					</div>
					<div class="control-group">
						<label for="profile_image" class="control-label">프로필 사진</label>
						<div class="controls">
							<input type="hidden" name="or_picname" value="false"><input
								type="file" name="file" id="file" value="">
							<p class="help-block">가로 제한 길이: 50px, 세로 제한 길이: 50px</p>
						</div>
					</div>
					<div class="btnArea"
						style="border-top: 1px solid #ccc; padding-top: 10px">
						<input type="submit" value="등록" class="btn btn-inverse pull-right" onclick="doSignup();">
						<a href="/ssoldot/" class="btn pull-left">취소</a>
					</div>
					
					<input type="hidden" name="pw_flag" id="pw_flag" value="Y" validation="true" title="비밀번호를 다시한번 확인해주세요.">
				
			</form>
			
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
			
<!-- 			
			
			<script>
			
jQuery(function($){
	// label for setup
	$('.control-label[for]').each(function(){
		var $this = $(this);
		if($this.attr('for') == ''){
			$this.attr('for', $this.next().children(':visible:first').attr('id'));
		}
	});
});
(function($){
	$(function(){
		var option = { changeMonth: true, changeYear: true, gotoCurrent: false,yearRange:'-100:+10', dateFormat:'yy-mm-dd', onSelect:function(){
			$(this).prev('input[type="hidden"]').val(this.value.replace(/-/g,""))}
		};
		$.extend(option,$.datepicker.regional['ko']);
		$(".inputDate").datepicker(option);
		$(".dateRemover").click(function() {
			$(this).prevAll('input').val('');
			return false;});
	});
})(jQuery);
</script>
 -->
		</section>

	</div>
  <!-- Footer -->
  <jsp:include page="../layout/footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>