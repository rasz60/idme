// 로그인, 로그아웃, 로그인 input close 처리
// type : signin, signout, close
function fnLogin(type) {
	var target1 = $('form#login_form');
	var target2 = $('i.login-close-btn');
	var	displayFlag = target1.attr('class');
	
	// 로그아웃 처리
	if ( type == 'signout') {
		if ( confirm('로그아웃할까요?') ) {
			// 로그아웃한 현재 페이지의 context URL을 제외한 URL을 returnUrl로 지정
			var returnUrl = window.location.href.substring(26);
			location.href = '/idme/login/logout?returnUrl=' + returnUrl;
		} else {
			return false;
		}
	}
	
	// 로그인 버튼 클릭 했을 때, 로그인 인풋이 visible이 아닌 경우
	if ( displayFlag != 'show' ) {
		// 숨겨진 로그인 인풋 visible로 변경
		target1.addClass('show');
		target2.addClass('show');
		target1.css({'visibility':'visible'});
		target2.css({'visibility':'visible'});
	} 
	
	// 로그인 input을 다시 안보이게 처리
	else if ( type == 'close' && displayFlag == 'show') {
		target1.removeClass('show');
		target2.removeClass('show');
		target1.css({'visibility':'hidden'});
		target2.css({'visibility':'hidden'});
	}
	
	// 로그인 버튼 클릭 했을 때, 로그인 인풋이 visible인 경우
	else {
		var id = $('input#id_input').val();
		var pwd = $('input#pwd_input').val();
		
		// 로그인 인풋에 입력된 값 validation
		if ( id == '' || pwd == '' ) {
			alert('id와 pwd를 입력해주세요.');
			return false;
		}
		
		// 로그인한 현재 페이지의 context URL을 제외한 URL을 returnUrl로 지정 
		var returnUrl = window.location.href.substring(26);
		
		// 로그인하려는 아이디와 비밀번호가 존재하는지 ajax로 체크
		$.ajax({
			url : '/idme/ajax/loginMember',
			type: $('form#login_form').attr('method'),
			data: {id: $('input#id_input').val(), pwd: $('input#pwd_input').val()},
			success : function(data) {
				// 존재하지 않는 경우 errMsg alert
				if ( data.errMsg != null ) {
					alert(data.errMsg);
					$('input#pwd_input').val('');
					$('input#pwd_input').focus();
				}
				// 존재하는 경우, 로그인 진행
				else {
					$('input[name="returnUrl"]').val(returnUrl);
					$('form#login_form').submit();
				}			
			},
			error : function() {}
		})
	}	
	
};