<style>
section#header {background-color : #E6B7F7; display: flex; justify-content: space-around; height: 50px;}
div#logo {cursor: pointer;}
img#logo {width: 100%; height: 100%;}
</style>

<script>
function mainPage() {
	location.href = '/idme';
}
</script>

<section id="header">
	<div id="logo" onclick="javascript:mainPage();">
		<img id="logo" src="images/logo/idme3.png"/>
	</div>
	
	<div id="search">
		<div id="input_box">
			<input type="search" id="s_input" placeholder="Search" />
			<i class="fa-solid fa-magnifying-glass btn search-btn"></i>
		</div>
	</div>
	
	<div id="login_input_box">
		<form id="login_from" method="post" action="/idme/login">
			<input type="hidden" name="returnUrl" value="/" />
			<input type="text" id="id_input" name="id" class="login_input" placeholder="ID" />
			<input type="password" id="pwd_input" name="pwd" class="login_input" placeholder="PASSWORD" />
		</form>
				<i class="fa-solid fa-arrow-right-to-bracket btn signin-btn" onclick="fnLogin('signin');"></i>
<!-- 				<i class="fa-regular fa-circle-xmark btn login-close-btn" onclick="fnLogin('close');"></i> -->
	</div>
</section>