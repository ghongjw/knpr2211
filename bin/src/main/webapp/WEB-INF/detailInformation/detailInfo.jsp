<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
<script>
	$('document').ready(function(){
		
	})
</script>
<%@ include file="../common/header.jsp" %>
<div class="yeobeck"></div>
<div class = "pageLocation">
    <span>홈</span>
    <span class="loca">이용안내</span>
    <span class="loca">${cat.getCategory1()}</span>
</div>
<div class = "detailInformation">
	<h3 class = "title">${cat.getCategory1()} 이용안내</h3>
	<div class = "serchBox">
	<select id="category2">
	<>
	</select>
	</div>
</div>
</body>
</html>