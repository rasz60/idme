<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- google custom font start --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff&family=Gafata&family=Jua&display=swap" rel="stylesheet">
<%-- google custom font end --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><%-- jquery --%>
<script src="https://kit.fontawesome.com/b4e02812b5.js" crossorigin="anonymous"></script><%-- fontawesome --%>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/index.css" />

<script type="text/javascript" src="js/header.js"></script>
<title>idme</title>
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

<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
