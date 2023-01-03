<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- google custom font start --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Gafata&family=Jua&family=Sunflower&display=swap" rel="stylesheet">
<%-- google custom font end --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><%-- jquery --%>
<script src="https://kit.fontawesome.com/b4e02812b5.js" crossorigin="anonymous"></script><%-- fontawesome --%>
<link rel="stylesheet" type="text/css" href="/idme/css/header.css" />
<link rel="stylesheet" type="text/css" href="/idme/css/footer.css" />
<link rel="stylesheet" type="text/css" href="/idme/css/goods.css" />
<script type="text/javascript" src="/idme/js/header.js"></script>
<title>idme</title>

</head>
<body>
<%@ include file="includes/header.jsp" %>

<section id="body_contents">
	<div id="content_top" class="row">
		<div id="top_left" class="col">
			<div id="img_slider">
				<i class="fa-solid fa-angle-left btn slide-btn slide-left"></i>
				<ul id="img_slider_ul">
					<c:forEach begin="0" end="${photoList.size() }" items="${photoList }" var="photo" varStatus="idx">
						<li class="slide <c:if test="${photo.pSeq == 1}">active</c:if>" data-index="${idx.index}">
							<img src="/idme/${photo.pPath }${photo.pFileName}"/>
						</li>
					</c:forEach>
				</ul>
				<i class="fa-solid fa-angle-right btn slide-btn slide-right"></i>
			</div>
			
			<div id="img_shortview">
				<ul id="img_shortview_ul">
					<c:forEach begin="0" end="${photoList.size() }" items="${photoList }" var="photo" varStatus="idx">
						<li class="shortview" data-index="${idx.index }">
							<img src="/idme/${photo.pPath }${photo.pFileName}" />
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<div id="top_right" class="col">
			<h1>${goods.gName }</h1>
			<h2><fmt:formatNumber value="${goods.gPrice }" type="currency" currencySymbol=""/>원</h2>
			<br/><br/>
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">적립금</h4>
				</div>
				<div class="info_value">
					<h5 class="info_text">최대 <fmt:formatNumber value="${goods.gPrice*0.015 }" pattern="#,###" />P&nbsp;&nbsp;<span class="lg_span">(수량 1개 기준)</span></h5>
				</div>
			</div>
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">배송비</h4>
				</div>
				<div class="info_value">
					<h5 class="info_text">3,000원 <span class="lg_span">&nbsp;&nbsp;(30,000원 이상 무료배송)</span></h5>
				</div>
			</div>
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">배송 시작</h4>
				</div>
				<div class="info_value">
					<h5 class="info_text">평균 1일, 최대 1일 이내</h5>
				</div>
			</div>
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">수량</h4>
				</div>
				<div class="info_value">
					<h5 class="info_text">주문시 제작</h5>
				</div>
			</div>
			
			<br/><br/><br/><br/><br/>
							
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">구매 수량</h4>
				</div>
				<div class="info_value align_right">
					<select name="" id="g_option_select">
						<option value="0">--</option>
						<option value="1">1개</option>
						<option value="2">2개</option>
						<option value="3">3개</option>
						<option value="4">4개</option>
						<option value="5">5개</option>
						<option value="6">6개</option>
						<option value="7">7개</option>
						<option value="8">8개</option>
						<option value="9">9개</option>
						<option value="10">10개</option>
					</select>
				</div>
			</div>
			<br/>
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">총 금액</h4>
				</div>
				<div class="info_value align_right">
					<h4 class="info_text tot_price">원</h4>
				</div>
			</div>
			
			<div class="row info_text_box">
				<div class="info_title">
					<h4 class="info_text">총 적립금</h4>
				</div>
				<div class="info_value align_right">
					<h4 class="info_text tot_point">P</h4>
				</div>
			</div>
			
			<br/>
			
			<div class="p_btn_box">
				<button class="p_btn cart_btn">Cart</button>
				<button class="p_btn npay_btn">NPay</button>
				<button class="p_btn kakao_btn">KAKAO Pay</button>
				<button class="p_btn purchase_btn">Purchase</button>
			</div>
		</div>
	</div>
	
	<div id="content_bottom">
		<div>
			<h2>[상품설명]</h2>
		</div>
		<textarea readonly>${goods.gContent}</textarea>
	</div>
</section>

<script type="text/javascript" src="/idme/js/goods.js"></script>


<%@ include file="includes/footer.jsp" %>
</body>
</html>
