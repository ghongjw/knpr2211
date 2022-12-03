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
<script>
		
		const urlParams = new URL(location.href).searchParams;
		const reserve = urlParams.get('reserve');
		const page = urlParams.get('page');
		const size = urlParams.get('size');
		
	$('document').ready(function(){
		
		if(reserve == "future"){
			$(".reserveTab").removeClass("is-active");
			$('#future').addClass("is-active");
		}else if(reserve == "past"){
			$(".reserveTab").removeClass("is-active");
			$('#past').addClass("is-active");
		}
		
		if(${reservations.isEmpty()}){
			$("#reservelist").html("<tr><td colspan = 7 >예약내역이 없습니다</td></tr>");
			
		}
		
		
	})
	
	let pageNum = function(num){
	var url = "reservedList?reserve="+reserve+"&page="+num+"&size=10"; 
	location.href=url;
		
}
	let send = function(clicked,data){
		console.log(clicked)
		console.log(data)
		url = "reservationDetail";
		$("input[name=seq]").val(data);
		$("input[name=payorcancle]").val(clicked);
		$("#f").attr("action",url).submit();
	}
</script>
</head>
<body>
<div id="mod"></div>
<%@ include file="../common/header.jsp" %>
<form id = "f" method = "post">
<input type = "hidden" name = "seq">
<input type = "hidden" name = "payorcancle">
</form>
<div class = "reservationInfo">
	
	<div class="reservation">
	    <h3 class="title">나의 예약목록</h3>
	</div>
	<div class="typeArea">
	    <a id = "future" class = "reserveTab is-active" href="reservedList?reserve=future&page=0&size=10">예약목록</a>
	    <a id = "past" class = "reserveTab" href="reservedList?reserve=past&page=0&size=10">지난예약목록</a>
	</div>
		<table class="table mem-list">

			<colgroup>
				<col style="width: 7%;">
				<col style="width: 7%;">
				<col style="width: 20%;">
				<col style="width: 20%;">
				<col style="width: 7%;">
				<col style="width: 5%;">
				<col style="width: 5%;">
			</colgroup>
			<thead class="thead">
				<tr>
					<th scope="col">예약상태</th>
					<th scope="col">구분</th>
					<th scope="col">상품명</th>
					<th scope="col">이용일자</th>
					<th scope="col">이용금액</th>
					<th scope="col">결제</th>
					<th scope="col">취소</th>
				</tr>
			</thead>
			<tbody class="tbody" id = "reservelist">
				<c:forEach var = "reserve" items = "${reservations}">
					
					<tr style="padding: 20px 143px;">
					<c:if test ="${reserve.getChecked() == '미결제' }"><td scope="col">예약</td></c:if>
					<c:if test ="${reserve.getChecked() == '결제완료' }"><td scope="col">결제완료</td></c:if>
					<td scope="col">${reserve.getNameCategory1() }</td>
					<td scope="col"><a onclick="send('pay','${reserve.getSeq()}')">[ ${reserve.getNameCategory2() } ] ${reserve.getNameCategory3() } ${reserve.getNameCategory4() }  ${resrve.getRoom() }
					</a></td>
					<td scope="col">${reserve.getPeriod() }</td>
					<td scope="col">${reserve.getPrice() }</td>
					<c:if test="${param.reserve == 'future' }">
					<td scope="col" style="padding: 0;">
					<c:if test ="${reserve.getChecked()=='미결제' }">
					<button class = "modiA" onclick="send('pay','${reserve.getSeq()}')">결제</button>
					</c:if>
					<c:if test ="${reserve.getChecked()=='결제완료' }"> 결제완료
					</c:if>
					</td>
					<td scope="col" style="padding: 0;"><button class = "modiB" onclick="send('cancle','${reserve.getSeq()}')">취소</button></td>
					</c:if>
					<c:if test="${param.reserve == 'past' }">
					<td colspan = 2> - </td>
					</c:if>
					</tr>
					
				</c:forEach>
			</tbody>
			<tbody style="margin-top:10px;">
				<tr class = "page_tr" >
				<td colspan = "6" class = "page_td" style="padding-top:10px;">
			
					<c:forEach var = "i" begin="0" end = "${totalPage-1}">
						<c:choose>
						<c:when test="${i == param.page }">
						<button class = "index_paging" style = "background:#004ea2; color:white;" id = "pageNum" onclick = "pageNum('${i}')">
					${i + 1}
					</button>
						</c:when>
						<c:otherwise>
					<button class = "index_paging" id = "pageNum" onclick = "pageNum('${i}')">
					${i + 1}
					</button>
					</c:otherwise>
					</c:choose>
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>
	</div>

	
	
<%@ include file="../common/footer.jsp" %>

</body>
</html>