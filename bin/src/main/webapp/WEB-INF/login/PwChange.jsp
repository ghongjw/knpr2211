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

<script type="text/javascript">
var req;

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
    <span>홈</span><span>비밀번호 변경</span>
</div>
<div class="login">
    <h3 class="title">비밀번호 변경</h3>
   
<h3>
	<font color="red" id="msg">${msg } </font>
</h3><br>
    <form method="post" action="PwChangeSuccess">
        <input type="hidden" name="id" id="id" value="${FindPwId}"/> 
        <input type="hidden" name="member" value="normal" >
         <input type="hidden" class="input-text" id="Mobile" name="mobile" value="${FindMobile}">
         <input type="hidden" class="input-text" id="email" name="email" value="${FindEmail}">
         <input type="hidden" class="input-text" id="name" name="name" value="${FindName}">
         
        <input type="password" class="input-text"name="pw" id="pw"placeholder="비밀번호" /><br><br>
        <input type="password" class="input-text"name="PwCon" id="PwCon"placeholder="비밀번호확인" onkeyup="PwConfirm()"/><br><br>
        
        <div class="login-form">
            <button type="submit" class="btn btn-login" >비밀번호 변경 </button>
            <button type="button" class="btn btn-login" onclick="location.href='login'" > 취소</button>
        </div>
    </form>
</div>
			</div>
			
<%@ include file="../common/footer.jsp" %>


	</div>

</body>
</html>