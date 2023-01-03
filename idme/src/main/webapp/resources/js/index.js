// 카테고리 메뉴 클릭 시
$('a.categories').on('click', function(e) {
	e.preventDefault();
	
	var target = $(this).parent();
	
	// 현재 이미 선택된 카테고리인 경우 return false
	if ( target.attr('class').indexOf('active') > 0 ) {
		return false;
	}
	
	// 현재 클릭한 카테고리 메뉴에만 active 클래스 부여
	target.siblings().removeClass('active');
	target.addClass('active');
	
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

// 상품 리스트 사진이나 상품명을 클릭하면 해당 상품 상세 페이지로 이동
$('div.g_photo, h4.g_title').on('click', function() {
	var gNo = $(this).attr('data-gNo');
	location.href = 'goods/goodsDetails?gno='+gNo;
});

// 슬라이드 버튼 클릭 시
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