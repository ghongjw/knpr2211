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
    <span>홈</span><span>비밀번호 찾기</span>
</div>
<div class="login">
    <h3 class="title">비밀번호 찾기</h3>
   
<h3>
	<font color="red" id="msg">${msg } </font>
</h3><br>
    <form method="post" action="PwFindIdProc">
    
    	<label>비밀번호를 찾고자하는 아이디를 입력해주세요. </label><br><br>
        <input type="text"class="input-text" placeholder="아이디를 입력해주세요" name="id" id="id" /> 
        
     
        <div class="login-form">
            <button type="submit" class="btn btn-login" >다음</button>
            <button type="button" class="btn btn-login" onclick="location.href='index'" > 취소</button>
        </div>
        <br>
        <br>
        <div>아이디가 기억나지 않는다면 ? <span onclick="location.href='IdFind'" style= color:blue;> 아이디 찾기</span></div>
    </form>
</div>
			</div>
			
<%@ include file="../common/footer.jsp" %>

</div>
</body>
</html>