<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 로그인 완료된 경우 session에 유저 정보 저장되어 넘어옴 --%>
<c:set var="loginUser" value="${sessionScope.loginUser }" />

<section id="header">
	<a id="logo" href="/idme">
		<img id="logo" src="/idme/images/logo/idme3.png"/>
	</a>
	
	<div id="search">
		<div id="input_box">
			<input type="search" id="s_input" placeholder="Search" />
			<i class="fa-solid fa-magnifying-glass btn search-btn"></i>
		</div>
	</div>
	
	<%-- 로그인 여부에 따라 div 생성 --%>
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
		</c:when>
		
		<c:otherwise>
			<div id="user_info_box">
				<div id="nickname_box">${loginUser.mNickname }님, 반가워요 !</div>
				<i class="fa-regular fa-circle-user btn info-btn"></i>
				<i class="fa-solid fa-right-from-bracket btn logout-btn" onclick="fnLogin('signout');"></i>
			</div>
		</c:otherwise>
	</c:choose>
</section>