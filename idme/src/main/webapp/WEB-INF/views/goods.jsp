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
section {font-style : italic; color: black; text-align: center; margin: 0 0;}
h2 {margin: 0 0 !important;}
section#body_contents {background-color : #3AB2EC; height: 1500px;}
section#body_contents div#category {height: 2%;}
section#body_contents div#slide_images {height: 30%;}
section#body_contents div#products {height: 60%;}
</style>

</head>
<body>
<%@ include file="includes/header.jsp" %>

<hr/>

<section id="body_contents">
	<div>
		<h2>G_NO : <c:out value="${goods.gNo }"/></h2>
		
		<h2>Name : <c:out value="${goods.gName }"/></h2>
		
		<h2>Content : <c:out value="${goods.gContent }"/></h2>
		
		<h2>Price : <c:out value="${goods.gPrice }"/></h2>
		
		<h2>Type : <c:out value="${goods.gType }"/></h2>
		
		<h2>Photo : <c:out value="${goods.gPhoto }"/></h2>
		
		<h2>M_NO : <c:out value="${goods.mNo }"/></h2>
	</div>
</section>

<hr/>

<%@ include file="includes/footer.jsp" %>
</body>
</html>
