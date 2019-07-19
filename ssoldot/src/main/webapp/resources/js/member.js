
/*
//이름에 특수문자 들어가지 않도록 설정
$("#user_name").blur(function() {
	if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
	} else {
		$('#name_check').text('이름을 확인해주세요');
		$('#name_check').css('color', 'red');
	}
});

if (mailJ.test($('#user_email').val())){
	console.log(phoneJ.test($('#user_email').val()));
	inval_Arr[2] = true;
} else {
	inval_Arr[2] = false;
}

*/
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
				if(frm.password.value.length>0 && frm.again.value.length>0) {
					if(frm.password.value != frm.again.value){
						$("#pwconcheck_textRe").css("color","#FF5A00").html(_LANGUAGE['a146dec65709e56bde88c03ff495d801']);
						//비밀번호가 일치하지 않습니다
						$("#pw_con_flag").val("");
						return false;
					}
					$("#pwconcheck_textRe").css("color","#00B050").html(_LANGUAGE['9ca15724cf99073f76e528da54ad110f']);
					//'비밀번호가 일치합니다.'
					$("#pw_con_flag").val("Y");
				} else {
					$("#pwconcheck_textRe").html('');
					$("#pw_con_flag").val("");
					return false;
				}
			}


