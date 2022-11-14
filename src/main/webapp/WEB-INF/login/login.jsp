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
				

</script>
<div class="page-location">
    <span>홈</span><span>로그인</span>
</div>
<div class="login">
    <h3 class="title">로그인</h3>

    <form id="loginForm" name="loginForm" method="post" action="" autocomplete="off">
        <input type="hidden" name="loginType" value="Member"/>
        <div class="login-form">
            <label for="mmbId" class="hidden-text">아이디</label>
            <input type="text" class="input-text" placeholder="아이디 입력" title="아이디" id="mmbId" name="mmbId" value="" onkeyup="funcArray.loginKeyPress(event);">
            <label for="passWd" class="hidden-text">비밀번호</label>
            <input type="password" class="input-text" placeholder="비밀번호 대,소문자 구분 9~15자로 입력" title="비밀번호" id="passWd" name="passWd" onkeyup="funcArray.loginKeyPress(event);">
            <button type="button" class="btn btn-login" onclick="funcArray.userLogin();">로그인</button>
        </div>
        <ul class="login-util">
            <li><a href="" target="_blank">아이디 찾기</a></li>
            <li><a href="" target="_blank">비밀번호 찾기</a></li>
        </ul>
    </form>

    <form id="nonLoginForm" name="nonLoginForm" method="post" action="" autocomplete="off">
        <input type="hidden" name="loginType" id="nonLoginType" value=""/>
        <input type="hidden" name="name" id="name" value=""/>
        <input type="hidden" name="di" id="di" value=""/>
        <input type="hidden" name="ci" id="ci" value=""/>
        <input type="hidden" name="birthday" id="birthday" value=""/>
        <input type="hidden" name="gender" id="gender" value=""/>
        <input type="hidden" name="mobileNo" id="mobileNo" value=""/>
        <div class="login-simle-wrap">
           
           
        </div>
        <div class="ipin-form" style="display: none;">
            <label for="txtMail" class="hidden-text">이메일 주소</label>
            <input type="text" class="input-text" placeholder="이메일 입력" title="이메일 주소" id="txtMail" name="txtMail">
            <label for="txtMobile" class="hidden-text">휴대폰 번호</label>
            <input type="text" class="input-text" placeholder="&#34;-&#34; 없이 휴대전화 번호 입력" title="휴대폰 번호" id="txtMobile" name="txtMobile">
            <button type="button" class="btn btn-ipin" onclick="funcArray.nonLogin();">실명인증</button>
        </div>
        <div class="board-bottom">
            <div class="center">
                <a href="register" class="btn btn-join">회원가입</a>
            </div>
        </div>
    </form>
</div>
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