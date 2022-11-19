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
<%@ include file="../common/header.jsp" %>
<div class = "pageLocation">
    <span>홈</span>
    <span class="loca">이용안내</span>
    <span class="loca">생태탐방원</span>
    <span class="loca">프로그램</span>
    <div class="program">
    <h3 class="title">${detailInfo[0].nameCategory2} 생태탐방원 프로그램</h3>
    </div>
</div>


<%@ include file="../common/footer.jsp" %>
</body>
</html>