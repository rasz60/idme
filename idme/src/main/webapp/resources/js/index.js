


function ran(){
	//⭐✰
	const r = Math.random() * 5 + 0 
	let s = '';
	for(let x=0;x<r;x++){
		  s+='⭐';
	}
	for(let y=5;y<r;y--){
		s+='✰';
	}
	return s;	
}

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