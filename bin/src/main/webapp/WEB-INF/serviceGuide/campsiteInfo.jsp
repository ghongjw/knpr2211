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
    <span class="loca">야영장</span>
</div>
<div class="information">
    <h3 class="title">야영장 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">소중한 사람들과 함께 마음의 여유와 캠핑을 즐기는 공간</p>
        <p class="copy">우리나라 대표 휴양공간인 국립공원 야영장에서 사랑하는 사람들과 함께 야영을 하며, 계절에 따라 변화하는 자연의 풍광을 만끽하세요.</p>
    </div>
    <div class="imageMap">
	<img src="../../assets/img/sub/img-map1.png" usemap="#image-map1" class="map" alt="야영장 지도">
		<map name = "image-map1">
			<area shape="rect" alt="가야산" title="가야산" coords="435,572,544,628" href="#A01" class="link" />
			<area shape="rect" alt="계룡산" title="계룡산" coords="253,440,365,500" href="#A02" class="link" />
			<area shape="rect" alt="내장산" title="내장산" coords="197,635,305,696" href="#A03" class="link" />
			<area shape="rect" alt="다도해해상" title="다도해해상" coords="25,872,190,929" href="#A04" class="link"/>
			<area shape="rect" alt="덕유산" title="덕유산" coords="356,525,468,571" href="#A05" class="link"/>
			<area shape="rect" alt="무등산" title="무등산" coords="205,717,314,774" href="#A06" class="link"/>
			<area shape="rect" alt="변산반도" title="변산반도" coords="62,602,192,653" href="#A07" class="link"/>
			<area shape="rect" alt="설악산" title="설악산" coords="493,37,601,91" href="#A08" class="link"/>
			<area shape="rect" alt="소백산" title="소백산" coords="514,289,622,343" href="#A09" class="link"/>
			<area shape="rect" alt="오대산" title="오대산" coords="549,131,660,192" href="#A10" class="link"/>
			<area shape="rect" alt="월악산" title="월악산" coords="418,333,526,387" href="#A11" class="link"/>
			<area shape="rect" alt="월출산" title="월출산" coords="145,803,260,860" href="#A12" class="link"/>
			<area shape="rect" alt="주왕산" title="주왕산" coords="656,427,768,486" href="#A13" class="link"/>
			<area shape="rect" alt="지리산" title="지리산" coords="320,682,432,738" href="#A14" class="link"/>
			<area shape="rect" alt="치악산" title="치악산" coords="413,226,526,279" href="#A15" class="link"/>
			<area shape="rect" alt="태백산" title="태백산" coords="622,278,730,332" href="#A16" class="link"/>
			<area shape="rect" alt="태안해안" title="태안해안" coords="0,340,141,400" href="#A17" class="link"/>
			<area shape="rect" alt="한려해상" title="한려해상" coords="455,766,595,823" href="#A18" class="link"/>
<!-- 			<area shape="rect" alt="북한산" title="북한산" coords="181,163,295,217" href="#A19" class="link"/> -->
<!-- 			<area shape="rect" alt="속리산" title="속리산" coords="369,407,480,464" href="#A20" class="link"/> -->
		</map>
		</div>
		<div class = "imageMapList">
			<a href = "javascript:void(0);" class = "btn" id= "A01" onclick = "gotoInfo('A01')">가야산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A02" onclick = "gotoInfo('A02')">계룡산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A03" onclick = "gotoInfo('A03')">내장산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A04" onclick = "gotoInfo('A04')">다도해해상</a>
			<a href = "javascript:void(0);" class = "btn" id= "A05" onclick = "gotoInfo('A05')">덕유산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A06" onclick = "gotoInfo('A06')">무등산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A07" onclick = "gotoInfo('A07')">변산반도</a>
			<a href = "javascript:void(0);" class = "btn" id= "A08" onclick = "gotoInfo('A08')">설악산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A09" onclick = "gotoInfo('A09')">소백산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A10" onclick = "gotoInfo('A10')">오대산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A11" onclick = "gotoInfo('A11')">월악산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A12" onclick = "gotoInfo('A12')">월출산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A13" onclick = "gotoInfo('A13')">주왕산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A14" onclick = "gotoInfo('A14')">지리산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A15" onclick = "gotoInfo('A15')">치악산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A16" onclick = "gotoInfo('A16')">태백산</a>
			<a href = "javascript:void(0);" class = "btn" id= "A17" onclick = "gotoInfo('A17')">태안해원</a>
			<a href = "javascript:void(0);" class = "btn" id= "A18" onclick = "gotoInfo('A18')">한려해상</a>
<!-- 			<a href = "javascript:void(0);" class = "btn" id= "A19" onclick = "gotoInfo('A19')">북한산</a> -->
<!-- 			<a href = "javascript:void(0);" class = "btn" id= "A20" onclick = "gotoInfo('A20')">속리산</a> -->
		</div>
		<form action = "detailInfo" method="get" id="contentsForm">
			<input type="hidden" id="parkId" name="parkId" value="">
		</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>