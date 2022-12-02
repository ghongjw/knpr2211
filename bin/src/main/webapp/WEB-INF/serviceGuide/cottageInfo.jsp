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

<script type="text/javascript">
	$(function(){
	    $('img[usemap]').rwdImageMaps();
	    $(".information .link").off().on("click", function (e) {
	        e.preventDefault();
	        var activeTab = $(this).attr("href");
	        $(".imageMapList .btn").removeClass("is-active")
	        $(activeTab).addClass("is-active");
	        $(activeTab).focus();
	    })
	})
	 let gotoInfo = function(parkId){
	    	$("#parkId").val(parkId);
	    	$("#contentsForm").submit();
	 }

</script>
<div class="yeobeck"></div>
<div class = "pageLocation">
    <span>홈</span>
    <span class="loca">이용안내</span>
    <span class="loca">민속촌</span>
</div>



<div class="information">
    <h3 class="title">민속촌 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">하늘과 땅, 그리고 사람이 소통하는 태백산 자락에 위치한 휴식 공간</p>
        <p class="copy">태백산국립공원에서 여름에는 산에서 불어오는 시원한 바람을 느끼고, 겨울에는 태백산의 눈꽃 설경을 감상해 보세요.</p>
    </div>
    <div class="imageMap">
	<img src="../../assets/img/sub/img-map4.png" usemap="#image-map1" class="map" alt="야영장 지도">
		<map name = "image-map1">
			<area shape="rect" alt="태백산" title="태백산" coords="622,278,730,332" href="#D01" class="link"/>
		</map>
		</div>
		<div class = "imageMapList">
			<a href = "javascript:void(0);" class = "btn" id= "D01" onclick = "gotoInfo('D01')">태백산</a>
		</div>
		<form action = "detailInfo" method="get" id="contentsForm">
			<input type="hidden" id="parkId" name="parkId" value="">
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>