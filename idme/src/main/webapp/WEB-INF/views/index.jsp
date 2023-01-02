<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Gafata&family=Jua&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b4e02812b5.js" crossorigin="anonymous"></script>
<title>idme</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=DynaPuff&family=Gafata&family=Jua&display=swap');
html {font-family: 'DynaPuff', 'Gafata', 'Jua', sans-serif;}
input::placeholder {font-family: 'DynaPuff', cursive; font-style : italic; color: lightgray;}
section {font-style : italic; text-align: center; margin: 0 auto; min-width: 1200px;}




section#body_contents {text-align: center; height: 1500px;}



div#category {display: flex; justify-content: center; height: 3%; line-height: 100%; border-bottom: 1px solid lightgrey; box-shadow: 0px 15px 15px -10px #666;}
ul#category {margin: 0 0; display: flex; justify-content: center; align-items: center; width: 50%; height: 100%; list-style: none;}
a.categories {margin: 10px; text-decoration: none; color: #2B2B2B; font-size: 17px;}
ul#category li {display: flex; justify-content: center; align-items: center; width: 15%; height: 100%;}
ul#category li.active{border-bottom: 2px solid orange;}
ul#category li.active a.categories {color: orange; font-weight: 600;}

div#slide_images {display:flex; justify-content: flex-start; height: 480px; z-index: 1; flex-wrap: nowrap; overflow: hidden; margin-top: 2px;}

i.slide-btn {
	color: white;
	font-size: 50px !important;
	position: absolute;	
	top: 35%;
	z-index: 99;
}

i.slide-left {
	left: 5%;
}

i.slide-right {
	right: 5%;
}

ul#img_slider {
	position: relative;
	display: flex; 
	list-style: none; 
	margin: 0 0; 
	padding: 0 0;
}

li.slide {
	display: flex; 
	justify-content: center;
}


section#body_contents div#goods {height: 67%; cursor: pointer;}
section#body_contents div#goods:hover {background-color: #10A1E7;}


div#goods_box {
	width: 60%; min-width: 1000px;
	height: 900px;
	margin: 0 auto;
}

div#goods_box div#title_box {
	border-bottom: 1px solid lightgrey;
}

div#goods_box div#title_box h2 {
	text-align: left;
}

div#goods_list {
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	width: 98%; height: 100%;
}

div#goods_list div.goods{
	width: 18%; height: 45%;
	border: 1px solid lightgray;
	border-radius: 8px; 
	background-color: #f8f9fb;
}

div.g_photo, div.g_info, div.g_description {
	font-style: normal;
	font-family: 'Gafata', sans-serif;
	padding : 0px 8px;
}

div.g_photo {
	cursor: pointer;
	padding: 0;
	border-radius: 8px 8px 0px 0px; 
	overflow: hidden;
	height: 55%;
	border-bottom: 1px solid lightgray;
}

div.g_photo img{
	width: 100%; height: 100%;
}

div.g_info {
	height: 30%;
	font-size: 15px;
	text-align: left;
	border-bottom: 1px solid lightgray;
}

div.g_info h4 {
	margin: 0 auto;
	margin-top: 5px;
}

div.g_info h4.g_category {
	color: darkgray;
}

div.g_info h4.g_title {
	cursor: pointer;
}

div.g_description {
	padding-top: 5px;
	border-radius: 0px 0px 8px 8px; 
	height: 12.5%;
}

p.g_content {
	margin: 0 auto;
	font-family: 'Gafata', sans-serif;
	font-size: 14px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

a.more_btn {
	display: block;
	margin-top: 8px;
	font-size: 12px;
	text-decoration: none;
	text-align: right;
	padding-right: 10px;
}
</style>

</head>

<body>
<%@ include file="includes/header.jsp" %>

<section id="body_contents">
	<div id="category">
		<ul id="category">
			<c:forEach begin="0" end="${category.size() }" items="${category }" var="category">
				<li class="categroy_li">
					<a class="categories" href="ajax/getGoodsList?category=${category}" data-item="${category}">${category}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<div id="slide_images">
		<i class="fa-solid fa-angle-left btn slide-btn slide-left"></i>
		<ul id="img_slider">
			<li class="slide active" data-index=0><img src="images/slides/slides1.jpg" /></li>
			<li class="slide" data-index=1><img src="images/slides/slides2.jpg" /></li>
			<li class="slide" data-index=2><img src="images/slides/slides3.jpg" /></li>
			<li class="slide" data-index=3><img src="images/slides/slides4.jpg" /></li>
			<li class="slide" data-index=4><img src="images/slides/slides5.png" /></li>
			<li class="slide" data-index=5><img src="images/slides/slides6.png" /></li>
		</ul>
		<i class="fa-solid fa-angle-right btn slide-btn slide-right"></i>
	</div>
	
	<div id="goods_box">
		<div id="title_box">
			<h2>Goods</h2>
		</div>
		
		<div id="goods_list">
			<c:forEach  begin="0" end="${goodsList.size() }" items="${goodsList }" var="goods">
			<div class="goods">
				<div class="g_photo" data-gno="${goods.gNo }">
					<c:forEach begin="0" end="${photoList.size() }" items="${photoList }" var="photo">
						<c:if test="${goods.gNo == photo.gNo }">						
							<img src="${photo.pPath }${photo.pFileName}" alt="" />
						</c:if>
					</c:forEach>
				</div>
				<div class="g_info">
					<h4 class="g_category">${goods.gType }</h4>
					<h4 class="g_title"  data-gno="${goods.gNo }">${goods.gName }</h4>
					<h4 class="g_price"><fmt:formatNumber value="${goods.gPrice }" type="currency" currencySymbol=""/>원</h4>
				</div>
				<div class="g_description">
					<p class="g_content">${goods.gContent}</p>
					<a class="more_btn" href="goods/goodsDetails?gno=${goods.gNo }">더보기..</a>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</section>

<%@ include file="includes/footer.jsp" %>

<script>
$('a.categories').on('click', function(e) {
	e.preventDefault();
	
	var target = $(this).parent();
	
	if ( target.attr('class').indexOf('active') > 0 ) {
		console.log('hi');
		return false;
	}
	
	target.siblings().removeClass('active');
	target.addClass('active');

	var ajaxUrl = $(this).attr('href');
	
	$.ajax({
		url: ajaxUrl,
		type: 'get',
		success: function(data) {
			
			$('div#goods_box>div#title_box>h2').text(data[0].gType);
			
			for ( var i = 0; i < data.length; i++ ) {
				
				var gNo = data[i].gNo;
				var gType = data[i].gType;
				var gName = data[i].gName;
				var gPrice = data[i].gPrice;
				var gContent = data[i].gContent;
				
				var parentSelector = 'div.goods:nth-child(' + Number(i+1) + ')';
				
				$(parentSelector + ' div.g_photo img').attr('src', 'images/items/' + gType.toLowerCase() + '/' +gNo + '_001.jpg');
				$(parentSelector + ' div.g_photo').attr('data-gno', gNo);
				$(parentSelector + ' div.g_info h4.g_category').text(gType);
				$(parentSelector + ' div.g_info h4.g_title').text(gName);
				$(parentSelector + ' div.g_info h4.g_title').attr('data-gno', gNo);
				$(parentSelector + ' div.g_info h4.g_price').text(gPrice+'원');
				$(parentSelector + ' div.g_info p.g_content').text(gContent);
				$(parentSelector + ' div.g_description p.g_content').text(gContent);
				$(parentSelector + ' div.g_description a.more_btn').attr('href', 'goods/goodsDetails?gno='+gNo);
			}
			
		},
		error: function(data) {}		
	});

});

$('div.g_photo, h4.g_title').on('click', function() {
	var gNo = $(this).attr('data-gNo');
	
	location.href = 'goods/goodsDetails?gno='+gNo;
});


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

$(document).ready(function() {
	setInterval(function() {$('i.slide-btn.slide-right').trigger('click');}, 3000);
});
</script>
</body>
</html>
