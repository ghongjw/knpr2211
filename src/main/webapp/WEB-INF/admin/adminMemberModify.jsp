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
		
	if(${member.member=="admin"}){
		$("input:radio[name='member']:radio[value='admin']").attr('checked',true)
	}if(${member.member=="normal"}){
		$("input:radio[name='member']:radio[value='normal']").attr('checked',true)
	}
})
let memberModify = function(num){
	var url = ""; 
	var msg;
	if(num == 0){
		var msg = confirm('수정하시겠습니까?')
			if(msg==true){
				url = "adminMemberModifyConfirm"
			$("#f").attr("action",url).submit();
			}
		}
	if(num == 1){
		msg = confirm('삭제하시겠습니까?')
			if(msg==true){
				url = "adminDeleteConfirm"
					$("#f").attr("action",url).submit();
			
			}
		}
	if(num == 2){
		msg = confirm('리스트로 돌아갈까요?')
		console.log(msg)
			if(msg==true){
				console.log("d")
				url = "adminMemberList?page=0&size=10";
				$(location).attr('href',url);
				
			}
		}
	
}
	 	
	 	</script>
	<%@ include file="../common/headerAdmin.jsp"%>
	<div id="wrap_memberList" class="sub">
		<div class="mypage">
			<h3 class="title">회원 수정</h3>
			<div class="tab-content">
				<div class="memberModify" id="tab1">
				<form id="f" method = "post">
				<table id = "mModifyTable">
				<tr>
					<td style="width: 30%">아이디</td>
					<td style="width: 60%;"><input type = "text" class="input1" name = "id" value = "${member.id }" readOnly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type = "text" class="input1" name = "name" value = "${member.name }" ></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type = "text" class="input1" name = "email" value = "${member.email }" ></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type = "text" class="input1" name = "mobile" value = "${member.mobile }" ></td>
				</tr>
				<tr>
				<td>권한</td>
				<td><input type = "radio" id="admin" value = "admin" name = "member"> 관리자
				<input type = "radio" id="normal"value = "normal" name = "member"> 일반회원
				</td>
				</tr>
			<tr style="height:150px; text-align:center; line-height:100px;">
			<td colspan=2 >
				<input type = "hidden" value = "false" name = "deleted" >
				<button class="modiA" style="width:20%; margin-left:10px;" onclick = "memberModify('0'); return false;">회원수정</button>
				<button class="modiB" style="width:20%; margin-left:10px;" onclick = "memberModify('1'); return false;">회원삭제</button>
				<input class="modiA" style="width:20%; margin-left:10px;" type="reset" value = "입력초기화">
				<button class="modiB" style="width:20%; margin-left:10px;" onclick = "memberModify('2');return false;">취소</button>
				</td>
				</table>
				</form>
			</div>
		</div>
	</div>
</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>