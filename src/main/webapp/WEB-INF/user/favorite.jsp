<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
<script src="../../assets/js/lib/swiper.js"></script>
<link rel="shortcut icon" href="#">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5473282e90dafe0fc8b497c28d5feec9"></script>
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="assets/style/infomations.css">
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="detailInfo">
		<div class="pageLocation">
			<span>홈</span> <span class="loca">마이페이지</span> <span class="loca">즐겨찾기</span>
		</div>
		
			<div class="detailInformation">
				<h3 class="title">즐겨찾기</h3>
			</div>
			<c:forEach var = "favorite" items = "${favorites }">
		${favorite.place }
		</c:forEach>
		

</div>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>