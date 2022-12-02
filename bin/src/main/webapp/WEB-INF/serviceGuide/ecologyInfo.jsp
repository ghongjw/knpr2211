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
    <span class="loca">생태탐방원</span>
</div>



<div class="information">
    <h3 class="title">생태탐방원 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">자연과 사람이 서로 교감하고 이해하는 체험</p>
        <p class="copy">자연과 문화를 함께 즐기고 배우는 생태복지 시설인 생태탐방원에서 체류형 특화프로그램과 숙박, 교육과 회의시설을 이용해보세요.
</p>
    </div>
    <div class="imageMap">
	<img src="../../assets/img/sub/img-map3.png" usemap="#image-map1" class="map" alt="야영장 지도">
		<map name = "image-map1">
		<area shape="rect" alt="가야산" title="가야산" coords="385,572,494,628" href="#C01" class="link" />
			<area shape="rect" alt="내장산" title="내장산" coords="147,635,255,696" href="#C02" class="link" />
			<area shape="rect" alt="무등산" title="무등산" coords="155,717,264,774" href="#C03" class="link"/>
			<area shape="rect" alt="설악산" title="설악산" coords="443,37,551,91" href="#C04" class="link"/>
			<area shape="rect" alt="소백산" title="소백산" coords="464,289,572,343" href="#C05" class="link"/>
			<area shape="rect" alt="지리산" title="지리산" coords="270,682,382,738" href="#C06" class="link"/>			
			<area shape="rect" alt="한려해상" title="한려해상" coords="405,766,545,823" href="#C07" class="link"/>
			<area shape="rect" alt="북한산" title="북한산" coords="131,163,245,217" href="#C08" class="link"/>	
		</map>
		</div>
		<div class = "imageMapList">
			<a href = "javascript:void(0);" class = "btn" id= "C01" onclick = "gotoInfo('C01')">가야산</a>
			<a href = "javascript:void(0);" class = "btn" id= "C02" onclick = "gotoInfo('C02')">내장산</a>
			<a href = "javascript:void(0);" class = "btn" id= "C03" onclick = "gotoInfo('C03')">무등산</a>
			<a href = "javascript:void(0);" class = "btn" id= "C04" onclick = "gotoInfo('C04')">설악산</a>
			<a href = "javascript:void(0);" class = "btn" id= "C05" onclick = "gotoInfo('C05')">소백산</a>
			<a href = "javascript:void(0);" class = "btn" id= "C06" onclick = "gotoInfo('C06')">지리산</a>
			<a href = "javascript:void(0);" class = "btn" id= "C07" onclick = "gotoInfo('C07')">한려해상</a>
			<a href = "javascript:void(0);" class = "btn" id= "C08" onclick = "gotoInfo('C08')">북한산</a>
		
		
		</div>
		<form action = "detailInfo" method="get" id="contentsForm">
			<input type="hidden" id="parkId" name="parkId" value="">
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>