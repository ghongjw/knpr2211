<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<meta name="viewport" content="width=device-width">
	

	<link rel="stylesheet" href="assets/style/commonb07b.css?ver1">

	<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/swiper.js"></script>
	<script src="assets/js/lib/datepicker.min.js"></script>
	<script src="assets/js/lib/jquery.fs.zoomer.min.js"></script>
	<script src="assets/js/lib/jquery.rwdImageMaps.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	<script src="assets/js/common9b00.js?ver4"></script>

<body>
	<div id="wrap" class="sub">

<%@ include file="../common/header.jsp" %>
			<div id="container">
				

<script>

    $(function(){
        $('img[usemap]').rwdImageMaps();
        $(".image-map .link").off().on("click", function (e) {
            e.preventDefault();
            var activeTab = $(this).attr("href");
            $(".image-map-list .btn").removeClass("is-active")
            $(activeTab).addClass("is-active");
            $(activeTab).focus();
        })
    })

    let goDetail = function(parkId){
        $("#parkId").val(parkId);
        $("#contentsForm").submit();
    }
</script>
<div class="page-location">
    <span>홈</span>
    <span>이용안내</span>
    <span>야영장</span>
</div>
<div class="information">
    <h3 class="title">야영장 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">소중한 사람들과 함께 마음의 여유와 캠핑을 즐기는 공간</p>
        <p class="copy">우리나라 대표 휴양공간인 국립공원 야영장에서 사랑하는 사람들과 함께 야영을 하며, 계절에 따라 변화하는 자연의 풍광을 만끽하세요.</p>
    </div>
    <div class="image-map">
        <img src="../../assets/img/sub/img-map1.png" usemap="#image-map1" class="img" alt="야영장 지도">
        <map name="image-map1">
            <area target="_self" alt="설악산" title="설악산" href="#m1-1" coords="491,36,606,111" shape="rect" class="link">
            <area target="_self" alt="오대산" title="오대산" href="#m1-2" coords="549,134,664,208" shape="rect" class="link">
            <area target="_self" alt="북한산" title="북한산" href="#m1-3" coords="181,163,294,233" shape="rect" class="link">
            <area target="_self" alt="치악산" title="치악산" href="#m1-4" coords="413,226,527,287" shape="rect" class="link">
            <area target="_self" alt="태안해안" title="태안해안" href="#m1-5" coords="2,341,142,415" shape="rect" class="link">
            <area target="_self" alt="월악산" title="월악산" href="#m1-6" coords="412,331,519,405" shape="rect" class="link">
            <area target="_self" alt="소백산" title="소백산" href="#m1-7" coords="520,289,624,358" shape="rect" class="link">
            <area target="_self" alt="태백산" title="태백산" href="#m1-8" coords="625,275,732,349" shape="rect" class="link">
            
            <area target="_self" alt="계룡산" title="계룡산" href="#m1-10" coords="254,442,365,515" shape="rect" class="link">
            <area target="_self" alt="덕유산" title="덕유산" href="#m1-11" coords="356,524,469,572" shape="rect" class="link">
            <area target="_self" alt="변산반도" title="변산반도" href="#m1-13" coords="61,598,202,657" shape="rect" class="link">
            <area target="_self" alt="가야산" title="가야산" href="#m1-14" coords="432,572,548,644" shape="rect" class="link">
            <area target="_self" alt="내장산" title="내장산" href="#m1-16" coords="204,637,306,707" shape="rect" class="link">
            <area target="_self" alt="지리산" title="지리산" href="#m1-17" coords="321,679,432,752" shape="rect" class="link">
            <area target="_self" alt="무등산" title="무등산" href="#m1-18" coords="204,719,319,789" shape="rect" class="link">
            <area target="_self" alt="월출산" title="월출산" href="#m1-19" coords="148,805,265,874" shape="rect" class="link">
            <area target="_self" alt="한려해상" title="한려해상" href="#m1-20" coords="456,768,596,840" shape="rect" class="link">
            <area target="_self" alt="다도해해상" title="다도해해상" href="#m1-21" coords="23,876,191,955" shape="rect" class="link">
            <area target="_self" alt="주왕산" title="주왕산" href="#m1-12" coords="657,429,770,501" shape="rect" class="link">
        </map>
    </div>
    <div class="image-map-list">
        <a href="javascript:void(0);" id="m1-14" class="btn" onclick="goDetail('B13'); return false;">가야산</a>
        <a href="javascript:void(0);" id="m1-10" class="btn" onclick="goDetail('B16'); return false;">계룡산</a>
        <a href="javascript:void(0);" id="m1-16" class="btn" onclick="goDetail('B04'); return false;">내장산</a>
        <a href="javascript:void(0);" id="m1-21" class="btn" onclick="goDetail('B09'); return false;">다도해해상</a>
        <a href="javascript:void(0);" id="m1-11" class="btn" onclick="goDetail('B05'); return false;">덕유산</a>
        <a href="javascript:void(0);" id="m1-18" class="btn" onclick="goDetail('B17'); return false;">무등산</a>
        <a href="javascript:void(0);" id="m1-13" class="btn" onclick="goDetail('B18'); return false;">변산반도</a>
        <a href="javascript:void(0);" id="m1-3" class="btn" onclick="goDetail('B14'); return false;">북한산</a>
        <a href="javascript:void(0);" id="m1-1" class="btn" onclick="goDetail('B03'); return false;">설악산</a>
        <a href="javascript:void(0);" id="m1-7" class="btn" onclick="goDetail('B12'); return false;">소백산</a>
        <a href="javascript:void(0);" id="m1-9" class="btn" onclick="goDetail('B19'); return false;">속리산</a>
        <a href="javascript:void(0);" id="m1-2" class="btn" onclick="goDetail('B06'); return false;">오대산</a>
        <a href="javascript:void(0);" id="m1-6" class="btn" onclick="goDetail('B11'); return false;">월악산</a>
        <a href="javascript:void(0);" id="m1-19" class="btn" onclick="goDetail('B20'); return false;">월출산</a>
        <a href="javascript:void(0);" id="m1-12" class="btn" onclick="goDetail('B07'); return false;">주왕산</a>
        <a href="javascript:void(0);" id="m1-17" class="btn" onclick="goDetail('B01'); return false;">지리산</a>
        <a href="javascript:void(0);" id="m1-4" class="btn" onclick="goDetail('B10'); return false;">치악산</a>
        
        <a href="javascript:void(0);" id="m1-5" class="btn" onclick="goDetail('B08'); return false;">태안해안</a>
        <a href="javascript:void(0);" id="m1-20" class="btn" onclick="goDetail('B02'); return false;">한려해상</a>
    </div>
</div>
<form id="contentsForm" action="goDetail">
    <input type="hidden" id="parkId" name="parkId" value="">
</form>
			</div>
			
<%@ include file="../common/footer.jsp" %>


<div class="modal-popup small" id="confirmPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="confirmTitle"></strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('confirmPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="confirmSubTitle"></strong>
                <p class="copy-mid" id="confirmContent"></p>
                <p class="copy-sm" id="confirmSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-cancel forMypageClass" onclick="closePopup('confirmPop');">취소</button>
                <button class="btn btn-confirm is-active" id="btn-confirm">확인</button>
            </div>
        </div>
    </div>
</div>


<div class="modal-popup small" id="alertPop">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="alertTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('alertPop');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container">
            <div class="center">
                <i class="icon-error"></i>
                <strong class="title-1" id="alertSubTitle"></strong>
                <p class="copy-mid" id="alertContent"></p>
                <p class="copy-sm" id="alertSubContent"></p>
            </div>
            <div class="btn-area">
                <button class="btn btn-confirm is-active" onclick="closePopup('alertPop');">확인</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-popup small" id="loginPopup">
    <div class="popup-wrap">
        <div class="popup-head">
            <strong class="popup-title" id="loginTitle">로그인</strong>
            <button type="button" class="btn-close" title="닫기" onclick="closePopup('loginPopup');">
                <i class="icon-close"></i>
            </button>
        </div>
        <div class="popup-container" id="loginPopupDiv">
        </div>
    </div>
</div>
<!-- 아이핀 가상주민번호 서비스 팝업 호출 form -->
<form name="form_ipin" id="form_ipin" method="post">
    <!-- 요청모드 (필수 데이터) -->
    <input type="hidden" name="m" value="pubmain">
    <!-- 인증요청 암호화 데이터 -->
    <input type="hidden" name="enc_data" id="enc_data" value="">
</form>
<!-- 본인인증 서비스 팝업을 호출하기 위해서는 다음과 같은 form이 필요합니다. -->
<form name="form_chk" id="form_chk" method="post">
    <!-- 필수 데이타로, 누락하시면 안됩니다. -->
    <input type="hidden" name="m" value="checkplusService">
    <!-- 인증요청 암호화 데이터 -->
    <input type="hidden" name="EncodeData" id="EncodeData" value="">
</form>
	</div>
	<img id="loadingImage" src="../../assets/img/preloader.gif" alt="로딩이미지" style="position: absolute; left: 924.5px; top: 539.5px; z-index: 100000; display: none;">
<script>
	$(function(){
		let responseMessage = "";
		if(responseMessage != ""){
			toastrMsg(responseMessage);
		}
		let retChk = "";
		if(retChk == "Y"){
			alert(responseMessage);
			history.back();
		}
	})
</script>
</body>
</html>