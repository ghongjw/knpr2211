<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">

	<link rel="stylesheet" href="../../assets/style/commonb07b.css?ver1">

	<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="../../assets/js/lib/swiper.js"></script>
	<script src="../../assets/js/lib/datepicker.min.js"></script>
	<script src="../../assets/js/lib/jquery.fs.zoomer.min.js"></script>
	<script src="../../assets/js/lib/jquery.rwdImageMaps.min.js"></script>
	<script src="../../assets/js/lib/toastr.min.js"></script>
	<script src="../../assets/js/scripts.js"></script>
	<script src="../../assets/js/common9b00.js?ver4"></script>
</head>
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
    <span>대피소</span>
</div>
<div class="information">
    <h3 class="title">대피소 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">구름도 바람도 잠시 머무르는 작은 쉼터</p>
        <p class="copy">긴 길 끝에 지친 몸을 쉬어갈 수 있는 안전시설인 국립공원 대피소에서 건강 상태와 이동 동선을 체크하고, 안전한 산행을 위해 휴식을 취해보세요.</p>
    </div>
    <div class="image-map">
        <img src="../../assets/img/sub/img-map2.png" usemap="#image-map2" class="img" alt="대피소 지도">
        <map name="image-map2">
            <area target="_self" alt="덕유산" title="덕유산" href="#m2-1" coords="304,524,423,598" shape="rect" class="link">
            <area target="_self" alt="설악산" title="설악산" href="#m2-2" coords="440,36,555,108" shape="rect" class="link">
            <area target="_self" alt="소백산" title="소백산" href="#m2-3" coords="461,289,575,362" shape="rect" class="link">
            <area target="_self" alt="지리산" title="지리산" href="#m2-4" coords="270,680,384,754" shape="rect" class="link">
        </map>
    </div>
    <div class="image-map-list">
        <a href="javascript:void(0);" id="m2-4" class="btn" onclick="goDetail('B01'); return false;">지리산</a>
        <a href="javascript:void(0);" id="m2-2" class="btn" onclick="goDetail('B03'); return false;">설악산</a>
        <a href="javascript:void(0);" id="m2-1" class="btn" onclick="goDetail('B05'); return false;">덕유산</a>
        <a href="javascript:void(0);" id="m2-3" class="btn" onclick="goDetail('B12'); return false;">소백산</a>
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