<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<meta name="viewport" content="width=device-width">
	
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
    <span>홈</span><span>아이디 찾기</span>
</div>
<div class="login">
    <h3 class="title">아이디 찾기</h3>
   
<br>
   

        <div class="ipin-form">
            <label >회원님께서 등록하신 아이디는  <span> ${IdResult } </span>  입니다.</label>
           
              <button type="button" class="btn btn-refresh" onclick="location.href='login'">로그인</button>
            
             <button type="button" class="btn btn-refresh" onclick="location.href='PwFind'">비밀번호 찾기</button><br><br>
            
          
        </div>
       

</div>
			</div>
			
<%@ include file="../common/footer.jsp" %>
</div>
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