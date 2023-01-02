<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
section#footer {display: flex; justify-content: center; min-width: 1200px; height: 300px; text-align: center; border-top: 4px solid orange; margin-top: 50px; 	font-family: 'Gafata', sans-serif; color: #5C5C5C;}
div.footer_box {display: flex; width: 75%; height: 100%; padding-top: 30px;}
div.footer_logo {width: 20%;}
div.footer_content {display: flex; flex-wrap: wrap; width: 80%;}
div.footer_logo img {width: 100%; height: 100%; max-width: 130px; max-height: 55px;}
div.footer_content_top, div.footer_content_bottom {display: flex; width: 100%; height: 70%; padding-bottom: 30px; border-bottom: 1px solid lightgray;}
div.footer_content_col {width: 33%; text-align: left; font-style: normal;}
h4.footer_text_bold {font-size: 14px; color: #3F3F3F;}
.footer_text {margin: 2px 0; font-size: 13px;}
.footer_small_text {margin: 1px 0; font-size: 11px;}
ul.follow_table {display: flex; justify-content: space-around; flex-wrap: wrap; list-style: none; padding: 0 0 ; width: 90%;}
li.sns_col {width: 15%; padding: 5px;}
li.follow_bottom_col {width: 45%; height: 100px; padding: 5px;}
li.sns_col img, li.follow_bottom_col img {width: 100%; height: 100%;}
div.footer_content_bottom div.footer_content_col {display: flex; flex-wrap: wrap; padding: 10px;}
img.bottom_logo {width: 40px; height: 40px;}
div.footer_content_subcol_title {width: 15%; margin-right: 10px;}
div.footer_content_subcol_content {width: 80%;}
</style>

<section id="footer">
	<div class="footer_box">
		<div class="footer_logo">
			<img id="footer_logo" src="/idme/images/logo/idme3.png"/>
		</div>
		<div class="footer_content">
			<div class="footer_content_top">
				<div class="footer_content_col">
					<h4 class="footer_text_bold">(주)백패커</h4>
					<p class="footer_text">대표이사 : 김진웅</p>
					<p class="footer_text">서울특별시 마포구 U+ 상암사옥 12층</p>
					<p class="footer_text">사업자 등록번호 : 107-87-83297</p>
					<p class="footer_text">통신판매업신고 : 2015-서울마포-0440</p>	
					<p class="footer_text">호스팅서비스 제공자 : AWS WEB Service, Inc</p>
					<br/>
					<p class="footer_small_text">아이디엠이는 통신판매중개자이며 통신판매의 당사자가 아닙니다.</p>
					<p class="footer_small_text">따라서 아이디어스는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
					<br/>
					<p class="footer_small_text">Copyright © 2022 Backpackr All right reserved.</p>
				</div>
				
				<div class="footer_content_col">
					<h4 class="footer_text_bold">고객센터 <span class="footer_small_text">(평일 오전 10시 ~ 오후 6시)</span></h4>
					<p class="footer_text">카카오톡&nbsp;&nbsp;&nbsp;&nbsp;<span class="footer_text">아이디엠이</span></p>
					<p class="footer_text">대표번호&nbsp;&nbsp;&nbsp;&nbsp;<span class="footer_text">1668-3651</span></p>
					<p class="footer_text">메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="footer_text">support@backpac.kr</span></p>
					<p class="footer_text">제휴문의&nbsp;&nbsp;&nbsp;&nbsp;<span class="footer_text">biz@backpac.kr</span></p>
					<br/><br/>
					<p class="footer_small_text">아이디엠이 이용 중 궁금하신 점이 있으신가요?</p>
					<p class="footer_small_text">메일 또는 플러스친구 `아이디어스`로 연락해주세요.</p>
					<p class="footer_small_text">최선을 다해 도와드리겠습니다.</p>
				</div>
				
				<div class="footer_content_col">
					<h4 class="footer_text_bold">Follow Us</h4>
					<ul class="follow_table">
						<li class="sns_col">
							<img src="/idme/images/logo/facebookLogo.png"/>
						</li>
						<li class="sns_col">
							<img src="/idme/images/logo/instagramLogo.png"/>
						</li>
						<li class="sns_col">
							<img src="/idme/images/logo/naverBlogLogo.png"/>
						</li>
						<li class="sns_col">
							<img src="/idme/images/logo/naverLineLogo.png"/>
						</li>
						<li class="sns_col">
							<img src="/idme/images/logo/twitterLogo.png"/>
						</li>
						<li class="follow_bottom_col">
							<img src="/idme/images/icons/footer_img01.png"/>
						</li>
						<li class="follow_bottom_col">
							<img src="/idme/images/icons/footer_img02.png" />
						</li>
					</ul>
				</div>
			</div>
			
			<div class="footer_content_bottom">
				<div class="footer_content_col">
					<div class="footer_content_subcol_title">
						<img class="bottom_logo" src="/idme/images/icons/footer_img03.png" alt="" />
					</div>
					
					<div class="footer_content_subcol_content">
						<p class="footer_small_text">[인증범위] 온라인 마켓 플랫폼 운영(아이디어스)</p>
						<p class="footer_small_text">[유효기간] 2020.11.18 - 2023.11.17</p>
					</div>
				</div>
				
				<div class="footer_content_col">
					<div class="footer_content_subcol_title">
						<img class="bottom_logo" src="/idme/images/icons/footer_img04.png" alt="" />
					</div>
					
					<div class="footer_content_subcol_content">
						<p class="footer_small_text">고객님은 현금 등으로 결제시 당사에서 가입한 구매안전서비스를 이용하실 수 있습니다.</p>
					</div>
				</div>
								
				<div class="footer_content_col">
					
				</div>
			</div>
		</div>
	</div>
	
	
	
</section>