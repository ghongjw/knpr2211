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
<div class="detailInfoSearch">
<div class = "pageLocation">
    <span>홈</span>
    <span class="loca">이용안내</span>
    <span class="loca">대피소</span>
</div>
<div class="information">
    <h3 class="title">대피소 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">구름도 바람도 잠시 머무르는 작은 쉼터</p>
        <p class="copy">긴 길 끝에 지친 몸을 쉬어갈 수 있는 안전시설인 국립공원 대피소에서 건강 상태와 이동 동선을 체크하고, 안전한 산행을 위해 휴식을 취해보세요.</p>
    </div>
    <div class="imageMap">
	<img src="../../assets/img/sub/img-map2.png" usemap="#image-map1" class="map" alt="야영장 지도">
		<map name = "image-map1">
			<area shape="rect" alt="덕유산" title="덕유산" coords="356,525,468,571" href="#B01" class="link"/>
			<area shape="rect" alt="설악산" title="설악산" coords="493,37,601,91" href="#B02" class="link"/>
			<area shape="rect" alt="소백산" title="소백산" coords="514,289,622,343" href="#B03" class="link"/>
			<area shape="rect" alt="지리산" title="지리산" coords="320,682,432,738" href="#B04" class="link"/>			
		</map>
		</div>
		<div class = "imageMapList">
			<a href = "javascript:void(0);" class = "btn" id= "B01" onclick = "gotoInfo('B01')">덕유산</a>
			<a href = "javascript:void(0);" class = "btn" id= "B02" onclick = "gotoInfo('B02')">설악산</a>
			<a href = "javascript:void(0);" class = "btn" id= "B03" onclick = "gotoInfo('B03')">소백산</a>
			<a href = "javascript:void(0);" class = "btn" id= "B04" onclick = "gotoInfo('B04')">지리산</a>
		</div>
		<form action = "detailInfo" method="get" id="contentsForm">
			<input type="hidden" id="parkId" name="parkId" value="">
		</form>
	</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>
