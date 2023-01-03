// image slide 조작 메서드
function fnImgSlideCtrl(nextSlide) {
	var width = $('li.slide')[0].clientWidth;
	$('li.slide').removeClass('active');
	$('li.slide').eq(nextSlide).addClass('active');
	$('ul#img_slider_ul').animate({left: -width*nextSlide}, 'slow');
}

// 상품 개수 선택 시 가격, 적립 포인트 계산하여 출력
$('select#g_option_select').on('change', function() {
	var price = '<c:out value="${goods.gPrice }" />';
	var cnt = $(this).val();
	// 상품 가격과 적립 예상 포인트를 계산하여 $$$,$$$,$$$ 형식으로 표시
	var totPriceStr = Number(price*cnt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	var totPointStr = Number(Number(price*cnt)*0.015).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	
	$('h4.tot_price').text(totPriceStr + ' 원');
	$('h4.tot_point').text('최대 ' + totPointStr + ' P');	
})

// 슬라이드 이동 버튼 클릭 시
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
	// 다음 인덱스로 slide 이동
	fnImgSlideCtrl(nextSlide);
})

// 미리보기 이미지 클릭 시 해당 이미지로 슬라이드 이동
$('li.shortview').on('click', function() {
	var nextSlide = $(this).attr('data-index');
	fnImgSlideCtrl(nextSlide);
})

// scroll 위치에 따라 top_right div 조정
$(window).on('scroll', function() {
	
	var currScroll = window.scrollY;
	var maxScroll = $('div#content_top')[0].clientHeight;
	
	// 현재 스크롤이 70보다 크거나 같고, content_top div height보다 작은 경우 스크롤에 따라 움직임 
	if ( currScroll >= 70 && currScroll < maxScroll ) {
		$('div#top_right').css({'position':'relative', 'top': Number(currScroll-70)});
	}
	// 현재 스크롤이 content_top div height보다 크거나 같은 경우 maxScroll에 위치 고정
	else if ( currScroll >= maxScroll ) {
		$('div#top_right').css({'top': Number(maxScroll)});
	}
	// 현재 스크롤이 70보다 작은 경우 원래 위치로 변경
	else {
		$('div#top_right').css({'position':''})
	}	
})

$(function() {
	// 3초에 한 번 씩 슬라이드 이동
	setInterval(function() {$('i.slide-btn.slide-right').trigger('click');}, 3000);
});