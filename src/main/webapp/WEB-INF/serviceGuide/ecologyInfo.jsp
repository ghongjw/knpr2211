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

    let goDetail = function(deptId){
        $("#deptId").val(deptId);
        $("#contentsForm").submit();
    }
</script>
<div class="page-location">
    <span>홈</span>
    <span>이용안내</span>
    <span>생태탐방원</span>
</div>
<div class="information">
    <h3 class="title">생태탐방원 이용안내</h3>
    <div class="image-title">
        <p class="sub-title">자연과 사람이 서로 교감하고 이해하는 체험</p>
        <p class="copy">자연과 문화를 함께 즐기고 배우는 생태복지 시설인 생태탐방원에서 체류형 특화프로그램과 숙박, 교육과 회의시설을 이용해보세요.</p>
    </div>
    <div class="image-map">
        <img src="../../assets/img/sub/img-map3.png" usemap="#image-map3" class="img" alt="야영장 지도">
        <map name="image-map3">
            <area target="_self" alt="가야산" title="가야산" href="#m3-1" coords="379,580,498,642" shape="rect" class="link">
            <area target="_self" alt="내장산" title="내장산" href="#m3-2" coords="142,636,257,710" shape="rect" class="link">
            <area target="_self" alt="무등산" title="무등산" href="#m3-4" coords="154,718,268,791" shape="rect" class="link">
            <area target="_self" alt="북한산" title="북한산" href="#m3-5" coords="130,163,246,235" shape="rect" class="link">
            <area target="_self" alt="설악산" title="설악산" href="#m3-6" coords="440,34,555,111" shape="rect" class="link">
            <area target="_self" alt="소백산" title="소백산" href="#m3-7" coords="461,287,576,360" shape="rect" class="link">
            <area target="_self" alt="지리산" title="지리산" href="#m3-8" coords="270,679,385,752" shape="rect" class="link">
            <area target="_self" alt="한려해상" title="한려해상" href="#m3-9" coords="405,766,547,840" shape="rect" class="link">
        </map>
    </div>
    <div class="image-map-list">
        <a href="javascript:void(0);" id="m3-1" class="btn" onclick="goDetail('B133002'); return false;">가야산</a>
        <a href="javascript:void(0);" id="m3-2" class="btn" onclick="goDetail('B331001'); return false;">내장산</a>
        <a href="javascript:void(0);" id="m3-4" class="btn" onclick="goDetail('B231002'); return false;">무등산</a>
        <a href="javascript:void(0);" id="m3-5" class="btn" onclick="goDetail('B971002'); return false;">북한산</a>
        <a href="javascript:void(0);" id="m3-6" class="btn" onclick="goDetail('B301002'); return false;">설악산</a>
        <a href="javascript:void(0);" id="m3-7" class="btn" onclick="goDetail('B123002'); return false;">소백산</a>
        <a href="javascript:void(0);" id="m3-8" class="btn" onclick="goDetail('B014003'); return false;">지리산</a>
        <a href="javascript:void(0);" id="m3-9" class="btn" onclick="goDetail('B024002'); return false;">한려해상</a>
    </div>
</div>
<form id="contentsForm" action="goDetail">
    <input type="hidden" id="deptId" name="deptId" value="">
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