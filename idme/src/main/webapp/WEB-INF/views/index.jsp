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
<script type="text/javascript" src="js/header.js"></script>

<title>idme</title>
</head>
<body>
<%@ include file="includes/header.jsp" %>

<section id="body_contents">
	<div id="category">
		<ul id="category">
			<c:forEach begin="0" end="${category.size()}" items="${category }" var="category">
				<li class="category_li">
					<a class="categories" href="ajax/getGoodsList?category=${category}" data-item="${category }">${category }</a>
				</li> 
			</c:forEach>
			<li>
		</ul>
		
	</div>

	<hr/>

	<div id="slide_images">
		<i class="fa-solid fa-angle-left btn slide-btn slide-left" onclick="prevSlide()"></i>
		<ul id="img_slider">
			<li class="slide slide1 active" data-index=0><img src="images/slides/slides1.jpg" /></li>
			<li class="slide slide2" data-index=1><img src="images/slides/slides2.jpg" /></li>
			<li class="slide slide3" data-index=2><img src="images/slides/slides3.jpg" /></li>
			<li class="slide slide4" data-index=3><img src="images/slides/slides4.jpg" /></li>
			<li class="slide slide5" data-index=4><img src="images/slides/slides5.jpg" /></li>
			<li class="slide slide6" data-index=5><img src="images/slides/slides6.jpg" /></li>
			<li class="slide slide7" data-index=5><img src="images/slides/slides7.jpg" /></li>
		</ul>
		<i class="fa-solid fa-angle-right btn slide-btn slide-right" onclick="nextSlide()"></i>
	</div>
		<div class="pagination"></div>
	
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
<script type="text/javascript">

	//기본 셋팅
	let current = 1;
	const prevBtn = document.querySelector('.slide-left');
	const nextBtn = document.querySelector('.slide-right');
	const slides = document.querySelectorAll('.slide');
	

	

	
	function disableBtn() {
		  pagiBtns.forEach(btn => {
		    btn.style.pointerEvents = 'none';
		    setTimeout(function () {
		      btn.style.pointerEvents = 'auto';
		    }, 500)
		  })
		}
	
	// pagination add html
	const pagination = document.querySelector('.pagination');
	slides.forEach((el, idx) => {
	  const addPagiEl = document.createElement('button');
	  addPagiEl.innerHTML = ``;
	  addPagiEl.classList = `pagi pagi${idx + 1}`
	  pagination.append(addPagiEl)
	})
	
	//pagination Nav
	const pagiBtns = document.querySelectorAll('.pagi');
	pagiBtns[0].classList.add('active');
	pagiBtns.forEach((dots, idx) => {
	  dots.addEventListener('click', function () {
	    for (removeSlide of slides)
	      removeSlide.classList.remove('active');
	    slides[idx].classList.add('active');
	    // current값 재할당
	    current = idx + 1;
	    activePagination()
	  })
	})
	
	function activePagination() {
	  for (pagiNavs of pagiBtns)
	    pagiNavs.classList.remove('active');
	  pagiBtns[current - 1].classList.add('active');
	}
	
	//prev
	function prevSlide(){
		disableBtn()
		let target = document.querySelector(`.slide${current}`);
		target.classList.remove("active");
		current = current - 1 > 0 ? current - 1 : slides.length;
		target = document.querySelector(`.slide${current}`);
		target.classList.add("active");
		activePagination()
		console.log(current);
	}

	//next
	function nextSlide(){
		disableBtn()
		let target = document.querySelector(`.slide${current}`);
		target.classList.remove("active");
		current = current < slides.length ? current + 1 : 1;
		target = document.querySelector(`.slide${current}`);
		target.classList.add("active");
		activePagination()
		console.log(current);
	}
	//호출
	prevBtn.addEventListener('click', prevSlide);
	nextBtn.addEventListner('click', nextSlide);
	
	// Ajax
	// 카테고리 메뉴 클릭 시
	$('.categories').on('click', function(e) {
		e.preventDefault();
		
		let target2 = $(this).parent();
		
		// 현재 이미 선택된 카테고리인 경우 return false
		if ( target2.attr('class').indexOf('active') > 0 ) {
			return false;
		}
		
		// 현재 클릭한 카테고리 메뉴에만 active 클래스 부여
		target2.siblings().removeClass('active');
		target2.addClass('active');
		
		var ajaxUrl = $(this).attr('href');
		
		// 해당되는 카테고리의 상품리스트 select ajax
		$.ajax({
			url: ajaxUrl,
			type: 'get',
			success: function(data) {
				// 상품 리스트 상단 타이틀 문구를 해당 카테고리 명으로 변경
				$('div#goods_box>div#title_box>h2').text(data[0].gType);
				
				// select된 데이터로 상품 리스트 값 변경
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
	
</script>
</body>
</html>
