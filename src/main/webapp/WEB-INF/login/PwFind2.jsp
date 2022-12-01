<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<meta name="viewport" content="width=device-width">
	
<script type="text/javascript">
var req;

function PwFindMailSend(){
	
	req = new XMLHttpRequest();
	req.onreadystatechange = printMsg;
	req.open('post', 'PwFindMailSend');
	req.send(document.getElementById('email').value);
	
}
function PwFindCheckAuth(){
	req = new XMLHttpRequest();
	req.onreadystatechange = printMsg;
	req.open('post', 'PwFindCheckAuth');
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
    <span>홈</span><span>비밀번호 찾기</span>
</div>
<div class="login">
    <h3 class="title">비밀번호 찾기</h3>
   
<h3>
	<font color="red" id="msg">${msg } </font>
</h3><br>
    <form method="post" action="PwChangeProc">
    <input type="hidden" name="id" id="id" value="${FindPwId}">

        <div class="ipin-form">
            
            <input type="text" class="input-text" title="이메일 주소" id="email" name="email">
              <button type="button" class="btn btn-ipin" onclick="PwFindMailSend()">이메일인증</button>
             <input type="text" class="input-text" placeholder="인증번호 입력" id="authNumber" name="mailnumber">
             <button type="button" class="btn btn-ipin" onclick="PwFindCheckAuth()">인증번호 확인</button><br><br>
           
        </div>
        
        <div class="login-form">
            <button type="submit" class="btn btn-login" >비밀번호 변경 </button>
            <button type="button" class="btn btn-login" onclick="location.href='index'" > 취소</button>
        </div>
    </form>
</div>
			</div>
			
<%@ include file="../common/footer.jsp" %>

</div>
</body>
</html>