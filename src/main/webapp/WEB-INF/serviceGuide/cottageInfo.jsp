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
    <span>민박촌</span>
</div>
<div class="information">
    <h3 class="title">민박촌 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">하늘과 땅, 그리고 사람이 소통하는 태백산 자락에 위치한 휴식 공간</p>
        <p class="copy">태백산국립공원에서 여름에는 산에서 불어오는 시원한 바람을 느끼고, 겨울에는 태백산의 눈꽃 설경을 감상해 보세요.</p>
    </div>
    <div class="image-map">
        <img src="../../assets/img/sub/img-map4.png" usemap="#image-map4" class="img" alt="민박촌 지도">
        <map name="image-map4">
            <area target="_self" alt="태백산" title="태백산" href="#m4-1" coords="567,276,684,349" shape="rect" class="link">
        </map>
    </div>
    <div class="image-map-list">
        <a href="javascript:void(0);" id="m4-1" class="btn" onclick="goDetail('B22'); return false;">태백산</a>
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