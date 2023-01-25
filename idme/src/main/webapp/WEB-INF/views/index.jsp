<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript">
//슬라이드 버튼 클릭 시
$('i.slide-btn').on('click', function() {
	var type = $(this).attr('class');
	var width = $('li.slide')[0].clientWidth;
	var maxCnt = $('li.slide').length;
	var currSlide = Number($('li.slide.active').attr('data-index'));
	var nextSlide;
	
	if ( type.indexOf('left') > 0 ) {
		nextSlide = currSlide-1 < 0 ? maxCnt-1 : currSlide-1;
	}
	
	else {
		nextSlide = currSlide+1 >= maxCnt ? 0 : currSlide+1;
	}
	
	$('li.slide').removeClass('active');
	$('li.slide').eq(nextSlide).addClass('active');
	
	$('ul#img_slider').animate({left: -width*nextSlide}, 'slow');
})

$(function() {
	// 3초에 한 번 씩 슬라이드 이동
	setInterval(function() {$('i.slide-btn.slide-right').trigger('click');}, 3000);
});
</script>
<script type="text/javascript" src="js/header.js" />
<script type="text/javascript" src="js/index.js" />
<title>idme</title>
</head>
<body>
<%@ include file="includes/header.jsp" %>

<section id="body_contents">
	<div id="category">
		<ul id="category">
			<c:forEach begin="0" end="${category.size()}" items="${category }" var="category">
				<li class="category_li">
					<a class="categories" href="/getGoodsList?category=${category}" data-item="${category }">${category }</a>
				</li> 
			</c:forEach>
			<li>
		</ul>
		
	</div>

	<hr/>

	<div id="slide_images">
		<i class="fa-solid fa-angle-left btn slide-btn slide-left"></i>
		<ul id="img_slider">
			<li class="slide active" data-index=0><img src="images/slides/slides1.jpg" /></li>
			<li class="slide" data-index=1><img src="images/slides/slides2.jpg" /></li>
			<li class="slide" data-index=2><img src="images/slides/slides3.jpg" /></li>
			<li class="slide" data-index=3><img src="images/slides/slides4.jpg" /></li>
			<li class="slide" data-index=4><img src="images/slides/slides5.jpg" /></li>
			<li class="slide" data-index=5><img src="images/slides/slides6.jpg" /></li>
			<li class="slide" data-index=5><img src="images/slides/slides7.jpg" /></li>
		</ul>
		<i class="fa-solid fa-angle-right btn slide-btn slide-right"></i>
	</div>
	
	<div id="goods_box">
	<div id="title_box">
		<h2>상품</h2>
	</div>
	<div id="goods_list">
		<c:forEach begin="0" end="${goodsList.size() }" items="${goodsList }" var="goods" > 
		<div class="goods" onclick="location.href='goods/goodsDetails?gno=${goods.gNo }'">
			<div class="g_photo" data-gno="${goods.gNo}">
				<c:forEach begin="0" end="${photoList.size() }" items="${photoList }" var="photos" >
					<c:if test="${photos.gNo == goods.gNo }">
					<img alt="" src="${photos.pPath}${photos.pFileName}" />
					</c:if>	
				</c:forEach>
			</div>
			<div class="g_info">
				<h4 class="g_category">${goods.gType}</h4>
				<h4 class="g_title" data-gno="${goods.gNo}">${goods.gName}</h4>
				<h4 class="g_price"> <fmt:formatNumber value="${goods.gPrice }" type="currency" currencySymbol=""/>원</h4>		
			</div>
			<div class="g_description">
					<p class="g_score">
						<script>
							ran()
							function ran(){
								//⭐✰
								const r = Math.random() * 5 + 0 
								let s = '';
								for(let x=0;x<r;x++){
									  s+='⭐';
								}
								for(let y=4;y>r;y--){
									s+='✰';
								}
								document.write(s);	
							}
						</script>
					</p>
					<p class="g_content">${goods.gContent}</p>
				</div>
		</div>
			
		</c:forEach>
	</div></div>
</section>

<hr/>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
