<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/style/infomations.css">
<script src="../../assets/js/lib/jquery-1.12.4.min.js"></script>

</head>
<body>
<script>
 function cancle(){
	 	var msg = confirm("삭제 하시겠습니까?");
	 	
	 	if (msg == true){
		$("#seq").val("${detail.seq}");
		$("#f").attr("action","adminCancleReserveData").submit();
		$("#f").submit();
	 	}
 }

 </script>
<form id="f" method ="post">
<input type="hidden" id= "seq"name ="seq">
</form>
<%@ include file="../common/headerAdmin.jsp" %>
<div class = "reservationDetailInfo">
	
	<div class="reservation">
	    <h3 class="title">예약상세</h3>
	</div>
	<table class = "idIdfo">
		<tr >
		<td colspan=3 style="border-bottom:1px solid black">
		<h2 style ="float:left;">예약자 정보</h2>
		</td>
		</tr>
		<tr class = "bluetd">
			<td style="width:20%">이름(아이디)</td>
			<td style="width:40%">연락처</td>
			<td style="width:40%">이메일 주소</td>
		</tr>
		<tr>
			<td style="width:20%; border-right:1px solid rgba(0,0,0,0.3);" >${user.name }(${user.id })</td>
			<td style="width:40%; border-right:1px solid rgba(0,0,0,0.3);">${user.mobile }</td>
			<td style="width:40%">${user.email }</td>
		</tr>
		<tr>
			<td colspan=3 style="height:10px;  border-bottom:1px solid rgba(0,0,0,0.3);"></td>
		</tr>
	</table>
	
	<table class = "idIdfo" style="margin:70px auto;" >
		<tr style="border-bottom:1px solid black">
		<td colspan=2><h2 >예약내역</h2></td>
		</tr>
		<tr style="border-bottom:1px solid rgba(0,0,0,0.3);">
		<td>예약번호</td>
		<td>${detail.seq }</td>
		</tr>
		<tr style="border-bottom:1px solid rgba(0,0,0,0.3);">
		<td>예약일시</td>
		<td>${detail.orderTime }</td>
		</tr>
		<tr style="border-bottom:1px solid rgba(0,0,0,0.3);">
		<td>예약상품</td>
		<td>[ ${detail.getNameCategory2() } ] ${detail.getNameCategory3() } ${detail.getNameCategory4() }  ${detail.getRoom() }</td>
		</tr>
		<tr style="border-bottom:1px solid rgba(0,0,0,0.3);">
		<td>사용기간</td>
		<td>${detail.period }</td>
		</tr>
		<tr style="border-bottom:1px solid rgba(0,0,0,0.3);">
		<td>예약인원</td>
		<td>${detail.people }</td>
		</tr>
		<tr style="border-bottom:1px solid rgba(0,0,0,0.3);">
		<td>결제상태</td>
		<td>${detail.checked }</td>
		</tr>
			<tr>
			<td colspan=2 style="height:10px;"></td>
		</tr>
	</table>
	
	<table class = "idIdfo" style = "margin-bottom:30px;">
		<tr >
		<td colspan= "2" style="border-bottom:1px solid black">
		<h2 style ="float:left;">총 이용 금액</h2>
		</td>
		</tr>
		<tr class = "bluetd">
		<td colspan= "2" style="font-size:30px;"> ${detail.nameCategory1 }</td>
		</tr>
		<tr>
		<td style="float:left"> [ ${detail.getNameCategory2() } ] ${detail.getNameCategory3() } ${detail.getNameCategory4() }  ${detail.getRoom() } </td>
		<td style="text-align:right;">${detail.price }</td>
		</tr>
		<tr>
		<td colspan=2>${detail.period }</td>
		</tr>
		<c:if test="${detail.isDone==false }">
		<tr style="background: rgba(0,0,0,0.08);">
		<td style="font-weight:bold; float:left; font-size:30px;"> 결제(예정)금액 </td>
		<td style="color:red; font-size:30px; text-align:right;">${detail.price }원</td>
		</tr>

		<tr >
		<td colspan=2 style="padding: 0; text-align:right">
		<c:if test="${detail.checked=='결제완료' }">
				<button class = "modiA" onclick="location.href='adminReservationModify?memberId=${user.id }&reserve=future&page=0&size=10'; return false;">리스트로가기</button>
		
		</c:if>
		<button class = "modiB" onclick="cancle()">취소</button>
		</td>
		</tr>
		</c:if>	
		
		<c:if test="${detail.isDone==true }">
		<tr style="background: rgba(0,0,0,0.08);">
		<td style="font-weight:bold; float:left; font-size:30px;"> 금액 </td>
		<td style="color:black; font-size:30px; text-align:right;">${detail.price }원</td>
		</tr>
		</c:if>	
	</table>
</div>
	
<%@ include file="../common/footer.jsp" %>


</body>
</html>