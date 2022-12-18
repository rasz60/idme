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
		<h2>Search-input</h2>
	</div>
	
	<div id="login">
		<h2>Login/User-info</h2>
	</div>
</section>