<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<meta name="viewport" content="width=device-width">
	
<script type="text/javascript">
var req;

function MailSend(){
	
	req = new XMLHttpRequest();
	req.onreadystatechange = printMsg;
	req.open('post', 'MailSend');
	req.send(document.getElementById('email').value);
	
}
function checkAuth(){
	req = new XMLHttpRequest();
	req.onreadystatechange = printMsg;
	req.open('post', 'checkAuth');
	req.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
	var number = document.getElementById('authNumber').value;
	var data = {authNumber:number};
	data = JSON.stringify(data);
	req.send(data);
}

function printMsg(){
	var msg = document.getElementById('msg');
	msg.innerHTML = req.responseText;
}

</script>

<body>
	<div id="wrap" class="sub">

<%@ include file="../common/header.jsp" %>
			<div id="container">
				

<div class="page-location">
    <span>홈</span><span>회원정보수정</span>
</div>
<div class="login">
    <h3 class="title">회원정보수정</h3>
   
<h3>
	<font color="red" id="msg">${msg } </font>
</h3><br>
    <form method="post" action="RegisterProc">
        <input type="text"class="input-text" name="id" id="id"  value="${sessionScope.id}" readonly="readonly"/> 
       
       
       
        <input type="password" class="input-text"name="pw" id="pw"placeholder="비밀번호" /><br><br>
        
        <input type="password" class="input-text"name="PwCon" id="PwCon"placeholder="비밀번호확인" onkeyup="PwConfirm()"/><br><br>
        
        
        <input type="text" class="input-text" name="name" id="name" value="${sessionScope.name}" /><br><br>
        <input type="hidden" name="member" value="normal" >
        <div class="ipin-form">
            <label class="hidden-text">이메일 주소</label>
            <input type="text" class="input-text" value="${sessionScope.email}" title="이메일 주소" id="email" name="email">
              <button type="button" class="btn btn-ipin" onclick="MailSend()">이메일인증</button>
             <input type="text" class="input-text" placeholder="인증번호 입력" id="authNumber" name="mailnumber">
             <button type="button" class="btn btn-ipin" onclick="checkAuth()">인증번호 확인</button><br><br>
            <label for="txtMobile" class="hidden-text">휴대폰 번호</label>
            <input type="text" class="input-text" value="${sessionScope.mobile}" title="휴대폰 번호" id="Mobile" name="mobile">
          
        </div>
        
        <div class="login-form">
            <button type="submit" class="btn btn-login" >회원정보수정</button>
            <button type="button" class="btn btn-login" onclick="location.href='index'" > 취소</button>
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