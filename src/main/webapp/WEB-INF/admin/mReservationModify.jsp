<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/style/infomations.css">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>

</head>

<body>
<script type="text/javascript">

$('document').ready(function(){
	if(${member.member}=="admin"){
		$("input:radio[name='member']:radio[value='admin']").attr('checked',true)
	}if(${member.member}=="normal"){
		$("input:radio[name='member']:radio[value='normal']").attr('checked',true)
	}
})
let memberModify = function(num){
	var url = "memberModifyConfirm"; 

	
	$("#memberSearch").attr("action",url).submit();
}
	 	
	 	</script>
	<%@ include file="../common/headerAdmin.jsp"%>
	<div id="wrap_memberList" class="sub">
		<div class="mypage">
			<h3 class="title">회원 예약 조회</h3>
			<div class="tab-content">
				<div class="memberModify" id="tab1">
<!-- 				<form id="form" action = "" method = "post"> -->
<%-- 				<input type = "text" name = "id" value = "${member.id }" readOnly> --%>
<%-- 				<input type = "text" name = "name" value = "${member.name }" > --%>
<%-- 				<input type = "text" name = "email" value = "${member.email }" > --%>
<%-- 				<input type = "text" name = "mobile" value = "${member.mobile }" > --%>
<!-- 				<input type = "radio" id="admin" value = "admin" name = "member"> 관리자 -->
<!-- 				<input type = "radio" id="normal"value = "normal" name = "member"> 일반회원 -->
<!-- 				<input type = "hidden" value = "" name = "deleted" > -->
<!-- 				<button onclick = "memberModify('0')">회원수정</button> -->
<!-- 				<button onclick = "memberModify('1')">회원삭제</button> -->
<!-- 				<input type="reset" value = "입력초기화"> -->
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>