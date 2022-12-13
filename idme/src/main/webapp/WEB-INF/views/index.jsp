<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>idme</title>

<style>
section {font-style : italic; color: white; text-align: center; margin: 0 0;}

h2 {margin: 0 0 !important;}

section#body_contents {background-color : #3AB2EC; height: 1500px;}
section#body_contents div#category {height: 3%; background-color: lightgray;}
section#body_contents div#slide_images {height: 30%;}
section#body_contents div#products {height: 67%; cursor: pointer;}
section#body_contents div#products:hover {background-color: #10A1E7;}
</style>

<script>
function productPage() {
	location.href = '/idme/product';
}
</script>

</head>
<body>
<%@ include file="includes/header.jsp" %>

<section id="body_contents">
	<div id="category">
		<h2>Category</h2>
	</div>

	<hr/>

	<div id="slide_images">
		<h2>Slide-Images</h2>
	</div>
	
	<div id="products" onclick="javascript:productPage()">
		<h2>Products</h2>
	</div>
</section>

<hr/>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
