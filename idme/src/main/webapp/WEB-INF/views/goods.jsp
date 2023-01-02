<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Gafata&family=Jua&family=Sunflower&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b4e02812b5.js" crossorigin="anonymous"></script>
<title>idme</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=DynaPuff&family=Gafata&family=Jua&family=Sunflower&display=swap');
html {font-family: 'DynaPuff', 'Gafata', 'Jua', sans-serif;}
input::placeholder {font-family: 'DynaPuff', 'Jua', sans-serif; font-style : italic; color: lightgray;}
section {text-align: center; margin: 0 0;}
section#body_contents {font-family: 'Sunflower', sans-serif; margin-top: 20px;  min-width: 1200px; height: 1500px; max-height: 2500px;}

div.row {display: flex; margin: 0 0;}

div#content_top {height: 50%;}

div#top_left {width: 50%; height: 100%; display: flex; flex-wrap: wrap; justify-content: center;}
div#img_slider {position: relative; display: flex; overflow: hidden; flex-wrap: nowrap; justify-content: center; align-items: center; margin: 0 0; padding: 0 0; width: 650px; height: 650px; }
ul#img_slider_ul {position: relative; display: flex; width: 100%; height: 80%; max-height: 80%; min-height: 80%; list-style: none; padding: 0 0; border: 1px solid lightgray;}

i.slide-btn {
	color: white;
	font-size: 50px !important;
	position: absolute;	
	top: 45%;
	z-index: 99;
}

i.slide-left {left: 6%;}
i.slide-right {right: 6%;}
li.slide {display: flex; justify-content: center; min-width: 100%; height: 100%; }
li.slide img{width: 100%; height: 100%;}



div#img_shortview {display: flex; justify-content: center; width: 100%; height: 15%;}
ul#img_shortview_ul {display: flex; justify-content: center; list-style: none; height: 80px; padding: 0 0;}
li.shortview {display: flex; justify-content: center; width: 80px; height: 100%; margin: 2px; border: 1px solid lightgray; cursor: pointer;}
li.shortview img{width: 100%; height: 100%;}

.align_right{text-align: right;}
h1,h4,h5 {font-weight: 300; margin: 5px 5px;}
h1 {font-size: 28px;}
h2 {margin-left: 5px;}
h4.tot_price, h4.tot_point {font-weight: 900;}
h5 {font-size: 15px;}
div.info_text_box {padding: 3px;}
div#top_right {width: 30%; min-width: 480px; padding: 20px; padding-top: 40px; box-shadow: 0 2px 4px 0 #0000001a; text-align: left;}
div.info_title {width: 20%;}
div.info_value {width: 80%;}
span.lg_span {color: darkgray; font-style: italic; font-size: 14px;}

select#g_option_select {width: 60%; text-align: center; border: 1px solid lightgray; border-radius: 5px; height: 28px; color: #474747; padding: 5px; font-style: italic;}


button.p_btn {
    width: 48%;
    height: 40px;
    margin: 3px;
    background-color: transparent;
    border: none;
    border-radius: 5px;
    font-size: 15px; 
    font-weight: 500; 
    font-family: 'DynaPuff', sans-serif;
    cursor: pointer;
}

button.cart_btn {border: 1px solid orange; color: orange;}
button.cart_btn:hover {background-color: orange; color: white;}
button.npay_btn {background-color: #2DB400; color: white;}
button.npay_btn:hover {background-color: #268706;}
button.kakao_btn {background-color: #FAE100; color: #371D1E;}
button.kakao_btn:hover {background-color: #ead40c;}
button.purchase_btn {background-color: orange; color: white;}
button.purchase_btn:hover {background-color: #dd8f00;}



div#content_bottom {
	padding-top: 60px;
	width: 50%;
	height: 50%;
}

textarea {
    padding: 20px;
    border: none;
    resize: none;
    width: 100%;
    height: 80%;
    text-align: center;
    font-family: 'Gafata', 'Sunflower', sans-serif;
    font-size: 18px;
}

textarea:focus {
	outline: 0;
}
</style>

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

<script>
function fnImgSlideCtrl(nextSlide) {
	
	var width = $('li.slide')[0].clientWidth;
	
	$('li.slide').removeClass('active');
	$('li.slide').eq(nextSlide).addClass('active');
	
	$('ul#img_slider_ul').animate({left: -width*nextSlide}, 'slow');
}


$('select#g_option_select').on('change', function() {
	var price = '<c:out value="${goods.gPrice }" />';
	var cnt = $(this).val();
	var totPriceStr = Number(price*cnt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	var totPointStr = Number(Number(price*cnt)*0.015).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	$('h4.tot_price').text(totPriceStr + ' 원');
	$('h4.tot_point').text('최대 ' + totPointStr + ' P');	
})

$('i.slide-btn').on('click', function() {
	var type = $(this).attr('class');
	var maxCnt = $('li.slide').length;
	var currSlide = Number($('li.slide.active').attr('data-index'));
	var nextSlide;
	
	if ( type.indexOf('left') > 0 ) {
		nextSlide = currSlide-1 < 0 ? maxCnt-1 : currSlide-1;
	}
	
	else {
		nextSlide = currSlide+1 >= maxCnt ? 0 : currSlide+1;
	}
	
	fnImgSlideCtrl(nextSlide);
})

$('li.shortview').on('click', function() {
	var nextSlide = $(this).attr('data-index');
	fnImgSlideCtrl(nextSlide);
})

$(window).on('scroll', function() {
	
	var currScroll = window.scrollY;
	var maxScroll = $('div#content_top')[0].clientHeight;
	
	console.log(currScroll >= maxScroll);
	
	if ( currScroll >= 70 && currScroll < maxScroll ) {
		$('div#top_right').css({'position':'relative', 'top': Number(currScroll-70)});
	}
	
	else if ( currScroll >= maxScroll ) {
		$('div#top_right').css({'top': Number(maxScroll)});
	}
	
	else {
		$('div#top_right').css({'position':''})
	}
	
	
})

$(document).ready(function() {
	setInterval(function() {$('i.slide-btn.slide-right').trigger('click');}, 3000);

	
});

</script>


<%@ include file="includes/footer.jsp" %>
</body>
</html>
