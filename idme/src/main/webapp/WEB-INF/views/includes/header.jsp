<style>
section#header {background-color : #ECA03A; display: flex; justify-content: space-around; height: 50px;}
div#logo {cursor: pointer;}
</style>

<script>
function mainPage() {
	location.href = '/idme';
}
</script>

<section id="header">
	<div id="logo" onclick="javascript:mainPage();">
		<h2>Logo</h2>
	</div>
	
	<div id="search">
		<h2>Search-input</h2>
	</div>
	
	<div id="login">
		<h2>Login/User-info</h2>
	</div>
</section>