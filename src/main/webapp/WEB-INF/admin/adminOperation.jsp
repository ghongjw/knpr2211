<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="assets/js/lib/jquery-1.12.4.min.js"></script>
	<script src="assets/js/lib/toastr.min.js"></script>

<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="assets/style/infomations.css">

</head>
<body>
<div id="mod"></div>
<%@ include file="../common/headerAdmin.jsp" %>
<script>
function select1(){
	var category1 = $(".input1").val();
	$.ajax({
		type:'post',
		url:'findCategory2',
		data: category1,
		success: function(data){
		
	},
	error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
		
	}
	})
	
	
}



</script>
<div class="adminOperation">
	<form action="detailInfo" id="f">
			<div class="detailInformation">
				<h3 class="title">예약관리</h3>
				<select name="parkId" class="input1" style="width: inherit;" onchange="select1()" >
					<option value = "A">야영장</option>
					<option value = "B">대피소</option>
					<option value = "C">생태탐방원</option>
					<option value = "D">민박촌</option>		
				</select>
				<select name="parkId" class="input2" style="width: inherit;" onchange="select1()" >
							
				</select>
					<button class="searchbtn" style="width:10%; max-width:130px; min-width:100px;">
						<span class="searchB">조회</span>
					</button>
				</div>
			
		</form>

</div>




<%@ include file="../common/footer.jsp" %>

</body>
</html>