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
  <link href="${pageContext.request.contextPath}/resources/member/mypage.css" rel="stylesheet">
  
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
	
<div class="container">
<div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header">회원가입</div>
                            <div class="card-body">

                                <form name="join_frm" action="${pageContext.request.contextPath}/member/join"
			onsubmit="return insertChk(this);" enctype="multipart/form-data" method="post">
								<label for="name" class="cols-sm-2 control-label">프로필 사진</label>
								<fieldset class="fld_image">
									<legend class="screen_out">프로필 이미지 설정</legend>
									<div class="wrap_thumb photo_profile">
										<!-- <label style="margin-left: 34%; margin-right: auto; display: block;"> -->
										<img id="foo" src="${pageContext.request.contextPath}/resources/member/profile_pic/default.png"
											class="thumb_img" width="180" height="180" alt="" style="margin-left: 37%; margin-right: auto;">
											<label class="lab_btn lab_photo">
											<span class="ico_member">이미지 찾아보기</span>
											<input type="file" name="file" id="file" class="btn_g" value="">
											</label>
									</div>
								</fieldset>
                                    <div class="form-group">
                                        <label for="email" class="cols-sm-2 control-label">이메일 주소</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                <input type="email" class="form-control" name="member_id" id="member_id" placeholder="사용하실 ID를 입력해주세요.(수신 가능한 Email)" />
                                            </div>
                                            <span id="id_check" style="color: rgb(255, 90, 0);"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="name" class="cols-sm-2 control-label">닉네임</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                <input type="text" class="form-control" name="nickname" id="nickname" placeholder="사용하실 닉네임을 입력해주세요." />
                                            </div>
                                            <span id="name_check" style="color: rgb(255, 90, 0);"></span>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="password" class="cols-sm-2 control-label">비밀번호</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="password" id="password" placeholder="영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요." />
                                            </div>
                                            <span id="pwconcheck_text" style="color: rgb(255, 90, 0);"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
                                        <div class="cols-sm-10">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                <input type="password" class="form-control" name="password2" id="password2" placeholder="패스워드를 다시 입력해주세요." />
                                            </div>
                                            <span id="pwconcheck_textRe" style="color: rgb(255, 90, 0);"></span>
                                        </div>
                                    </div>
                                    <input type="hidden" id="idChk" value="N" />
                                    <input type="hidden" id="nameChk" value="N" />
                                    <input type="hidden" id="passChk" value="N" />
                                    <input type="hidden" id="confChk" value="N" />
                                    <div class="form-group" style="border-top: 1px solid #ccc; padding-top: 10px">
										<input type="submit" value="등록" class="btn btn-Secondary btn-lg btn-block login-button">
										<a href="/ssoldot/" class="btn btn-Secondary btn-lg btn-block login-button">취소</a>
									</div>
                                    
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
</div>
	
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
				pwconCheck(obj);
				if(!PT_pwtype.test(frm.password.value)) {
					$("#pwconcheck_text").css("color","#FF5A00").html('영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요.');
					//6~18 자리의 영문과 숫자 조합이어야만 합니다
					$("#passChk").val('N');
					return false
				} else {
					if(frm.password.value.length < 6 || frm.password.value.length > 18 ){
						$("#pwconcheck_text").css("color","#FF5A00").html('영문 대소문자, 숫자 및 특수문자 6~18자 조합 입력하세요.');
						//6~18 자리의 영문과 숫자 조합이어야만 합니다
						$("#passChk").val('N');
						return false
					}
					$("#pwconcheck_text").css("color","#00B050").html('이 비밀번호는 사용가능 합니다.');
					//이 비밀번호는 사용할 수 있습니다
					$("#passChk").val('Y');
				}
				
			}
			function pwconCheck(obj){
				var frm=document.join_frm;
				if(frm.password.value.length>0 && frm.password2.value.length>0) {
					if(frm.password.value != frm.password2.value){
						$("#pwconcheck_textRe").css("color","#FF5A00").html('비밀번호가 일치하지 않습니다.');
						//비밀번호가 일치하지 않습니다
						$("#confChk").val("N");
						return false;
					}
					$("#pwconcheck_textRe").css("color","#00B050").html('비밀번호가 일치합니다.');
					//'비밀번호가 일치합니다.'
					$("#confChk").val("Y");
				} else {
					$("#pwconcheck_textRe").html('');
					$("#pw_con_flag").val('N');
					return false;
				}
			}
			
			$("#member_id").blur(function() {
				var emailtype = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

				if (emailtype.test($("#member_id").val())) {
				
				$.ajax({
					url : "../member/check_id",
					type : "POST",
					data : {
						member_id : $("#member_id").val()
					},
					success : function(result) {
						if (result == 1) {
							$("#id_check").css("color","#FF5A00").html('중복된 이메일이 있습니다.');
							$("#idChk").val('N');
						} else {
							$("#id_check").css("color","#00B050").html("사용가능합니다.");
							$("#idChk").val('Y');
						}
					},
				})//ajax
				
				} else {
					$("#id_check").css("color","#FF5A00").html('이메일 형태로 입력해주세요.');
					$("#idChk").val('N');
				}
			});
			
			
			$("#nickname").blur(function(){
				$.ajax({
					url : "../member/check_nickname",
					type : "POST",
					data : {
						nickname : $("#nickname").val()
					},
					success : function(result) {
						if (result == 1) {
							$("#name_check").css("color","#FF5A00").html("중복된 닉네임이 있습니다.");
							$("#nameChk").val('N');
						} else {
							$("#name_check").css("color","#00B050").html("사용가능합니다.");
							$("#nameChk").val('Y');
						}
					},
				})
			});
			
			function insertChk(){
				var frm=document.join_frm;
				if($("#idChk").val() == 'N'){
				    frm.member_id.focus();
					return false;
				} 
				if($("#nameChk").val() == 'N'){
					frm.nickname.focus();
					return false;
				} 
				if($("#passChk").val() == 'N'){
					frm.password.focus();
					return false;
				} 
				if($("#confChk").val() == 'N'){
					frm.password2.focus();
					return false;
				}
				
			}

			</script>
			
			
			

		</section>

	</div>
  <!-- Footer -->
  <jsp:include page="../layout/footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
  <!-- 사진 미리보기  -->
  <script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#file").change(function() {
        readURL(this);
    });
   </script>
</body>

</html>