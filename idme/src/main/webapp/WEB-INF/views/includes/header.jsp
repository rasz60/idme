<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loginUser" value="${sessionScope.loginUser }" />
<style>
section#header {
	display: flex; 
	justify-content: center;
	align-items: center;
	min-width: 1200px;
	height: 60px;
	border-bottom: 1px solid lightgrey;
}

div.blanc-div {
	width: 20%;
}

div.blanc-div.left {
	width: 30%;
}

a#logo {
	width: 13%;
	cursor: default;
}
	
img#logo {
	width: 100%; 
	height: 100%;
	max-width: 100px;
	max-height: 40px;
	cursor: pointer;
}

div#search {
	width: 25%;
	justify-content: center;
	align-items: center;
}

div#input_box {
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 95%; height: 70%;
	min-width: 250px;
	border: 1px solid orange;
	border-radius: 3px;
	color: orange;
}
input:-webkit-autofill { -webkit-box-shadow: 0 0 0 30px #fff inset ; -webkit-text-fill-color: #000; }
input:-webkit-autofill, input:-webkit-autofill:hover, input:-webkit-autofill:focus, input:-webkit-autofill:active { transition: background-color 5000s ease-in-out 0s; }
input#s_input {
	width: 85%;	height: 70%;
	border: none;
	outline: none;
	background-color: transparent;
}

div#login_input_box, div#user_info_box {
	margin-left: 10px;
	width: 25%;
	display: flex;
	justify-content: flex-start;
	align-items: center;
	color: orange;
}

i.login-close-btn {
	margin-left: 10px !important;
}

form#login_form, i.login-close-btn {
	visibility: hidden;
    opacity: 0;
    transition: opacity 0.5s ease-in;
}

form#login_form.show, i.login-close-btn.show {
    opacity: 1;
    transition: opacity 0.5s ease-in;
}

input.login_input {
	margin-top: 8px;
	border: none;
	outline: none;
	background-color: transparent;
	border-bottom: 1px solid orange;
}

i.btn {
	cursor: pointer;
	margin: 3px;
	font-size: 23px;
}

div#nickname_box {
	width: 75%;
	text-align: right;
	padding-right: 20px;
}

</style>

<script>
function fnLogin(type) {
	
	var target1 = $('form#login_form');
	var target2 = $('i.login-close-btn');
	var	displayFlag = target1.attr('class');
	
	if ( type == 'close' ) {
		target1.removeClass('show');
		target2.removeClass('show');
		target1.css({'visibility':'hidden'});
		target2.css({'visibility':'hidden'});
	}
	
	if ( type == 'signout') {
		if ( confirm('로그아웃할까요?') ) {
			var returnUrl = window.location.href.substring(26);
			location.href = '/idme/login/logout?returnUrl=' + returnUrl;
		} else {
			return false;
		}
	}

	if ( displayFlag != 'show' ) {
		target1.addClass('show');
		target2.addClass('show');
		target1.css({'visibility':'visible'});
		target2.css({'visibility':'visible'});
	} 
	
	else {
		var id = $('input#id_input').val();
		var pwd = $('input#pwd_input').val();
		
		if ( id == '' || pwd == '' ) {
			alert('id와 pwd를 입력해주세요.');
			return false;
		}
		
		var returnUrl = window.location.href.substring(26);
		
		$.ajax({
			url : '/idme/ajax/loginMember',
			type: $('form#login_form').attr('method'),
			data: {id: $('input#id_input').val(), pwd: $('input#pwd_input').val()},
			success : function(data) {
				if ( data.errMsg != null ) {
					alert(data.errMsg);
					$('input#pwd_input').val('');
					$('input#pwd_input').focus();
				}
				else {
					$('input[name="returnUrl"]').val(returnUrl);
					$('form#login_form').submit();
				}			
			},
			error : function() {}
		})
		
	}	
};

</script>

<section id="header">
	<div class="blanc-div left"></div>
	<a id="logo" href="/idme">
		<img id="logo" src="/idme/images/logo/idme3.png"/>
	</a>
	
	<div id="search">
		<div id="input_box">
			<input type="search" id="s_input" placeholder="Search" />
			<i class="fa-solid fa-magnifying-glass btn search-btn"></i>
		</div>
	</div>

	<c:choose>
		<c:when test="${loginUser eq null}">
			<div id="login_input_box">
				<form id="login_form" method="post" action="/idme/login">
					<input type="hidden" name="returnUrl" value="" />
					<input type="text" id="id_input" name="id" class="login_input" placeholder="ID" />
					<input type="password" id="pwd_input" name="pwd" class="login_input" placeholder="Password" />
				</form>
				<i class="fa-solid fa-arrow-right-to-bracket btn signin-btn" onclick="fnLogin('signin');"></i>
				<i class="fa-regular fa-circle-xmark btn login-close-btn" onclick="fnLogin('close');"></i>		
			</div>
			<div class="blanc-div right"></div>
		</c:when>
		
		<c:otherwise>
			<div id="user_info_box">
				<div id="nickname_box">${loginUser.mNickname }님, 반가워요 !</div>
				<i class="fa-regular fa-circle-user btn info-btn"></i>
				<i class="fa-solid fa-right-from-bracket btn logout-btn" onclick="fnLogin('signout');"></i>
			</div>
			<div class="blanc-div right"></div>
		</c:otherwise>
	</c:choose>
</section>